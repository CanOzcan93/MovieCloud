//
//  PersonTableCell.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit

class PersonTableCell: UITableViewCell {

    static let identifier = "PersonTableCell"
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPopularity: UILabel!
    @IBOutlet weak var imageViewPoster: UIImageView!
    
    var viewModel: PersonItemVM! {
        didSet {
            configureUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewContainer.layer.cornerRadius = 10
        viewContainer.clipsToBounds = true
//        selectedView.alpha = 0
    }
    
    func configureUI() {
        labelTitle.text = viewModel.name
        labelPopularity.text = "Popülarite: \(Int(viewModel.popularity.rounded()))"
        if !viewModel.profilePath.isEmpty {
            imageViewPoster.setImageURL(viewModel.profilePath) {
                if ImageHelper.shared.imagesDic[self.viewModel.profilePath] == nil {
                    self.imageViewPoster.image = nil
                }
            }
        }
        
    }
    
}
