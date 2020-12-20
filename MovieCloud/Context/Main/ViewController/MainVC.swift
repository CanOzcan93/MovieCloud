//
//  MainVC.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit
import Observable

class MainVC: BaseVC {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonMovie: PageControlButton!
    @IBOutlet weak var buttonGenre: PageControlButton!
    @IBOutlet weak var buttonPerson: PageControlButton!
    
    let viewModel = MainVM()
    var disposal = Disposal()
    
    override var navigationType: NavigationType {
        return .main
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        observe()
        viewModel.getFirstData()
    }
    
    override func configureUI() {
        super.configureUI()
        configureCollectionView()
        configureButtons(0)
    }
    
    private func observe() {
        viewModel.movieList.observe { [weak self] (_, _) in
            self?.collectionView.reloadData()
        }.add(to: &disposal)
        viewModel.genres.observe { [weak self] (_, _) in
            self?.collectionView.reloadData()
        }.add(to: &disposal)
        viewModel.personList.observe { [weak self] (_, _) in
            self?.collectionView.reloadData()
        }.add(to: &disposal)
    }
    
    private func configureButtons(_ tag: Int) {
        buttonMovie.isActive = tag == 0
        buttonGenre.isActive = tag == 1
        buttonPerson.isActive = tag == 2
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: MoviesCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: MoviesCollectionCell.identifier)
        collectionView.register(UINib(nibName: GenresCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: GenresCollectionCell.identifier)
        collectionView.register(UINib(nibName: PeopleCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: PeopleCollectionCell.identifier)
    }

    @IBAction func buttonPageControlTapped(_ sender: PageControlButton) {
        configureButtons(sender.tag)
        collectionView.scrollToItem(at: IndexPath(row: sender.tag, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    override func searchText(_ text: String?) {
        if text == nil || text!.isEmpty {
            viewModel.getFirstData()
        } else {
            viewModel.search(text!)
        }
    }
    
}


extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == viewModel.movieIndex {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionCell.identifier, for: indexPath) as! MoviesCollectionCell
            if let vm = viewModel.getMovieListVM(indexPath.row) {
                vm.isPopular = true
                cell.viewModel = vm
            }
            return cell
        } else if indexPath.row == viewModel.genreIndex{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenresCollectionCell.identifier, for: indexPath) as! GenresCollectionCell
            if let vm = viewModel.getGenreListVM(indexPath.row) {
                cell.viewModel = vm
            }
            return cell
        } else if indexPath.row == viewModel.personIndex {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCollectionCell.identifier, for: indexPath) as! PeopleCollectionCell
            if let vm = viewModel.getPersonListVM(indexPath.row) {
                vm.isPopular = true
                cell.viewModel = vm
            }
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        configureButtons(page)
    }
    
}
