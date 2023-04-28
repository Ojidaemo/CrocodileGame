//
//  TeamViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class TeamViewController: UIViewController {
    
    let globalData = TeamsManager.shared
    lazy var imageOne = createImageView(image: UIImage(named: globalData.teamOne!.teamImage)!)
    lazy var labelOne = createLabelWithTeamName(title: globalData.teamOne?.name ?? "")
    
    lazy var imageTwo = createImageView(image: UIImage(named: globalData.teamTwo!.teamImage)!)
    lazy var labelTwo = createLabelWithTeamName(title: globalData.teamTwo?.name ?? "")
    
    lazy var imageThree = createImageView(image: UIImage(named: Resources.Image.teamImages.randomElement()!)!)
    lazy var labelThree = createLabelWithTeamName(title: "")
    
    lazy var imageFour = createImageView(image: UIImage(named: Resources.Image.teamImages.randomElement()!)!)
    lazy var labelFour = createLabelWithTeamName(title: "")
    
    lazy var crossButtonOne = createCrossButton()
    lazy var crossButtonTwo = createCrossButton()
    lazy var crossButtonThree = createCrossButton()
    lazy var crossButtonFour = createCrossButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        globalData.ourTeam.removeAll()
        globalData.generateRandomTeams()
        globalData.question = 0
        view.backgroundColor = .clear
        hideElements()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Who plays?"
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
        button.setTitle("Teams ready", for: .normal)
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
        button.setTitle("Add team", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.3
        button.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        button.addTarget(self, action: #selector(addTeamPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - Methods
    
    func hideElements() {
        labelFour.isHidden = true
        labelThree.isHidden = true
        crossButtonOne.isHidden = true
        crossButtonTwo.isHidden = true
    }
    
    @objc func addTeamPressed() {
        print(globalData.ourTeam)
        let maxTeams = 4
        if globalData.ourTeam.count >= maxTeams {
            let alert = UIAlertController(title: "Max \(maxTeams) teams", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            return
        }
        let alert = UIAlertController(title: "Add team", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter team name"
        })
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (action) in }
        let action = UIAlertAction(title: "Ок", style: .default) { (action) in
            let commandName = alert.textFields?.first?.text ?? ""
            let teamLabel: UILabel
            switch self.globalData.ourTeam.count {
            case 2:
                teamLabel = self.labelThree
                self.crossButtonOne.isHidden = false
                self.crossButtonTwo.isHidden = false
            case 3:
                teamLabel = self.labelFour
            default:
                return
            }
            teamLabel.text = commandName
            teamLabel.isHidden = false
            let team = Teams(name: commandName, score: 0, teamImage: Resources.Image.teamImages.randomElement()!)
            self.globalData.ourTeam.append(team)
            print(self.globalData.ourTeam)
        }
        alert.addAction(cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @objc func readyButtonPressed() {
        self.title = ""
        let categoryVC = CategoryViewController()
        self.navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    func createCrossButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage (UIImage(named: Resources.Image.cross), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(crossButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func teamToRemove(label: UILabel) {
        if let labelText = label.text,
           let teamToRemove = globalData.ourTeam.first(where: { $0.name == labelText }) {
            globalData.ourTeam = globalData.ourTeam.filter { $0 != teamToRemove }
            print("DELETED \(teamToRemove)")
        }
        print(globalData.ourTeam)
    }
    
    @objc func crossButtonPressed(sender: UIButton) {
        if sender == crossButtonOne {
            labelOne.isHidden = true
            teamToRemove(label: labelOne)
        } else if sender == crossButtonTwo {
            labelTwo.isHidden = true
            teamToRemove(label: labelTwo)
        } else if sender == crossButtonThree {
            labelThree.isHidden = true
            teamToRemove(label: labelThree)
        } else {
            labelFour.isHidden = true
            teamToRemove(label: labelFour)
        }
        
        if globalData.ourTeam.count == 2 {
            if !labelOne.isHidden {
                crossButtonOne.isHidden = true
            }
            if !labelTwo.isHidden {
                crossButtonTwo.isHidden = true
            }
            if !labelThree.isHidden {
                crossButtonThree.isHidden = true
            }
            if !labelFour.isHidden {
                crossButtonFour.isHidden = true
            }
        }
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
        label.isUserInteractionEnabled = true
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.text = title
        label.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.12).isActive = true
        return label
    }
}

//MARK: - Constraints

extension TeamViewController {
    
    private func setupConstraints() {
        view.addSubviews(backgroundView, labelStack, playersReadyButton, addTeamButton)
        labelOne.addSubviewsToLabel(imageOne, crossButtonOne)
        labelTwo.addSubviewsToLabel(imageTwo, crossButtonTwo)
        labelThree.addSubviewsToLabel(imageThree, crossButtonThree)
        labelFour.addSubviewsToLabel(imageFour, crossButtonFour)
        labelStack.addArrangedSubviews(labelOne, labelTwo, labelThree, labelFour)
        
    NSLayoutConstraint.activate([
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        addTeamButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        addTeamButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        addTeamButton.heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.1),
        addTeamButton.bottomAnchor.constraint(equalTo: playersReadyButton.topAnchor,constant: -10),
        
        labelStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        labelStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        labelStack.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height * 0.14),
        
        playersReadyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        playersReadyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        playersReadyButton.heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.1),
        playersReadyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
        
        imageOne.leadingAnchor.constraint(equalTo: labelOne.leadingAnchor, constant: 25),
        imageOne.centerYAnchor.constraint(equalTo: labelOne.centerYAnchor),
        crossButtonOne.trailingAnchor.constraint(equalTo: labelOne.trailingAnchor, constant: -10),
        crossButtonOne.centerYAnchor.constraint(equalTo: labelOne.centerYAnchor),
        
        imageTwo.leadingAnchor.constraint(equalTo: labelTwo.leadingAnchor, constant: 25),
        imageTwo.centerYAnchor.constraint(equalTo: labelTwo.centerYAnchor),
        crossButtonTwo.trailingAnchor.constraint(equalTo: labelTwo.trailingAnchor, constant: -10),
        crossButtonTwo.centerYAnchor.constraint(equalTo: labelTwo.centerYAnchor),
        
        imageThree.leadingAnchor.constraint(equalTo: labelThree.leadingAnchor, constant: 25),
        imageThree.centerYAnchor.constraint(equalTo: labelThree.centerYAnchor),
        crossButtonThree.trailingAnchor.constraint(equalTo: labelThree.trailingAnchor, constant: -10),
        crossButtonThree.centerYAnchor.constraint(equalTo: labelThree.centerYAnchor),
        
        imageFour.leadingAnchor.constraint(equalTo: labelFour.leadingAnchor, constant: 25),
        imageFour.centerYAnchor.constraint(equalTo: labelFour.centerYAnchor),
        crossButtonFour.trailingAnchor.constraint(equalTo: labelFour.trailingAnchor, constant: -10),
        crossButtonFour.centerYAnchor.constraint(equalTo: labelFour.centerYAnchor)
    ])
}
}


