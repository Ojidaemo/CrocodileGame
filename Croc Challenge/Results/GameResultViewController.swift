//
//  GameResultViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class GameResultViewController: UIViewController {
    
    private let resultsView = ResultsView()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(resultsView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        resultsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultsView.topAnchor.constraint(equalTo: view.topAnchor),
            resultsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            resultsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultsView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}
