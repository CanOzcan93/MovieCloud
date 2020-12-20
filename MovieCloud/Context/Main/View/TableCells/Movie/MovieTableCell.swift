//
//  MovieTableCell.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit

class MovieTableCell: UITableViewCell {
    
    static let identifier = "MovieTableCell"
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelPopularity: UILabel!
    @IBOutlet weak var imageViewPoster: UIImageView!
    
    var viewModel: MovieItemVM! {
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
        labelTitle.text = viewModel.title
        labelDate.text = String(viewModel.releaseDate.prefix(4))
        labelPopularity.text = "Popülarite: \(Int(viewModel.popularity.rounded()))"
        if !viewModel.posterURL.isEmpty {
            imageViewPoster.setImageURL(viewModel.posterURL) {
                if ImageHelper.shared.imagesDic[self.viewModel.posterURL] == nil {
                    self.imageViewPoster.image = nil
                }
            }
        }
        
    }
    
}
