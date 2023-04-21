//
//  TeamViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class TeamViewController: UIViewController {
    
    let teamImageDict = [
        "Ковбои": UIImage(named: Resources.Image.cowboy)!,
        "Стройняшки": UIImage(named: Resources.Image.burger)!,
        "Красотки": UIImage(named: Resources.Image.nails)!,
        "Лягушки": UIImage(named: Resources.Image.frog)!
    ]

    lazy var teams = teamImageDict.keys.map { name in
        Teams(name: name, score: 0, teamImage: teamImageDict[name]!)
    }

    lazy var teamOne = randomTeam(excluding: nil)
    lazy var imageOne = createImageView(image: teamOne!.teamImage)
    lazy var labelOne = createLabelWithTeamName(title: teamOne!.name)

    lazy var teamTwo = randomTeam(excluding: teamOne)
    lazy var imageTwo = createImageView(image: teamTwo!.teamImage)
    lazy var labelTwo = createLabelWithTeamName(title: teamTwo!.name)

    func randomTeam(excluding excludedTeam: Teams?) -> Teams? {
        var availableTeams = teams
        var selectedTeams: [Teams] = []
        
        while !availableTeams.isEmpty {
            let randomIndex = Int.random(in: 0..<availableTeams.count)
            let randomTeam = availableTeams[randomIndex]
            
            if randomTeam != excludedTeam {
                selectedTeams.append(randomTeam)
                availableTeams.remove(at: randomIndex)
            }
            
            if selectedTeams.count == teams.count - 1 {
                // All teams except for the excluded team have been selected
                break
            }
        }
        return selectedTeams.first
    }
    
    lazy var imageClose = imageCloseButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Кто играет?"
        view.backgroundColor = .clear
        setupConstraints()
    }
    
    private let backgroundView: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: Resources.Image.backGround)
        background.contentMode = .scaleToFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    private let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var playersReadyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        button.layer.cornerRadius = 10
        button.setTitle("Игроки готовы", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.3
        button.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        button.addTarget(self, action: #selector(readyButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var addTeamButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: Resources.Colors.buttonOrange)
        button.layer.cornerRadius = 10
        button.setTitle("Добавить команду", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.3
        button.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - Methods
    
    @objc func readyButtonPressed() {
        self.title = ""
        let categoryVC = CategoryViewController()
        self.navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    let imageCloseButton: UIImageView = {
        let imageButton = UIImageView()
        imageButton.image = UIImage(named: "close 1")
        imageButton.backgroundColor = .red
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        return imageButton
    }()
    
    let imageCloseButtonTwo: UIImageView = {
        let imageButton = UIImageView()
        imageButton.image = UIImage(named: "close 2")
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        return imageButton
    }()
    
    
    func createTeamScoreLabel(text: String) -> UILabel {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = text
        label.font = UIFont(name: Resources.Fonts.cookie, size: 65)
        label.textColor = .black
        label.contentMode = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func createImageView(image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }
    
    func createLabelWithTeamName(title: String) -> UILabel {
        let label = UILabel()
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.text = title
        label.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

//MARK: - Constraints

extension TeamViewController {
    
    private func setupConstraints() {
        
        view.addSubviews(backgroundView, labelStack, playersReadyButton, addTeamButton)
        labelOne.addSubviewsToLabel(imageOne, imageClose)
        labelTwo.addSubviewsToLabel(imageTwo, imageClose)
//        labelThree.addSubviewsToLabel(imageThree, imageClose)
        labelStack.addArrangedSubviews(labelOne, labelTwo)
        
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addTeamButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            addTeamButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addTeamButton.heightAnchor.constraint(equalToConstant: 63),
            addTeamButton.bottomAnchor.constraint(equalTo: playersReadyButton.topAnchor,constant: -10),
            
            playersReadyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            playersReadyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            playersReadyButton.heightAnchor.constraint(equalToConstant: 63),
            playersReadyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -60),
            
            imageOne.leadingAnchor.constraint(equalTo: labelOne.leadingAnchor, constant: 25),
            imageOne.centerYAnchor.constraint(equalTo: labelOne.centerYAnchor),
            
            imageClose.trailingAnchor.constraint(equalTo: labelOne.trailingAnchor, constant: -25),
            imageClose.heightAnchor.constraint(equalToConstant: 30),
            imageClose.centerYAnchor.constraint(equalTo: labelOne.centerYAnchor),
            
            imageTwo.leadingAnchor.constraint(equalTo: labelTwo.leadingAnchor, constant: 25),
            imageTwo.centerYAnchor.constraint(equalTo: labelTwo.centerYAnchor),
            
//            imageThree.leadingAnchor.constraint(equalTo: labelThree.leadingAnchor, constant: 25),
//            imageThree.centerYAnchor.constraint(equalTo: labelThree.centerYAnchor),
            
            labelStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            labelStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            labelStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            labelStack.heightAnchor.constraint(equalToConstant: 360)
            
        ])
    }
}




