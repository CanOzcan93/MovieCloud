//
//  PersonDetailVC.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit

class PersonDetailVC: BaseVC {
    
    @IBOutlet weak var imageViewPerson: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBirthDate: UILabel!
    @IBOutlet weak var labelBirthPlace: UILabel!
    @IBOutlet weak var labelPopularity: UILabel!
    @IBOutlet weak var labelMovies: UILabel!
    
    var viewModel: PersonDetailVM! {
        didSet {
            setModelValue()
        }
    }
    
    override var navigationType: NavigationType {
        return .back
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "OYUNCU"
        guard let vm = data as? PersonDetailVM else {
            return
        }
        viewModel = vm
    }
    
    func setModelValue() {
        title = viewModel.name
        imageViewPerson.setImageURL(viewModel.profilePath)
        labelName.text = viewModel.name
        labelBirthDate.text = "Doğum Tarihi: \(viewModel.birthday)"
        labelBirthPlace.text = "Çıkış Tarihi: \(viewModel.place_of_birth)"
        labelPopularity.text = "Popülarite: \(Int(viewModel.popularity.rounded()))"
        labelMovies.text = "Ayrıca Oynadığı Filmler:\n\(viewModel.alsoKnown)"
    }
    
}
