//
//  BaseVC.swift
//  MovieCloud
//
//  Created by Altamira Macbook on 19.12.2020.
//

import UIKit


enum NavigationType {
    case back
    case main
    case none
}

class BaseVC: UIViewController, NavigationViewDelegate {
    
    var navigationView: BaseNavigationView?
    var topAnchorConstant: CGFloat = 0
    
    override var title: String? {
        didSet {
            self.navigationView?.title = title ?? ""
        }
    }
    
    var navigationType: NavigationType {
        return .none
    }
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        setBackground()
        addNavigationView()
    }
    
    private func setBackground() {
        guard let view = view as? GradientView else {
            return
        }
        view.firstColor = .backgroundColor
        view.secondColor = .backgroundGradientColor
    }
    
    private func addNavigationView() {
        if let navigationView = getNavigationView() {
            self.navigationView = navigationView
            navigationView.delegate = self
            navigationView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(navigationView)
            navigationView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            navigationView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            topAnchorConstant = (deviceHasTopNotch ? 44 : 20)
            navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: topAnchorConstant).isActive = true
            navigationView.heightAnchor.constraint(equalToConstant: 53).isActive = true
        }
    }
    
    private func getNavigationView() -> BaseNavigationView? {
        switch navigationType {
        case .main:
            return SearchNavigationView.loadFromNib()
        case .back:
            return TitleNavigationView.loadFromNib()
        default:
            return nil
        }
    }
    
    func searchText(_ text: String?) {}
    
}
