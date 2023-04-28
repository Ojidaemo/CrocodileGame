//
//  QuestionsBox.swift
//  Croc Challenge
//
//  Created by Daniil Kulikovskiy on 20.04.2023.
//

import UIKit

struct QuestionsBox {
    
    var currentTeam = 0
    var score = 0
    
    let questionsAnimals = [
        Questions(text: "Elephant", answer: "Animals"),
        Questions(text: "Wolf", answer: "Animals"),
        Questions(text: "Lion", answer: "Animals"),
        Questions(text: "Cat", answer: "Animals"),
        Questions(text: "Giraffe", answer: "Animals"),
        Questions(text: "Eagle", answer: "Animals"),
        Questions(text: "Tiger", answer: "Animals"),
        Questions(text: "Zebra", answer: "Animals"),
        Questions(text: "Wolverine", answer: "Animals"),
        Questions(text: "Squirrel", answer: "Animals"),
        Questions(text: "Fox", answer: "Animals"),
        Questions(text: "Bear", answer: "Animals"),
        Questions(text: "Monkey", answer: "Animals"),
        Questions(text: "Elk", answer: "Animals"),
        Questions(text: "Giraffe", answer: "Animals"),
        Questions(text: "Turtle", answer: "Animals"),
        Questions(text: "Kangaroo", answer: "Animals"),
        Questions(text: "Cheetah", answer: "Animals"),
        Questions(text: "Crocodile", answer: "Animals"),
        Questions(text: "Dolphin", answer: "Animals"),
        Questions(text: "Whale", answer: "Animals")
    ]
    
    let questionsFood = [
        Questions(text: "Burger", answer: "Food"),
        Questions(text: "Apple", answer: "Food"),
        Questions(text: "Pizza", answer: "Food"),
        Questions(text: "Spaghetti", answer: "Food"),
        Questions(text: "Orange", answer: "Food"),
        Questions(text: "Tomato", answer: "Food"),
        Questions(text: "Sushi", answer: "Food"),
        Questions(text: "Strawberry", answer: "Food"),
        Questions(text: "Rice", answer: "Food"),
        Questions(text: "Eggs", answer: "Food"),
        Questions(text: "Bread", answer: "Food"),
        Questions(text: "Vegetables", answer: "Food"),
        Questions(text: "Fruits", answer: "Food"),
        Questions(text: "Ice cream", answer: "Food"),
        Questions(text: "Pasta", answer: "Food"),
        Questions(text: "Fish", answer: "Food"),
        Questions(text: "Meat", answer: "Food"),
        Questions(text: "Chips", answer: "Food"),
        Questions(text: "Croutons", answer: "Food"),
        Questions(text: "Pancakes", answer: "Food"),
        Questions(text: "Muffin", answer: "Food")
    ]
    
    let questionsPersonality = [
        Questions(text: "Madonna", answer: "Personalities"),
        Questions(text: "Keanu Reeves", answer: "Personalities"),
        Questions(text: "Jennifer Aniston", answer: "Personalities"),
        Questions(text: "Churchill", answer: "Personalities"),
        Questions(text: "Donald Trump", answer: "Personalities"),
        Questions(text: "Lionel Messi", answer: "Personalities"),
        Questions(text: "Elon Musk", answer: "Personalities"),
        Questions(text: "Steve Jobs", answer: "Personalities"),
        Questions(text: "Michael Jackson", answer: "Personalities"),
        Questions(text: "Mike Tyson", answer: "Personalities"),
        Questions(text: "Michael Schumacher", answer: "Personalities"),
        Questions(text: "Bruce Willis", answer: "Personalities"),
        Questions(text: "Kurt Cobain", answer: "Personalities"),
        Questions(text: "Angelina Jolie", answer: "Personalities"),
        Questions(text: "Kim Kardashian", answer: "Personalities"),
        Questions(text: "Tom Cruise", answer: "Personalities"),
        Questions(text: "Beyonce", answer: "Personalities"),
        Questions(text: "Elvis Presley", answer: "Personalities"),
        Questions(text: "George Clooney", answer: "Personalities"),
        Questions(text: "Bill Gates", answer: "Personalities")
    ]
    
    let questionsHobby = [
        Questions(text: "Tennis", answer: "Hobbies"),
        Questions(text: "Fishing", answer: "Hobbies"),
        Questions(text: "Skiing", answer: "Hobbies"),
        Questions(text: "Swimming", answer: "Hobbies"),
        Questions(text: "Soccer", answer: "Hobbies"),
        Questions(text: "Running", answer: "Hobbies"),
        Questions(text: "Yoga", answer: "Hobbies"),
        Questions(text: "Reading", answer: "Hobbies"),
        Questions(text: "Bodybuilding", answer: "Hobbies"),
        Questions(text: "Playing guitar", answer: "Hobbies"),
        Questions(text: "Equestrian sports", answer: "Hobbies"),
        Questions(text: "Dancing", answer: "Hobbies"),
        Questions(text: "Rock climbing", answer: "Hobbies"),
        Questions(text: "Diving", answer: "Hobbies"),
        Questions(text: "Singing", answer: "Hobbies"),
        Questions(text: "Drawing", answer: "Hobbies"),
        Questions(text: "Photography", answer: "Hobbies"),
        Questions(text: "Cooking", answer: "Hobbies"),
        Questions(text: "Embroidery", answer: "Hobbies"),
        Questions(text: "Knitting", answer: "Hobbies"),
        Questions(text: "Gardening", answer: "Hobbies"),
        Questions(text: "Traveling", answer: "Hobbies"),
    ]
    
    mutating func choiceCategory(_ sender: String) -> String {
        
        switch sender {
        case questionsAnimals[currentTeam].answer:
            let question = questionsAnimals
            let randomName = question.randomElement()!
            return randomName.text
        case questionsFood[currentTeam].answer:
            let question = questionsFood
            let randomName = question.randomElement()!
            return randomName.text
        case questionsHobby[currentTeam].answer:
            let question = questionsHobby
            let randomName = question.randomElement()!
            return randomName.text
        case questionsPersonality[currentTeam].answer:
            let question = questionsPersonality
            let randomName = question.randomElement()!
            return randomName.text
        default:
            break
        }
        return "Something"
    }
    
    func getTextExplainWord() -> String {
        let words = ["Explain with words.",
                     "Explain with gestures.",
                     "Explain with a drawing.",
                     "Explain angrily.",
                     "Explain with facial expressions.",
                     "Explain vulgarly.",
                     "Explain sexually."
        ]
        return words.randomElement()!
    }
    
}

