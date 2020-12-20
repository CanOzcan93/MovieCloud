//
//  TitleNavigationView.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit

class TitleNavigationView: BaseNavigationView {
    
    class func loadFromNib() -> TitleNavigationView? {
        return self.loadFromNib(withName: "TitleNavigationView")
    }
    
    @IBOutlet weak var labelTitle: UILabel!
    
    override var title: String {
        didSet {
            labelTitle.text = title
        }
    }
    
    @IBAction func buttonBackTapped(_ sender: Any) {
        NavigationManager.shared.popViewController()
    }
    
}
