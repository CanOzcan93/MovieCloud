//
//  SplashVC.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit

class SplashVC: UIViewController {
    
    let topView = UIView()
    let bottomView = UIView()
    let height = UIScreen.main.bounds.height
    let imageViewLogo = UIImageView(image: UIImage(named: "logo"))
    
    var topConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
    
    let viewModel = SplashVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        delay(1) {
            self.startAnimate()
        }
    }
    
    func configureUI() {
        imageViewLogo.contentMode = .scaleAspectFit
        imageViewLogo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageViewLogo)
        imageViewLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageViewLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageViewLogo.widthAnchor.constraint(equalToConstant: 240).isActive = true
        imageViewLogo.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        topView.backgroundColor = .black
        topView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topView)
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: height / 2).isActive = true
        topConstraint = topView.topAnchor.constraint(equalTo: view.topAnchor)
        topConstraint.isActive = true
        
        bottomView.backgroundColor = .black
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)
        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: height / 2).isActive = true
        bottomConstraint = bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        bottomConstraint.isActive = true
    }
    
    private func startAnimate() {
        UIView.animate(withDuration: 1.2, animations: {
            self.topConstraint.constant = -(self.height / 2)
            self.bottomConstraint.constant = self.height / 2
            self.view.layoutIfNeeded()
        }) { (value) in
            delay(1) {
                self.viewModel.prepare()
            }
        }
    }
    
}
