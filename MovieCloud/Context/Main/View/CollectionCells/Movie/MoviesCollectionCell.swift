//
//  MoviesCollectionCell.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit
import Observable

class MoviesCollectionCell: UICollectionViewCell {

    static let identifier = "MoviesCollectionCell"
    
    var viewModel: MovieListVM! {
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
        tableView.register(UINib(nibName: MovieTableCell.identifier, bundle: nil), forCellReuseIdentifier: MovieTableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        observe()
    }
    
    func observe() {
        viewModel.movieList.observe { [weak self] (_, _) in
            self?.tableView.reloadData()
        }.add(to: &disposal)
    }
    
}

extension MoviesCollectionCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.numberOfMovies == 0 {
            tableView.setEmptyMessage("Kritere Uygun İçerik Bulunamadı")
        } else {
            self.tableView.restore()
        }

        return viewModel.numberOfMovies
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableCell.identifier, for: indexPath) as! MovieTableCell
        cell.viewModel = viewModel.getMovieItemVM(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 129
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToMovieDetail(indexPath.row)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !viewModel.isLoadingList){
            viewModel.isLoadingList = true
            viewModel.loadMoreItemsForList()
        }
    }
}
