//
//  GameViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class NumbersToResult {
    static let shared = NumbersToResult()
    
    var question = 0
}

class GameViewController: UIViewController {
    
    let teamManager = TeamsManager.shared
    let questionNumbers = NumbersToResult.shared
    
    var questionsBox = QuestionsBox()
    var audioPlayer = AudioPlayer()
    var categoryChoise = ""
    
    var secondRemaining = 60
    var timer = Timer()
    var isTimerRunning = false
    
    lazy var word = questionsBox.choiceCategory(categoryChoise)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        wordLabel.text = word
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        audioPlayer.player.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        callTimer()
        setupConstraints()
    }
    
    //MARK: - Methods
    
    // timer formatted "00:00"
    
    func callTimer() {
        // Invalidate any existing timer before creating a new one
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.secondRemaining > 10 {
                self.secondRemaining -= 1
                self.timeLabel.text = String(format: "%02d:%02d", self.secondRemaining / 60, self.secondRemaining % 60)
            } else if self.secondRemaining == 10 {
                self.secondRemaining -= 1
                self.timeLabel.text = String(format: "%02d:%02d", self.secondRemaining / 60, self.secondRemaining % 60)
                self.audioPlayer.playSound(soundName: "10")
            } else if self.secondRemaining > 0 {
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
        self.title = ""
        audioPlayer.player?.stop()
        audioPlayer.playSound(soundName: "correct")
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
            self.questionNumbers.question += 1
            self.switchToResultVcOrCorrectVc()
        }
    }
    
    @objc func breakRulesButtonPressed() {
        self.title = ""
        audioPlayer.player?.stop()
        audioPlayer.playSound(soundName: "wrong")
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
            self.questionNumbers.question += 1
            self.switchToResultVcOrWrongVc()
        }
    }
    
    func switchToResultVcOrCorrectVc() {
        if questionNumbers.question == teamManager.ourTeam.count * 5 {
            let resultVC = GameResultViewController()
            teamManager.teamCorrectAnswer()
            self.navigationController?.pushViewController(resultVC, animated: true)
        } else if questionNumbers.question < teamManager.ourTeam.count * 5 {
            let correctVC = CorrectViewController()
            correctVC.categoryChoise = categoryChoise
            teamManager.teamCorrectAnswer()
            let (currentTeam, nextTeam) = teamManager.nextTeam()
            correctVC.updateUI(team1: currentTeam, team2: nextTeam)
            self.navigationController?.pushViewController(correctVC, animated: true)
        }
    }
    
    func switchToResultVcOrWrongVc() {
        if questionNumbers.question == teamManager.ourTeam.count * 5 {
            let resultVC = GameResultViewController()
            self.navigationController?.pushViewController(resultVC, animated: true)
        } else if questionNumbers.question < teamManager.ourTeam.count * 5 {
            let wrongVC = WrongViewController()
            wrongVC.categoryChoise = categoryChoise
            let (currentTeam, nextTeam) = teamManager.nextTeam()
            wrongVC.updateUI(team1: currentTeam, team2: nextTeam)
            self.navigationController?.pushViewController(wrongVC, animated: true)
        }
    }
    
    @objc func restartButtonPressed() {
        self.navigationController?.isNavigationBarHidden = true
        timer.invalidate()
        alertForResetButton()
    }
    
    func alertForResetButton() {
        let alert = UIAlertController(title: "Сбросить игру?", message: "Вы хотите сбросить игру и вернуться в главное меню?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .default) { (cancel) in
            self.callTimer()
        }
        let action = UIAlertAction(title: "Да", style: .default) { (action) in
            let mainVC = MainViewController()
            self.navigationController?.pushViewController(mainVC, animated: true)
        }
        alert.addAction(cancel)
        alert.addAction(action)
        present(alert, animated: true)
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
        label.text = "01:00"
        label.font = UIFont.italicSystemFont(ofSize: 48)
        label.textAlignment = .center
        return label
    }()
    
    lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = word
        label.numberOfLines = 2
        label.font = UIFont.italicSystemFont(ofSize: 48)
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = questionsBox.getTextExplainWord()
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
    
    //MARK: - Constraints
    
    func setupConstraints() {
        backgroundImageConstraints()
        crocoImageConstraints()
        timeLabelConstraints()
        wordLabelConstraints()
        descriptionLabelConstraints()
        stackViewButtonsConstraints()
    }
    
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
            timeLabel.topAnchor.constraint(equalTo: crocoImage.bottomAnchor, constant: 37),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
    }
    
    func wordLabelConstraints() {
        view.addSubview(wordLabel)
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20),
            wordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            wordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
    
    func descriptionLabelConstraints() {
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 89),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -89),
        ])
    }
    
    
    func stackViewButtonsConstraints() {
        view.addSubview(stackViewButtons)
        NSLayoutConstraint.activate([
            stackViewButtons.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 70),
            stackViewButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            stackViewButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            stackViewButtons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            stackViewButtons.heightAnchor.constraint(equalToConstant: 205)
        ])
    }
}
