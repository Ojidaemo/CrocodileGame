//
//  GameViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    var questionsBox = QuestionsBox()
    
    var secondRemaining = 59
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callTimer()

        backgroundImageConstraints()
        view.backgroundColor = .systemGreen
        //        wordLabel.text = questionsBrain.questionTextGet()
        crocoImageConstraints()
        timeLabelConstraints()
        wordLabelConstraints()
        descriptionLabelConstraints()
        stackViewButtonsConstraints()
    }
    
    //MARK: - Methods
    
    // timer formatted "00:00"
    
    func callTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.secondRemaining != 0 {
                self.secondRemaining -= 1
                self.timeLabel.text = String(format: "%02d:%02d", self.secondRemaining / 60, self.secondRemaining % 60)
            } else {
                timer.invalidate()
                self.timeLabel.text = "Время вышло!"
                self.timeLabel.textColor = .red
                self.timeLabel.font = .systemFont(ofSize: 20, weight: .bold)
            }
        }
    }
    
    @objc func correctButtonPressed() {
        let bool = true
        _ = questionsBox.checkAnswerAnimal(bool)
        questionsBox.nextQuestionAnimals()
        self.title = ""
        let correctVC = CorrectViewController()
        self.navigationController?.pushViewController(correctVC, animated: true)
    }
    
    func update() {
//        scoreLabel.text = "Score: \(questionsBox.getScore())" - узнать про picture score
    }


  private lazy var backroundImage: UIImageView = {

    let image = UIImageView()
    image.image = UIImage(named: "background")
    image.translatesAutoresizingMaskIntoConstraints = false
    return image

  }()
    
    private lazy var crocoImage: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "croco")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:59"
      label.font = UIFont.italicSystemFont(ofSize: 48)
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Картошка"
      label.font = UIFont.italicSystemFont(ofSize: 48)
        label.text = questionsBox.questionTextGetAnimals()
        label.font = UIFont.systemFont(ofSize: 48)
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "объясни с помощью жестов"
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var correctButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Правильно", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
      button.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        button.addTarget(self, action: #selector(correctButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var breakRulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Нарушил Правила", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: Resources.Colors.buttonRed)
        button.addTarget(self, action: #selector(breakRulesButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func breakRulesButtonPressed() {
        self.title = ""
        let wrongVC = WrongViewController()
        self.navigationController?.pushViewController(wrongVC, animated: true)
    }
    
    private lazy var restartGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сбросить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(restartButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func restartButtonPressed() {
        self.navigationController?.isNavigationBarHidden = true
        let mainVC = MainViewController()
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    
    private lazy var stackViewButtons: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.addArrangedSubview(correctButton)
        stack.addArrangedSubview(breakRulesButton)
        stack.addArrangedSubview(restartGameButton)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

  func backgroundImageConstraints() {

    view.addSubview(backroundImage)
    NSLayoutConstraint.activate([
      backroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      backroundImage.topAnchor.constraint(equalTo: view.topAnchor)

    ])


  }
    
    
    func crocoImageConstraints() {
        
        view.addSubview(crocoImage)
        
        NSLayoutConstraint.activate([
            
            crocoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            crocoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            crocoImage.widthAnchor.constraint(equalToConstant: 139),
            crocoImage.heightAnchor.constraint(equalToConstant: 139)
            
        ])
        
    }
    
    
    func timeLabelConstraints() {
        
        view.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            
            timeLabel.topAnchor.constraint(equalTo: crocoImage.bottomAnchor, constant: 57),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
            
        ])
        
    }
    
    
    func wordLabelConstraints() {
        
        view.addSubview(wordLabel)
        
        NSLayoutConstraint.activate([
            
            wordLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 85),
            wordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 63),
            wordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -63)
            
        ])
        
    }
    
    
    func descriptionLabelConstraints() {
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            
            descriptionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 89),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -89)
            
        ])
        
    }
    
    func stackViewButtonsConstraints() {
        view.addSubview(stackViewButtons)
        NSLayoutConstraint.activate([
            
            stackViewButtons.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 75),
            stackViewButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            stackViewButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            stackViewButtons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            
        ])
        
    }
    
}
