//
//  TeamManager.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-22.
//

import UIKit

class TeamsManager {
    
    static let shared = TeamsManager()
    
    var question = 0
    var currentTeam = 0
    var teamOne: Teams?
    var teamTwo: Teams?
    var ourTeam: [Teams] = []
    var teamResults: [Teams] = []
    
    var teams: [Teams] = [
        Teams(name: "Ковбои", score: 0, teamImage: Resources.Image.cowboy),
        Teams(name: "Стройняшки", score: 0, teamImage: Resources.Image.burger),
        Teams(name: "Красотки", score: 0, teamImage: Resources.Image.nails),
        Teams(name: "Лягушки", score: 0, teamImage: Resources.Image.frog)
    ]
    
    func generateRandomTeams() {
        guard let firstTeam = teams.randomElement(),
              let secondTeam = teams.filter({ $0 != firstTeam }).randomElement() else {
            return
        }
        teamOne = firstTeam
        teamTwo = secondTeam
        ourTeam.append(teamOne!)
        ourTeam.append(teamTwo!)
    }
    
    func teamCorrectAnswer() {
        ourTeam[currentTeam].score += 1
    }
    
    func nextTeam() -> (currentTeam: Teams, nextTeam: Teams) {
        let current = ourTeam[currentTeam]
        currentTeam += 1
        if currentTeam == ourTeam.count {
            currentTeam = 0
        }
        let next = ourTeam[currentTeam]
        return (current, next)
    }
    
    // Saving to UserDefaults
    let defaults = UserDefaults.standard
    
    func saveData(dataToSave: [Teams]) {
        let data = try? JSONEncoder().encode(dataToSave)
        defaults.set(data, forKey: "teamResults")
    }
    
    // Retrieving from UserDefaults
    func retrieveData() -> [Teams] {
        if let savedData = defaults.object(forKey: "teamResults") as? Data,
           let savedTeam = try? JSONDecoder().decode([Teams].self, from: savedData) {
            return savedTeam
        }
        return []
    }
}


