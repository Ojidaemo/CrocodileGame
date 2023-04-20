//
//  QuestionsBox.swift
//  Croc Challenge
//
//  Created by Daniil Kulikovskiy on 20.04.2023.
//

import UIKit

struct QuestionsBox {
    
    
    var teams = [Teams(name: "Ковбои", score: 0),
                 Teams(name: "Стройняшки", score: 0),
                 Teams(name: "Красотки", score: 0)
    ]
    
    let questionsAnimals = [
        Questions(text: "Слон", answer: "Животные"),
        Questions(text: "Волк", answer: "Животные"),
        Questions(text: "Лев", answer: "Животные"),
        Questions(text: "Кошка", answer: "Животные"),
        Questions(text: "Жираф", answer: "Животные"),
        Questions(text: "Орел", answer: "Животные"),
        Questions(text: "Тигр", answer: "Животные"),
        Questions(text: "Зебра", answer: "Животные"),
        Questions(text: "Росомаха", answer: "Животные"),
        Questions(text: "Белка", answer: "Животные"),
        Questions(text: "Лиса", answer: "Животные"),
        Questions(text: "Медведь", answer: "Животные"),
        Questions(text: "Обезьяна", answer: "Животные"),
        Questions(text: "Лось", answer: "Животные"),
        Questions(text: "Жираф", answer: "Животные"),
        Questions(text: "Черепаха", answer: "Животные")
    ]
    
    let questionsFood = [
        Questions(text: "Бургер", answer: "Еда"),
        Questions(text: "Яблоко", answer: "Еда"),
        Questions(text: "Пицца", answer: "Еда"),
        Questions(text: "Спагетти", answer: "Еда"),
        Questions(text: "Апельсин", answer: "Еда"),
        Questions(text: "Помидор", answer: "Еда"),
        Questions(text: "Суши", answer: "Еда"),
        Questions(text: "Клубника", answer: "Еда"),
    ]
    
    let questionsPersonality = [
        Questions(text: "Мадонна", answer: "Личности"),
        Questions(text: "Киану Ривз", answer: "Личности"),
        Questions(text: "Дженифер Энистон", answer: "Личности"),
        Questions(text: "Черчиль", answer: "Личности"),
        Questions(text: "Дональд Трамп", answer: "Личности"),
        Questions(text: "Лионель Месси", answer: "Личности"),
        Questions(text: "Илон Маск", answer: "Личности"),
        Questions(text: "Стив Джобс", answer: "Личности"),
        Questions(text: "Майкл Джексон", answer: "Личности"),
        Questions(text: "Майк Тайсон", answer: "Личности"),
        Questions(text: "Михаэль Шумахер", answer: "Личности"),
        Questions(text: "Брюс Уиллис", answer: "Личности"),
        Questions(text: "Арнольд Шварценеггер", answer: "Личности"),
        Questions(text: "Анджелина Джоли", answer: "Личности"),
        Questions(text: "Ким Кардашьян", answer: "Личности")
    ]
    
    let questionsHobby = [
        Questions(text: "Теннис", answer: "Хобби"),
        Questions(text: "Рыбалка", answer: "Хобби"),
        Questions(text: "Горные лыжи", answer: "Хобби"),
        Questions(text: "Плаванье", answer: "Хобби"),
        Questions(text: "Футбол", answer: "Хобби"),
        Questions(text: "Бег", answer: "Хобби"),
        Questions(text: "Йога", answer: "Хобби"),
        Questions(text: "Чтение", answer: "Хобби"),
        Questions(text: "Тренировка в зале", answer: "Хобби"),
        Questions(text: "Игра на гитаре", answer: "Хобби"),
        Questions(text: "Конный спорт", answer: "Хобби"),
        Questions(text: "Танцы", answer: "Хобби"),
        Questions(text: "Скалолазанье", answer: "Хобби"),
        Questions(text: "Прыжки с парашутом", answer: "Хобби"),
        Questions(text: "Дайвинг", answer: "Хобби")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswerAnimal(_ answer: String) -> Bool {
        let answer = "Animals"
        if answer == questionsAnimals[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
//    mutating func checkAnswerFood(_ answer: Bool) -> Bool {
//        let answer = true
//        if answer == questionsFood[questionNumber].answer {
//            score += 1
//            return true
//        } else {
//            return false
//        }
//    }
//
//    mutating func checkAnswerPersonality(_ answer: Bool) -> Bool {
//        let answer = true
//        if answer == questionsPersonality[questionNumber].answer {
//            score += 1
//            return true
//        } else {
//            return false
//        }
//    }
//
//    mutating func checkAnswerHobby(_ answer: Bool) -> Bool {
//        let answer = true
//        if answer == questionsHobby[questionNumber].answer {
//            score += 1
//            return true
//        } else {
//            return false
//        }
//    }

    func questionTextGetAnimals()-> String {
//        questionsAnimals[questionNumber].text
        let question = questionsAnimals
        let randomName = question.randomElement()!
        return randomName.text
    }
    
//    func questionTextGetFood()-> String {
////        questionsAnimals[questionNumber].text
//        let question = questionsFood
//        let randomName = question.randomElement()!
//        return randomName.text
//    }
//
//    func questionTextGetPersonality()-> String {
////        questionsAnimals[questionNumber].text
//        let question = questionsPersonality
//        let randomName = question.randomElement()!
//        return randomName.text
//    }
//
//    func questionTextGetHobby()-> String {
////        questionsAnimals[questionNumber].text
//        let question = questionsHobby
//        let randomName = question.randomElement()!
//        return randomName.text
//    }
    
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

