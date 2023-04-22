//
//  TeamManager.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-22.
//

import UIKit

class TeamsManager {
    
    static let shared = TeamsManager()
    
    var teamOne: Teams?
    var teamTwo: Teams?
    
    let teams: [Teams] = [
        Teams(name: "Ковбои", score: 0, teamImage: UIImage(named: Resources.Image.cowboy)!),
        Teams(name: "Стройняшки", score: 0, teamImage: UIImage(named: Resources.Image.burger)!),
        Teams(name: "Красотки", score: 0, teamImage: UIImage(named: Resources.Image.nails)!),
        Teams(name: "Лягушки", score: 0, teamImage: UIImage(named: Resources.Image.frog)!)
    ]
    
    func generateRandomTeams() {
        guard let firstTeam = teams.randomElement(),
              let secondTeam = teams.filter({ $0 != firstTeam }).randomElement() else {
            return
        }
        
        teamOne = firstTeam
        teamTwo = secondTeam
    }
}
