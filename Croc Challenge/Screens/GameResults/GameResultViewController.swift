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
        showTeamsLabels()
        saveToDefaults()
    }
    
    private func saveToDefaults() {
        teamManager.teamResults.append(contentsOf: teamManager.ourTeam)
        teamManager.saveData(dataToSave: teamManager.teamResults)
        print("saveData \(teamManager.teamResults)")
        print("totalResults \(teamManager.teamResults)")
    }
    
    private func showTeamsAndScores() {
        let sortedTeams = teamManager.ourTeam.sorted { $0.score > $1.score }

        resultsView.labelOne.text = sortedTeams[0].name
        resultsView.labelOne.backgroundColor = UIColor(named: Resources.Colors.winColour)
        resultsView.scoreLabelOne.backgroundColor = UIColor(named: Resources.Colors.winColour)
        resultsView.imageOne.image = UIImage(named: sortedTeams[0].teamImage)
        resultsView.teamOneScore.text = String(sortedTeams[0].score)

        resultsView.labelTwo.text = sortedTeams[1].name
        resultsView.imageTwo.image = UIImage(named: sortedTeams[1].teamImage)
        resultsView.teamTwoScore.text = String(sortedTeams[1].score)

        if sortedTeams.count >= 3 {
            resultsView.labelThree.text = sortedTeams[2].name
            resultsView.imageThree.image = UIImage(named: sortedTeams[2].teamImage)
            resultsView.teamThreeScore.text = String(sortedTeams[2].score)
        }

        if sortedTeams.count == 4 {
            resultsView.labelFour.text = sortedTeams[3].name
            resultsView.imageFour.image = UIImage(named: sortedTeams[3].teamImage)
            resultsView.teamFourScore.text = String(sortedTeams[3].score)
        }
    }
    
    private func showTeamsLabels() {
        switch teamManager.ourTeam.count {
        case 2:
            print("Two Teams")
            resultsView.labelThree.isHidden = true
            resultsView.labelFour.isHidden = true
        case 3:
            print("Three Teams")
            resultsView.labelThree.isHidden = false
            resultsView.labelFour.isHidden = true
        case 4:
            print("Four Teams")
            resultsView.labelThree.isHidden = false
            resultsView.labelFour.isHidden = false
        default:
            print("Default")
            return
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
