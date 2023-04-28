//
//  RoolsViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class RulesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
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
        
        The game is played in teams of two to four teams.

        The task of each player in the team is to explain the word they see on the screen, following the conditions that are additionally indicated under the guessed word.

        Each team is given an attempt to guess five words. One minute is given to guess each word.

        If the rules of explaining the word are violated, the turn is passed to the next team.

        The more words the team guesses, the more points they earn. The team that scores the most points wins.
        
        Let's play!
        """
        return text
    }()
}

extension RulesViewController {
    
    private func layout() {
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
