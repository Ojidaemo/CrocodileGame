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
        showTeams()
        teamManager.teamResults.append(teamManager.ourTeam[0])
        teamManager.teamResults.append(teamManager.ourTeam[1])
        teamManager.saveData(dataToSave: teamManager.teamResults)
        print("saveData \(teamManager.teamResults)")
        teamManager.teamResults = teamManager.retrieveData()
        print("totalResults \(teamManager.teamResults)")
    }
    
    private func showTeamsAndScores() {
        if teamManager.ourTeam[1].score > teamManager.ourTeam[0].score {
            resultsView.labelOne.text = teamManager.teamTwo?.name
            resultsView.imageOne.image = UIImage(named: teamManager.teamTwo!.teamImage)
            resultsView.teamOneScore.text = String(teamManager.ourTeam[1].score)
            resultsView.labelTwo.text = teamManager.teamOne?.name
            resultsView.imageTwo.image = UIImage(named: teamManager.teamOne!.teamImage)
            resultsView.teamTwoScore.text = String(teamManager.ourTeam[0].score)
        } else {
            resultsView.labelOne.text = teamManager.teamOne?.name
            resultsView.imageOne.image = UIImage(named: teamManager.teamOne!.teamImage)
            resultsView.teamOneScore.text = String(teamManager.ourTeam[0].score)
            resultsView.labelTwo.text = teamManager.teamTwo?.name
            resultsView.imageTwo.image = UIImage(named: teamManager.teamTwo!.teamImage)
            resultsView.teamTwoScore.text = String(teamManager.ourTeam[1].score)
        }
    }
    
    private func showTeams() {
        if teamManager.ourTeam.count == 2 {
            resultsView.labelThree.isHidden = true
        } else if teamManager.ourTeam.count == 3 {
            resultsView.labelThree.isHidden = false
        }
    }
    
    func setDelegates() {
        resultsView.delegateRestartGame = self
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
