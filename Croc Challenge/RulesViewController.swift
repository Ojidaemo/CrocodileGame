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
    
    private let scrollView: UIScrollView = {
        let scroolView = UIScrollView()
        scroolView.showsVerticalScrollIndicator = true
        scroolView.alwaysBounceVertical = true
        scroolView.translatesAutoresizingMaskIntoConstraints = false
        return scroolView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            textLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -15),
        ])
        
    }
    
    
    
    
}
