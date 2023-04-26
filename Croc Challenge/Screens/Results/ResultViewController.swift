//
//  ResultViewController.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-25.
//

import UIKit

class ResultViewController: UIViewController {

    private var resultTableView = ResultTableView()
    private let teamManager = TeamsManager.shared
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Таблица лидеров"
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(resultTableView)
        setupConstrains()
        teamManager.teamResults = teamManager.retrieveData()
        print("totalResults \(teamManager.teamResults)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
        
    private func setupConstrains() {
        
        resultTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
