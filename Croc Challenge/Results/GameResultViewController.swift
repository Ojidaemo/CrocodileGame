//
//  GameResultViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class GameResultViewController: UIViewController {
    
    private let resultsView = ResultsView()
    private let teamManager = TeamsManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Результаты"
        view.backgroundColor = .clear
        setDelegates()
        view.addSubview(resultsView)
        setupConstraints()
        showTeamsAndScores()
    }
    
    func setDelegates() {
        resultsView.delegateRestartGame = self
    }
    
    private func showTeamsAndScores() {
        resultsView.labelOne.text = teamManager.teamOne?.name
        resultsView.labelTwo.text = teamManager.teamTwo?.name
        resultsView.imageOne.image = teamManager.teamOne?.teamImage
        resultsView.imageTwo.image = teamManager.teamTwo?.teamImage
        resultsView.teamOneScore.text = String(teamManager.ourTeam[0].score)
        resultsView.teamTwoScore.text = String(teamManager.ourTeam[1].score)
        showTeams()
    }
    
    private func showTeams() {
        if teamManager.ourTeam.count == 2 {
            resultsView.labelThree.isHidden = true
        } else if teamManager.ourTeam.count == 3 {
            resultsView.labelThree.isHidden = false
        }
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

extension GameResultViewController: restartGameProtocol {
    func restartGamePressed(sender: UIButton) {
        let mainVC = MainViewController()
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
}
    
