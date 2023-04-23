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
        Questions(text: "Черепаха", answer: "Животные"),
        Questions(text: "Кенгуру", answer: "Животные"),
        Questions(text: "Гепард", answer: "Животные"),
        Questions(text: "Крокодил", answer: "Животные"),
        Questions(text: "Дельфин", answer: "Животные"),
        Questions(text: "Кит", answer: "Животные"),
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
        Questions(text: "Рис", answer: "Еда"),
        Questions(text: "Яйца", answer: "Еда"),
        Questions(text: "Хлеб", answer: "Еда"),
        Questions(text: "Овощи", answer: "Еда"),
        Questions(text: "Фрукты", answer: "Еда"),
        Questions(text: "Мороженое", answer: "Еда"),
        Questions(text: "Паста", answer: "Еда"),
        Questions(text: "Рыба", answer: "Еда"),
        Questions(text: "Мясо", answer: "Еда"),
        Questions(text: "Чипсы", answer: "Еда"),
        Questions(text: "Гренки", answer: "Еда"),
        Questions(text: "Блины", answer: "Еда"),
        Questions(text: "Кекс", answer: "Еда"),
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
        Questions(text: "Курт Кобейн", answer: "Личности"),
        Questions(text: "Анджелина Джоли", answer: "Личности"),
        Questions(text: "Ким Кардашьян", answer: "Личности"),
        Questions(text: "Том Круз", answer: "Личности"),
        Questions(text: "Бейонсе", answer: "Личности"),
        Questions(text: "Элвис Пресли", answer: "Личности"),
        Questions(text: "Джордж Клуни", answer: "Личности"),
        Questions(text: "Билл Гейтс", answer: "Личности")
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
        Questions(text: "Бодибилдинг", answer: "Хобби"),
        Questions(text: "Игра на гитаре", answer: "Хобби"),
        Questions(text: "Конный спорт", answer: "Хобби"),
        Questions(text: "Танцы", answer: "Хобби"),
        Questions(text: "Скалолазанье", answer: "Хобби"),
        Questions(text: "Дайвинг", answer: "Хобби"),
        Questions(text: "Пение", answer: "Хобби"),
        Questions(text: "Рисование", answer: "Хобби"),
        Questions(text: "Фотография", answer: "Хобби"),
        Questions(text: "Готовка", answer: "Хобби"),
        Questions(text: "Вышивание", answer: "Хобби"),
        Questions(text: "Вязание", answer: "Хобби"),
        Questions(text: "Садоводство", answer: "Хобби"),
        Questions(text: "Путешествия", answer: "Хобби"),
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
        let words = ["Объясни с помощью слов.",
                     "Объясни с помощью жестов.",
                     "Объясни с помощью рисунка.",
                     "Объясняй со злостью.",
                     "Объясняй с помощью мимики.",
                     "Объясняй вульгарно.",
                     "Объясняй сексуально."
        ]
        return words.randomElement()!
    }
    
}

