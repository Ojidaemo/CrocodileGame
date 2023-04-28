//
//  CategoryViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class CategoryViewController: UIViewController {

    private let categoryView = CategoryView()
    var questionsBox = QuestionsBox()
    var categoryChoise = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        self.title = "Categories"
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

extension CategoryViewController: startGameProtocol, ButtonTargetDelegate {
    func startGamePressed(sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if categoryChoise == "" {
            let alert = UIAlertController(title: "", message: "Select a category", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default) { (action) in }
            alert.addAction(action)
            present(alert, animated: true)
        } else {
            let gameVC = GameViewController()
            gameVC.categoryChoise = categoryChoise
            self.navigationController?.pushViewController(gameVC, animated: true)
        }
    }
    
    func buttonTapped(sender: UIButton) {
        categoryChoise = sender.currentTitle!
        
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
