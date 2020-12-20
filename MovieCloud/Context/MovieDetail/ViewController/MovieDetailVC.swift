//
//  MovieDetailVC.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit
import Observable

class MovieDetailVC: BaseVC {
    
    @IBOutlet weak var stackViewCast: UIStackView!
    @IBOutlet weak var imageViewHeader: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelLanguage: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    var viewModel: MovieDetailVM! {
        didSet {
            observe()
            setModelValue()
        }
    }
    
    private var disposal = Disposal()
    
    override var navigationType: NavigationType {
        return .back
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FİLM"
        guard let vm = data as? MovieDetailVM else {
            return
        }
        viewModel = vm
    }
    
    override func configureUI() {
        super.configureUI()
    }
    
    private func observe() {
        viewModel.cast.observe { [weak self] (_, _) in
            if let self = self {
                for person in self.viewModel.cast.wrappedValue {
                    self.createCastView(person)
                }
            }
            
        }.add(to: &disposal)
    }
    
    func setModelValue() {
        title = viewModel.title
        imageViewHeader.setImageURL(viewModel.posterURL)
        labelTitle.text = "\(viewModel.title) (\(viewModel.originalTitle))"
        labelGenre.text = "Tür: \(viewModel.genres)"
        labelDate.text = "Çıkış Tarihi: \(viewModel.releaseDate)"
        labelLanguage.text = "Orjinal Dil: \(viewModel.originalLanguage)"
        labelDescription.text = viewModel.overview
        viewModel.loadCast()
    }
    
    private func createCastView(_ person : Person) {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.translatesAutoresizingMaskIntoConstraints = false
        stackViewCast.addArrangedSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: stackViewCast.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: stackViewCast.trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        let gesture = BaseTapGestureRecognizer(target: self, action: #selector(MovieDetailVC.castClicked(sender:)))
        gesture.tag = person.id
        containerView.isUserInteractionEnabled = true
        containerView.addGestureRecognizer(gesture)
        
        let imageView = UIImageView()
        imageView.setImageURL(person.profile_path)
        imageView.backgroundColor = .primaryColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.7).isActive = true
        
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = person.name
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(label)
        label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc
    private func castClicked(sender: BaseTapGestureRecognizer) {
        if let id = sender.tag { viewModel.goToPerson(id) }
    }
    
}


