//
//  ResultsView.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-18.
//

import UIKit

class ResultsView: UIView {

    lazy var imageOne = createImageView(image: UIImage(named: "Avatar1")!)
    lazy var imageTwo = createImageView(image: UIImage(named: "Avatar2")!)
    lazy var imageThree = createImageView(image: UIImage(named: "Avatar3")!)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backgroundImage = UIImage(named: "background")
        let backgroundColor = UIColor(patternImage: backgroundImage!)
        self.backgroundColor = backgroundColor
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var restartGame: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6549019608, blue: 0.1882352941, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Начать сначала", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Bhavuka", size: 20)
        button.addTarget(self, action: #selector(restartPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func restartPressed() {
        
    }
    
    private func setupViews() {
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            restartGame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            restartGame.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            restartGame.heightAnchor.constraint(equalToConstant: 60),
            restartGame.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -60),
            
        ])
    }
    
    
    func createImageView(image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }
    
}
