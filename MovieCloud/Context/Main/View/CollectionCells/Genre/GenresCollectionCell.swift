//
//  GenresCollectionCell.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit
import Observable

class GenresCollectionCell: UICollectionViewCell {

    static let identifier = "GenresCollectionCell"
    
    var viewModel: GenreListVM! {
        didSet {
            configureUI()
        }
    }
    private var disposal = Disposal()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureUI() {
        tableView.register(UINib(nibName: GenreTableCell.identifier, bundle: nil), forCellReuseIdentifier: GenreTableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        observe()
    }
    
    func observe() {
        viewModel.genreList.observe { [weak self] (_, _) in
            self?.tableView.reloadData()
        }.add(to: &disposal)
    }
    
}

extension GenresCollectionCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.numberOfGenres == 0 {
            tableView.setEmptyMessage("Kritere Uygun İçerik Bulunamadı")
        } else {
            self.tableView.restore()
        }

        return viewModel.numberOfGenres
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenreTableCell.identifier, for: indexPath) as! GenreTableCell
        cell.viewModel = viewModel.getGenreItemVM(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToGenre(indexPath.row)
    }
}
