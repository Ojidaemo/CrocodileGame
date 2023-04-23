//
//  ViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private lazy var backroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var crocodileImage: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "pngwing 1")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
    private lazy var startGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Старт Игры", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        button.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func startButtonPressed() {
        self.title = ""
        let teamVC = TeamViewController()
        self.navigationController?.pushViewController(teamVC, animated: true)
    }
    
    private lazy var rulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Правила", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        button.addTarget(self, action: #selector(rulesButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func rulesButtonPressed() {
        self.navigationController?.isNavigationBarHidden = false
        self.title = ""
        let rulesVC = RulesViewController()
        self.navigationController?.pushViewController(rulesVC, animated: true)
    }
    
    private lazy var grassImageOne: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "grass 2")
        return theImageView
    }()
    
    private lazy var grassImageTwo: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "grass 2")
        return theImageView
    }()
    
    private lazy var stackViewImages: UIStackView = {
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 180.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.addArrangedSubview(grassImageOne)
        stack.addArrangedSubview(grassImageTwo)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
}

extension MainViewController {
    
    private func setupConstraints() {
        backgroundImageConstraints()
        crocodileImageConstraints()
        startGameButtonConstraints()
        rulesButtonConstraints()
        stackImageConstraints()
    }
    
    private func backgroundImageConstraints() {
        view.addSubview(backroundImage)
        NSLayoutConstraint.activate([
            backroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backroundImage.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    private func crocodileImageConstraints() {
        view.addSubview(crocodileImage)
        NSLayoutConstraint.activate([
            crocodileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            crocodileImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            crocodileImage.widthAnchor.constraint(equalToConstant: 268),
            crocodileImage.heightAnchor.constraint(equalToConstant: 280)
        ])
    }

    private func startGameButtonConstraints() {
        view.addSubview(startGameButton)
        NSLayoutConstraint.activate([
            startGameButton.topAnchor.constraint(equalTo: crocodileImage.bottomAnchor, constant: 20),
            startGameButton.widthAnchor.constraint(equalToConstant: 274),
            startGameButton.heightAnchor.constraint(equalToConstant: 83),
            startGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func rulesButtonConstraints() {
        view.addSubview(rulesButton)
        NSLayoutConstraint.activate([
            rulesButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 39),
            rulesButton.widthAnchor.constraint(equalToConstant: 211),
            rulesButton.heightAnchor.constraint(equalToConstant: 63),
            rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func stackImageConstraints() {
        view.addSubview(stackViewImages)
        NSLayoutConstraint.activate([
            stackViewImages.topAnchor.constraint(equalTo: rulesButton.bottomAnchor, constant: 19),
            stackViewImages.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            stackViewImages.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackViewImages.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}


