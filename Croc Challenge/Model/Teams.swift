//
//  Teams.swift
//  Croc Challenge
//
//  Created by Daniil Kulikovskiy on 20.04.2023.
//

import Foundation

struct Teams {
    let name: String
    var score: Int
    
    static func showTeam() -> [Teams] {
        var post = [Teams]()
        post.append(Teams(name: "Ковбои", score: 0))
        post.append(Teams(name: "Стройняшки", score: 0))
        post.append(Teams(name: "Красотки", score: 0))
        return post
    }
}
