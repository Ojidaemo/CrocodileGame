//
//  ResultCell.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-25.
//

import UIKit

class ResultCell: UITableViewCell {
    
    static let identifier = "ResultCell"
    
    lazy var imageOne = createImageView(image: UIImage(named: Resources.Image.cowboy)!)
    lazy var labelOne = createLabelWithTeamName(title: "Cowboys")
    lazy var scoreLabelOne = createScoreLabel()
    lazy var teamOneScore = createTeamScoreLabel(text: "10")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15))
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with data: Teams) {
        imageOne.image = UIImage(named: data.teamImage)
        labelOne.text = data.name
        teamOneScore.text = String(data.score)
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
        label.text = "Scores"
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
        contentView.addSubviews(labelOne, imageOne, scoreLabelOne, teamOneScore)
    }
    
}



//MARK: - Constraints

extension ResultCell {
    
    private func setupConstraints() {
        print(self.frame.size.height)
        NSLayoutConstraint.activate([
            
            labelOne.heightAnchor.constraint(equalToConstant: self.frame.size.height * 1.96),
            labelOne.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelOne.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageOne.leadingAnchor.constraint(equalTo: labelOne.leadingAnchor, constant: 25),
            imageOne.centerYAnchor.constraint(equalTo: labelOne.centerYAnchor),
            
            scoreLabelOne.trailingAnchor.constraint(equalTo: labelOne.trailingAnchor, constant: -15),
            scoreLabelOne.bottomAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: -8),
            
            teamOneScore.trailingAnchor.constraint(equalTo: labelOne.trailingAnchor, constant: -15),
            teamOneScore.centerYAnchor.constraint(equalTo: labelOne.centerYAnchor),
        ])
    }
}

