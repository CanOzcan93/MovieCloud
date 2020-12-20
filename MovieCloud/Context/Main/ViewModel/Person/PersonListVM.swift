//
//  PersonListVM.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 20.12.2020.
//

import UIKit
import Observable

class PersonListVM: BaseVM {
    
    var personResponse: ResponsePerson!
    var isLoadingList : Bool = false
    var isPopular: Bool!
    var personList = MutableObservable([Person]())

    override init() {}
    
    init(_ personResponse: ResponsePerson) {
        self.personResponse = personResponse
        self.personList.wrappedValue = personResponse.results
    }
    
    var numberOfPeople: Int {
        return personList.wrappedValue.count
    }
    
    func getPersonItemVM(_ index:Int) -> PersonItemVM? {
        if numberOfPeople > index {
            return PersonItemVM(personList.wrappedValue[index])
        }
        return nil
    }
    
    func loadMoreItemsForList() {
        if !(personResponse.page+1 > personResponse.total_pages) {
            NetworkManager.shared.response(.getPopularPeople(page: personResponse.page+1), ResponsePerson.self) { (response) in
                self.personResponse.page = response.page
                self.isLoadingList = false
                var newList = [Person]()
                newList.append(contentsOf: self.personList.wrappedValue)
                newList.append(contentsOf:response.results)
                self.personList.wrappedValue = newList
            }
        }
    }
    
    func goToPerson(_ index:Int) {
        if let person = getPersonItemVM(index) {
            NetworkManager.shared.response(.getPerson(id: person.id), Person.self) { (response) in
                NavigationManager.shared.navigateTo(.personDetail, PersonDetailVM(response))
            }
        }
    }
    
    
    
}
