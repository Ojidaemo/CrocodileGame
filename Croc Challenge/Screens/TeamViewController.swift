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


    override func viewDidLoad() {
        super.viewDidLoad()
        globalData.ourTeam.removeAll()
        globalData.generateRandomTeams()
        globalData.question = 0
        self.title = "Кто играет?"
        view.backgroundColor = .clear
        hideElements()
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
        button.addTarget(self, action: #selector(addTeamPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - Methods
    
    func hideElements() {
        imageThree.isHidden = true
        imageFour.isHidden = true
        labelFour.isHidden = true
        labelThree.isHidden = true
    }
    
    @objc func addTeamPressed() {
        let maxTeams = 4
        if globalData.ourTeam.count >= maxTeams {
            let alert = UIAlertController(title: "Максимум \(maxTeams) команды", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            return
        }
        let alert = UIAlertController(title: "Добавить команду", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Введите название"
        })
        let cancel = UIAlertAction(title: "Отмена", style: .default) { (action) in }
        let action = UIAlertAction(title: "Ок", style: .default) { (action) in
            let commandName = alert.textFields?.first?.text ?? ""
            let teamLabel: UILabel
            let teamImageView: UIImageView
            switch self.globalData.ourTeam.count {
            case 2:
                teamLabel = self.labelThree
                teamImageView = self.imageThree
            case 3:
                teamLabel = self.labelFour
                teamImageView = self.imageFour
            default:
                return
            }
            teamLabel.text = commandName
            teamLabel.isHidden = false
            teamImageView.isHidden = false
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
        label.heightAnchor.constraint(equalToConstant: 96).isActive = true
        return label
    }
}

//MARK: - Constraints

extension TeamViewController {
    
    private func setupConstraints() {
        view.addSubviews(backgroundView, labelStack, playersReadyButton, addTeamButton)
        labelOne.addSubviewsToLabel(imageOne)
        labelTwo.addSubviewsToLabel(imageTwo)
        labelThree.addSubviewsToLabel(imageThree)
        labelFour.addSubviewsToLabel(imageFour)
        labelStack.addArrangedSubviews(labelOne, labelTwo, labelThree, labelFour)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addTeamButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            addTeamButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addTeamButton.heightAnchor.constraint(equalToConstant: 63),
            addTeamButton.bottomAnchor.constraint(equalTo: playersReadyButton.topAnchor,constant: -10),
            
            labelStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            labelStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            labelStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            
            playersReadyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            playersReadyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            playersReadyButton.heightAnchor.constraint(equalToConstant: 63),
            playersReadyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -60),
            
            imageOne.leadingAnchor.constraint(equalTo: labelOne.leadingAnchor, constant: 25),
            imageOne.centerYAnchor.constraint(equalTo: labelOne.centerYAnchor),

            imageTwo.leadingAnchor.constraint(equalTo: labelTwo.leadingAnchor, constant: 25),
            imageTwo.centerYAnchor.constraint(equalTo: labelTwo.centerYAnchor),
            
            imageThree.leadingAnchor.constraint(equalTo: labelThree.leadingAnchor, constant: 25),
            imageThree.centerYAnchor.constraint(equalTo: labelThree.centerYAnchor),

            imageFour.leadingAnchor.constraint(equalTo: labelFour.leadingAnchor, constant: 25),
            imageFour.centerYAnchor.constraint(equalTo: labelFour.centerYAnchor),

        ])
    }
}


