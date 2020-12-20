//
//  SearchNavigationView.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit

class SearchNavigationView: BaseNavigationView {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var buttonCancel: UIButton!
    
    class func loadFromNib() -> SearchNavigationView? {
        return self.loadFromNib(withName: "SearchNavigationView")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textFieldSearch.delegate = self
        buttonCancel.isHidden = true
        viewContainer.roundCorners(corners: [.topLeft,.bottomLeft], radius: bounds.height/2)
    }
    @IBAction func buttonSearchTapped(_ sender: Any) {
        textFieldSearch.becomeFirstResponder()
    }
    
    @IBAction func buttonCancelTapped(_ sender: Any) {
        textFieldSearch.text = nil
        textFieldDidEndEditing(textFieldSearch)
    }
}

extension SearchNavigationView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        imageLogo.alpha = 0.2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == nil || textField.text!.isEmpty {
            imageLogo.alpha = 1
            buttonCancel.isHidden = true
        } else {
            imageLogo.alpha = 0.2
            buttonCancel.isHidden = false
        }
        delegate?.searchText(textField.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(false)
    }
    
}
