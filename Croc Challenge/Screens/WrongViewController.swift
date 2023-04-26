//
//  WrongViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit
import SnapKit

class WrongViewController: UIViewController {
    
    var questionsBox = QuestionsBox()
    var categoryChoise = ""
    
    let teamManager = TeamsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func updateUI(team1: Teams, team2: Teams) {
        teamNameInFirstView.text = team1.name
        teamImageInFirstView.image = UIImage(named: team1.teamImage)
        scoreInFirstView.text = String(team1.score)
        fourthLabelInSecondView.text = "Следующий ход - “\(team2.name)”"
    }
    
    @objc func transferPressed() {
        self.navigationController?.isNavigationBarHidden = true
        let gameVC = GameViewController()
        gameVC.categoryChoise = categoryChoise
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    private lazy var backgroundView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: Resources.Image.backGround)
        return element
    }()
    
    private lazy var firstView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        element.layer.cornerRadius = 10
        return element
    }()
    
    private lazy var teamImageInFirstView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: teamManager.teamOne!.teamImage)
        return element
    }()
    
    private lazy var teamNameInFirstView: UILabel = {
        let element = UILabel()
        element.text = teamManager.teamOne!.name
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        element.textColor = .black
        return element
    }()
    
    private lazy var scoreInFirstView: UILabel = {
        let element = UILabel()
        element.text = String(teamManager.teamOne!.score)
        element.font = UIFont(name: Resources.Fonts.cookie, size: 65)
        element.textColor = .black
        return element
    }()
    
    private lazy var scoreLabelInFirstView: UILabel = {
        let element = UILabel()
        element.text = "Очки"
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 15)
        element.textColor = .black
        return element
    }()
    
    private lazy var secondView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: Resources.Colors.buttonRed)
        element.layer.cornerRadius = 20
        return element
    }()
    
    private lazy var firstLabelInSecondView: UILabel = {
        let element = UILabel()
        element.text = "УВЫ И АХ!"
        element.font = UIFont.boldSystemFont(ofSize: 28)
        element.textColor = .black
        return element
    }()
    
    private lazy var secondLabelInSecondView: UILabel = {
        let element = UILabel()
        element.text = "Вы не отгадали слово и не получаете очков!"
        element.numberOfLines = 0
        element.textAlignment = .center
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 16)
        element.textColor = .black
        return element
    }()
    
    private lazy var imageInSecondView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Ellipse 2")
        return element
    }()
    
    private lazy var thirdLabelInSecondView: UILabel = {
        let element = UILabel()
        element.text = "0"
        element.font = UIFont(name: Resources.Fonts.cookie, size: 80)
        element.textColor = .white
        return element
    }()
    
    private lazy var fourthLabelInSecondView: UILabel = {
        let element = UILabel()
        if let teamName = teamManager.teamTwo?.name {
            element.text = String("Следующий ход - “\(teamName)”")
        }
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 16)
        element.textColor = .black
        return element
    }()
    
    private lazy var transferButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        element.setTitle("Передать ход", for: .normal)
        element.titleLabel?.textAlignment = .center
        element.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 17)
        element.layer.cornerRadius = 10
        element.setTitleColor(.white, for: .normal)
        element.addTarget(self, action: #selector(transferPressed), for: .touchUpInside)
        return element
    }()
}

extension WrongViewController {
    
    private func setupViews() {
        view.addSubview(backgroundView)
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addSubview(transferButton)
        
        firstView.addSubview(teamImageInFirstView)
        firstView.addSubview(teamNameInFirstView)
        firstView.addSubview(scoreInFirstView)
        firstView.addSubview(scoreLabelInFirstView)
        
        secondView.addSubview(firstLabelInSecondView)
        secondView.addSubview(secondLabelInSecondView)
        secondView.addSubview(imageInSecondView)
        secondView.addSubview(fourthLabelInSecondView)
        
        imageInSecondView.addSubviews(thirdLabelInSecondView)
        
        addConstraints()
    }
    
    private func addConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        firstView.snp.makeConstraints { make in
            make.height.equalTo(96)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(38)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        secondView.snp.makeConstraints { make in
            make.height.equalTo(301)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalTo(transferButton.snp.top).inset(-144)
        }
        
        transferButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(9)
        }
        
        teamImageInFirstView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
        
        teamNameInFirstView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(105)
        }
        
        scoreInFirstView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(7)
            make.trailing.equalToSuperview().inset(20)
        }
        
        scoreLabelInFirstView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(8)
        }
        
        firstLabelInSecondView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(39)
        }
        
        secondLabelInSecondView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(firstLabelInSecondView.snp.bottom).inset(-20)
        }
        
        imageInSecondView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(75)
        }
        
        thirdLabelInSecondView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        fourthLabelInSecondView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(46)
        }
    }
}
