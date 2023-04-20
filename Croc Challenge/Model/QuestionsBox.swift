//
//  QuestionsBox.swift
//  Croc Challenge
//
//  Created by Daniil Kulikovskiy on 20.04.2023.
//

import UIKit

struct QuestionsBox {
    let questionsAnimals = [
        Questions(text: "Слон", answer: true),
        Questions(text: "Волк", answer: true),
        Questions(text: "Лев", answer: true),
        Questions(text: "Кошка", answer: true),
        Questions(text: "Жираф", answer: true),
        Questions(text: "Орел", answer: true),
        Questions(text: "Тигр", answer: true),
        Questions(text: "Зебра", answer: true),
        Questions(text: "Росомаха", answer: true),
        Questions(text: "Белка", answer: true),
        Questions(text: "Лиса", answer: true),
        Questions(text: "Медведь", answer: true),
        Questions(text: "Обезьяна", answer: true),
        Questions(text: "Лось", answer: true),
        Questions(text: "Жираф", answer: true),
        Questions(text: "Черепаха", answer: true)
    ]
    
    let questionsFood = [
        Questions(text: "Бургер", answer: true),
        Questions(text: "Яблоко", answer: true),
        Questions(text: "Пицца", answer: true),
        Questions(text: "Спагетти", answer: true),
        Questions(text: "Апельсин", answer: true),
        Questions(text: "Помидор", answer: true),
        Questions(text: "Суши", answer: true),
        Questions(text: "Клубника", answer: false),
    ]
    
    let questionsPersonality = [
        Questions(text: "Мадонна", answer: true),
        Questions(text: "Киану Ривз", answer: true),
        Questions(text: "Дженифер Энистон", answer: false),
        Questions(text: "Черчиль", answer: true),
        Questions(text: "Дональд Трамп", answer: true),
        Questions(text: "Лионель Месси", answer: true),
        Questions(text: "Илон Маск", answer: true),
        Questions(text: "Стив Джобс", answer: false),
        Questions(text: "Майкл Джексон", answer: true),
        Questions(text: "Майк Тайсон", answer: false),
        Questions(text: "Михаэль Шумахер", answer: true),
        Questions(text: "Брюс Уиллис", answer: true),
        Questions(text: "Арнольд Шварценеггер", answer: false),
        Questions(text: "Анджелина Джоли", answer: false),
        Questions(text: "Ким Кардашьян", answer: true)
    ]
    
    let questionsHobby = [
        Questions(text: "Теннис", answer: true),
        Questions(text: "Рыбалка", answer: true),
        Questions(text: "Горные лыжи", answer: false),
        Questions(text: "Плаванье", answer: true),
        Questions(text: "Футбол", answer: true),
        Questions(text: "Бег", answer: true),
        Questions(text: "Йога", answer: true),
        Questions(text: "Чтение", answer: false),
        Questions(text: "Тренировка в зале", answer: true),
        Questions(text: "Игра на гитаре", answer: false),
        Questions(text: "Конный спорт", answer: true),
        Questions(text: "Танцы", answer: true),
        Questions(text: "Скалолазанье", answer: false),
        Questions(text: "Прыжки с парашутом", answer: false),
        Questions(text: "Дайвинг", answer: true)
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswerAnimal(_ answer: Bool) -> Bool {
        let answer = true
        if answer == questionsAnimals[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func checkAnswerFood(_ answer: Bool) -> Bool {
        let answer = true
        if answer == questionsFood[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    mutating func checkAnswerPersonality(_ answer: Bool) -> Bool {
        let answer = true
        if answer == questionsPersonality[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    mutating func checkAnswerHobby(_ answer: Bool) -> Bool {
        let answer = true
        if answer == questionsHobby[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }

    func questionTextGetAnimals()-> String {
//        questionsAnimals[questionNumber].text
        let question = questionsAnimals
        let randomName = question.randomElement()!
        return randomName.text
    }
    
    func questionTextGetFood()-> String {
//        questionsAnimals[questionNumber].text
        let question = questionsFood
        let randomName = question.randomElement()!
        return randomName.text
    }
    
    func questionTextGetPersonality()-> String {
//        questionsAnimals[questionNumber].text
        let question = questionsPersonality
        let randomName = question.randomElement()!
        return randomName.text
    }
    
    func questionTextGetHobby()-> String {
//        questionsAnimals[questionNumber].text
        let question = questionsHobby
        let randomName = question.randomElement()!
        return randomName.text
    }
    
    mutating func nextQuestionAnimals() {
        if questionNumber + 1 < questionsAnimals.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
}


