//
//  GenreDetailVC.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 21.12.2020.
//

import UIKit
import Observable

class GenreDetailVC: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    
    override var navigationType: NavigationType {
        return .back
    }
    var viewModel: MovieListVM! {
        didSet {
            observe()
        }
    }
    
    private var disposal = Disposal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TÜR"
        guard let vm = data as? MovieListVM else { return }
        viewModel = vm
    }
    
    override func configureUI() {
        super.configureUI()
        tableView.register(UINib(nibName: MovieTableCell.identifier, bundle: nil), forCellReuseIdentifier: MovieTableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func observe() {
        viewModel.movieList.observe { [weak self] (_, _) in
            self?.tableView.reloadData()
        }.add(to: &disposal)
    }
}

extension GenreDetailVC: UITableViewDelegate, UITableViewDataSource {
    
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
