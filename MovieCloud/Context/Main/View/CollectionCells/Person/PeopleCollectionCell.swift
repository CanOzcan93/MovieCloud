//
//  PeopleCollectionCell.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit
import Observable

class PeopleCollectionCell: UICollectionViewCell {

    static let identifier = "PeopleCollectionCell"
    
    var viewModel: PersonListVM! {
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
        tableView.register(UINib(nibName: PersonTableCell.identifier, bundle: nil), forCellReuseIdentifier: PersonTableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        observe()
    }
    
    func observe() {
        viewModel.personList.observe { [weak self] (_, _) in
            self?.tableView.reloadData()
        }.add(to: &disposal)
    }
    
}

extension PeopleCollectionCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.numberOfPeople == 0 {
            tableView.setEmptyMessage("Kritere Uygun İçerik Bulunamadı")
        } else {
            self.tableView.restore()
        }

        return viewModel.numberOfPeople
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableCell.identifier, for: indexPath) as! PersonTableCell
        cell.viewModel = viewModel.getPersonItemVM(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 129
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToPerson(indexPath.row)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !viewModel.isLoadingList){
            viewModel.isLoadingList = true
            viewModel.loadMoreItemsForList()
        }
    }

}
