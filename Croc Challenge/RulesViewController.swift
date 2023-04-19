//
//  RoolsViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class RulesViewController: UIViewController {
    
    private let backgroundView: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: Resources.Image.backGround)
        background.contentMode = .scaleToFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    private let textLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        text.font = .systemFont(ofSize: 20, weight: .regular)
        text.text = """
        В игру играют командами из двух или более человек.

        Задача каждого игрока команды - объяснить слово, которое он видит на экране, следуя условиям, которые дополнительно указаны под загаданным словом.

        Чем больше слов отгадала команда, тем больше она заработает баллов.

        Выигрывает команда, набравшая больше всего баллов.
         На отгадывание слова дается одна минуту. 
        При нарушении правил объяснения слова, ход передается следующей команде.

        ...
        ...
        """
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    
    func layout() {
        view.addSubview(backgroundView)
        backgroundView.addSubviews(textLabel)
        
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            textLabel.topAnchor.constraint(equalTo: view.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
        ])
        
    }
    
    
    
    
}
