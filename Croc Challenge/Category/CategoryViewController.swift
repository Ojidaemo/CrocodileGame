//
//  CategoryViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class CategoryViewController: UIViewController {

    private let categoryView = CategoryView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setDelegates()
        view.addSubview(categoryView)
        setupConstraints()
    }
    
    func setDelegates() {
        categoryView.delegateStartGame = self
    }
    
    private func setupConstraints() {
        
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: view.topAnchor),
            categoryView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}

extension CategoryViewController: startGameProtocol {
    func startGamePressed(sender: UIButton) {
        let gameVC = GameViewController()
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
}
