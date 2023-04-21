//
//  CategoryViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class CategoryViewController: UIViewController {

    private let categoryView = CategoryView()
    var question = QuestionsBox()
    var userAnswer = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        self.title = "Категории"
        setDelegates()
        view.addSubview(categoryView)
        setupConstraints()
    }
    
    func setDelegates() {
        categoryView.delegateStartGame = self
        categoryView.delegate = self

    }
    
    private func setupConstraints() {
        
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: view.topAnchor),
            categoryView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}

extension CategoryViewController: startGameProtocol, ButtonTargetDelegate{
    func startGamePressed(sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        let gameVC = GameViewController()
        gameVC.userChoise = userAnswer
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    func buttonTapped(sender: UIButton) {
        userAnswer = sender.currentTitle!
        _ = question.choiceCategory(userAnswer)
        print(userAnswer)
        
        switch sender.tag {
        case 1:
            categoryView.checkmarkImageOne.isHidden = false
            categoryView.checkmarkImageTwo.isHidden = true
            categoryView.checkmarkImageThree.isHidden = true
            categoryView.checkmarkImageFour.isHidden = true
        case 2:
            categoryView.checkmarkImageOne.isHidden = true
            categoryView.checkmarkImageTwo.isHidden = false
            categoryView.checkmarkImageThree.isHidden = true
            categoryView.checkmarkImageFour.isHidden = true
        case 3:
            categoryView.checkmarkImageOne.isHidden = true
            categoryView.checkmarkImageTwo.isHidden = true
            categoryView.checkmarkImageThree.isHidden = false
            categoryView.checkmarkImageFour.isHidden = true
        case 4:
            categoryView.checkmarkImageOne.isHidden = true
            categoryView.checkmarkImageTwo.isHidden = true
            categoryView.checkmarkImageThree.isHidden = true
            categoryView.checkmarkImageFour.isHidden = false
        default:
            break
        }
        
    }
    
}
