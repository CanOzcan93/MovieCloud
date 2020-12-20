//
//  GenreTableCell.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit

class GenreTableCell: UITableViewCell {
    
    static let identifier = "GenreTableCell"
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    var viewModel: GenreItemVM! {
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
    
    
    private func configureUI () {
        labelTitle.text = viewModel.name
    }
    
}
