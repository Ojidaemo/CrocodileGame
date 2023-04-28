//
//  CorrectViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit
import SnapKit

class CorrectViewController: UIViewController {
    
    var questionsBox = QuestionsBox()
    var categoryChoise = ""
    
    let teamManager = TeamsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func updateUI(team1: Teams, team2: Teams) {
        teamNameInFirstView.text = team1.name
        teamImage.image = UIImage(named: team1.teamImage)
        scoreInFirstView.text = String(team1.score)
        nextMoveLabel.text = "Next team - “\(team2.name)”"
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
    
    private lazy var teamView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        element.layer.cornerRadius = 10
        return element
    }()
    
    private lazy var teamImage: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: teamManager.teamOne!.teamImage)
        return element
    }()
    
    private lazy var teamNameInFirstView: UILabel = {
        let element = UILabel()
        element.text = teamManager.teamOne?.name
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
        element.text = "Scores"
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 15)
        element.textColor = .black
        return element
    }()
    
    private lazy var secondView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        element.layer.cornerRadius = 20
        return element
    }()
    
    private lazy var congrLabel: UILabel = {
        let element = UILabel()
        element.text = "Congratulations!"
        element.font = UIFont.boldSystemFont(ofSize: 28)
        element.textColor = .black
        return element
    }()
    
    private lazy var youReceiveLabel: UILabel = {
        let element = UILabel()
        element.text = "You recieve"
        element.numberOfLines = 0
        element.textAlignment = .center
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 16)
        element.textColor = .black
        return element
    }()
    
    private lazy var starImage: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Vector")
        return element
    }()
    
    private lazy var scoreInTheStar: UILabel = {
        let element = UILabel()
        element.text = "1"
        element.font = UIFont(name: Resources.Fonts.cookie, size: 80)
        element.textColor = .white
        return element
    }()
    
    private lazy var scoreUnderStar: UILabel = {
        let element = UILabel()
        element.text = "Score"
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 13)
        element.textColor = UIColor(named: Resources.Colors.gold)
        return element
    }()
    
    private lazy var nextMoveLabel: UILabel = {
        let element = UILabel()
        if let teamName = teamManager.teamTwo?.name {
            element.text = String("Next team - “\(teamName)”")
        }
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 16)
        element.textColor = .black
        return element
    }()
    
    private lazy var transferButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        element.setTitle("Pass the move", for: .normal)
        element.titleLabel?.textAlignment = .center
        element.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 17)
        element.layer.cornerRadius = 10
        element.setTitleColor(.white, for: .normal)
        element.addTarget(self, action: #selector(transferPressed), for: .touchUpInside)
        return element
    }()
}

extension CorrectViewController {
    
    private func setupViews() {
        view.addSubview(backgroundView)
        view.addSubview(teamView)
        view.addSubview(secondView)
        view.addSubview(scoreUnderStar)
        view.addSubview(transferButton)
        
        teamView.addSubview(teamImage)
        teamView.addSubview(teamNameInFirstView)
        teamView.addSubview(scoreInFirstView)
        teamView.addSubview(scoreLabelInFirstView)
        
        secondView.addSubview(congrLabel)
        secondView.addSubview(youReceiveLabel)
        secondView.addSubview(starImage)
        starImage.addSubview(scoreInTheStar)
        secondView.addSubview(nextMoveLabel)
        
        addConstraints()
    }
    
    private func addConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        teamView.snp.makeConstraints { make in
            make.height.equalTo(view.frame.size.height * 0.13)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(38)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        secondView.snp.makeConstraints { make in
            make.height.equalTo(view.frame.size.height * 0.45)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalTo(transferButton.snp.top).inset(-view.frame.height * 0.16)
        }
        
        transferButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        teamImage.snp.makeConstraints { make in
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
        
        congrLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }
        
        youReceiveLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(starImage.snp.top).inset(-10)
        }
        
        starImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(view.frame.height * 0.15)
        }
        
        scoreUnderStar.snp.makeConstraints { make in
            make.top.equalTo(starImage.snp.bottom).inset(5)
            make.centerX.equalToSuperview()
        }
        
        scoreInTheStar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        nextMoveLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(starImage.snp.bottom).inset(-20)
        }
    }
}
