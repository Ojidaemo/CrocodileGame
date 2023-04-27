//
//  ResultsView.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-18.
//

import UIKit

protocol restartGameProtocol: AnyObject {
    func restartGamePressed(sender: UIButton)
}

final class ResultsView: UIView {
    
    weak var delegateRestartGame: restartGameProtocol?

    lazy var imageOne = createImageView(image: UIImage(named: Resources.Image.cowboy)!)
    lazy var imageTwo = createImageView(image: UIImage(named: Resources.Image.burger)!)
    lazy var imageThree = createImageView(image: UIImage(named: Resources.Image.nails)!)
    lazy var imageFour = createImageView(image: UIImage(named: Resources.Image.nails)!)
    
    lazy var labelOne = createLabelWithTeamName(title: "")
    lazy var labelTwo = createLabelWithTeamName(title: "")
    lazy var labelThree = createLabelWithTeamName(title: "123")
    lazy var labelFour = createLabelWithTeamName(title: "123")

    
    lazy var scoreLabelOne = createScoreLabel()
    lazy var scoreLabelTwo = createScoreLabel()
    lazy var scoreLabelThree = createScoreLabel()
    lazy var scoreLabelFour = createScoreLabel()
    
    lazy var teamOneScore = createTeamScoreLabel(text: "")
    lazy var teamTwoScore = createTeamScoreLabel(text: "")
    lazy var teamThreeScore = createTeamScoreLabel(text: "")
    lazy var teamFourScore = createTeamScoreLabel(text: "")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        stack.distribution = .fillProportionally
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var restartGame: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        button.layer.cornerRadius = 10
        button.setTitle("Начать сначала", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        button.addTarget(self, action: #selector(restartPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Methods
    
    @objc func restartPressed(_ sender: UIButton) {
        delegateRestartGame?.restartGamePressed(sender: sender)
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
    
    func createScoreLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "Очки"
        label.font = UIFont(name: Resources.Fonts.bhavuka, size: 15)
        label.textColor = .black
        label.contentMode = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private func setupViews() {
        labelOne.addSubviewsToLabel(imageOne, scoreLabelOne, teamOneScore)
        labelTwo.addSubviewsToLabel(imageTwo, scoreLabelTwo, teamTwoScore)
        labelThree.addSubviewsToLabel(imageThree, scoreLabelThree, teamThreeScore)
        labelFour.addSubviewsToLabel(imageFour, scoreLabelFour, teamFourScore)
        labelStack.addArrangedSubviews(labelOne, labelTwo, labelThree, labelFour)
        self.addSubviews(backgroundView, labelStack, restartGame)
    }
}

//MARK: - Constraints

extension ResultsView {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            restartGame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            restartGame.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            restartGame.heightAnchor.constraint(equalToConstant: 60),
            restartGame.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -60),
            
            labelStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            labelStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            labelStack.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            
            labelOne.heightAnchor.constraint(equalToConstant: 96),
            labelTwo.heightAnchor.constraint(equalToConstant: 96),
            labelThree.heightAnchor.constraint(equalToConstant: 96),
            labelThree.heightAnchor.constraint(equalToConstant: 96),
            
            imageOne.leadingAnchor.constraint(equalTo: labelOne.leadingAnchor, constant: 25),
            imageOne.centerYAnchor.constraint(equalTo: labelOne.centerYAnchor),
            
            scoreLabelOne.trailingAnchor.constraint(equalTo: labelOne.trailingAnchor, constant: -15),
            scoreLabelOne.bottomAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: -8),
            
            teamOneScore.trailingAnchor.constraint(equalTo: labelOne.trailingAnchor, constant: -15),
            teamOneScore.centerYAnchor.constraint(equalTo: labelOne.centerYAnchor),
            
            imageTwo.leadingAnchor.constraint(equalTo: labelTwo.leadingAnchor, constant: 25),
            imageTwo.centerYAnchor.constraint(equalTo: labelTwo.centerYAnchor),
            
            scoreLabelTwo.trailingAnchor.constraint(equalTo: labelTwo.trailingAnchor, constant: -15),
            scoreLabelTwo.bottomAnchor.constraint(equalTo: labelTwo.bottomAnchor, constant: -8),
            
            teamTwoScore.trailingAnchor.constraint(equalTo: labelTwo.trailingAnchor, constant: -15),
            teamTwoScore.centerYAnchor.constraint(equalTo: labelTwo.centerYAnchor),
            
            imageThree.leadingAnchor.constraint(equalTo: labelThree.leadingAnchor, constant: 25),
            imageThree.centerYAnchor.constraint(equalTo: labelThree.centerYAnchor),
            
            scoreLabelThree.trailingAnchor.constraint(equalTo: labelThree.trailingAnchor, constant: -15),
            scoreLabelThree.bottomAnchor.constraint(equalTo: labelThree.bottomAnchor, constant: -8),
            
            teamThreeScore.trailingAnchor.constraint(equalTo: labelThree.trailingAnchor, constant: -15),
            teamThreeScore.centerYAnchor.constraint(equalTo: labelThree.centerYAnchor),
            
            imageFour.leadingAnchor.constraint(equalTo: labelFour.leadingAnchor, constant: 25),
            imageFour.centerYAnchor.constraint(equalTo: labelFour.centerYAnchor),
            
            scoreLabelFour.trailingAnchor.constraint(equalTo: labelFour.trailingAnchor, constant: -15),
            scoreLabelFour.bottomAnchor.constraint(equalTo: labelFour.bottomAnchor, constant: -8),
            
            teamFourScore.trailingAnchor.constraint(equalTo: labelFour.trailingAnchor, constant: -15),
            teamFourScore.centerYAnchor.constraint(equalTo: labelFour.centerYAnchor),
            
        ])
    }
}
