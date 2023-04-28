//
//  CategoryView.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-18.
//

import UIKit

protocol startGameProtocol: AnyObject {
    func startGamePressed(sender: UIButton)
}

protocol ButtonTargetDelegate: AnyObject {
    func buttonTapped(sender: UIButton)
}

final class CategoryView: UIView {
    
    weak var delegateStartGame: startGameProtocol?
    weak var delegate: ButtonTargetDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCheckmarkImages()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var checkmarkImageOne: UIImageView!
    var checkmarkImageTwo: UIImageView!
    var checkmarkImageThree: UIImageView!
    var checkmarkImageFour: UIImageView!
    
    lazy var imageOne = createImageView(image: UIImage(named: Resources.Image.frog)!)
    lazy var imageTwo = createImageView(image: UIImage(named: Resources.Image.burger)!)
    lazy var imageThree = createImageView(image: UIImage(named: Resources.Image.cowboy)!)
    lazy var imageFour = createImageView(image: UIImage(named: Resources.Image.nails)!)
    
    private let backgroundView: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: Resources.Image.backGround)
        background.contentMode = .scaleToFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    private let buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 25
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var categoryOne: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.backgroundColor = UIColor(named: Resources.Colors.buttonViolet)
        button.layer.cornerRadius = 10
        button.setTitle("Animals", for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .clear
        button.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var imageEllipse: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Resources.Image.whiteCircle)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    lazy var categoryTwo: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.backgroundColor = UIColor(named: Resources.Colors.buttonLightGreen)
        button.layer.cornerRadius = 10
        button.setTitle("Food", for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .clear
        button.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var categoryThree: UIButton = {
        let button = UIButton()
        button.tag = 3
        button.backgroundColor = UIColor(named: Resources.Colors.buttonBlue)
        button.layer.cornerRadius = 10
        button.setTitle("Personalities", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var categoryFour: UIButton = {
        let button = UIButton()
        button.tag = 4
        button.backgroundColor = UIColor(named: Resources.Colors.buttonRed)
        button.layer.cornerRadius = 10
        button.setTitle("Hobbies", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var startGame: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        button.layer.cornerRadius = 10
        button.setTitle("Start game", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        button.addTarget(self, action: #selector(startGamePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func createCheckmarkImage() -> UIImageView {
        let image = UIImageView()
        image.isHidden = true
        image.image = UIImage(named: Resources.Image.checkmark)
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }
    
    func createImageView(image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }
    
    //MARK: - Methods
    
    func setupCheckmarkImages() {
        checkmarkImageOne = createCheckmarkImage()
        checkmarkImageTwo = createCheckmarkImage()
        checkmarkImageThree = createCheckmarkImage()
        checkmarkImageFour = createCheckmarkImage()
    }
    
    @objc func categoryButtonTapped(_ sender: UIButton) {
        delegate?.buttonTapped(sender: sender)
    }
    
    @objc func startGamePressed(_ sender: UIButton) {
        delegateStartGame?.startGamePressed(sender: sender)
    }
}

//MARK: - Constraints

extension CategoryView {
    
    private func setupViews() {
        categoryOne.addSubviewsToButton(imageEllipse, checkmarkImageOne)
        categoryTwo.addSubviewsToButton(imageTwo, checkmarkImageTwo)
        categoryThree.addSubviewsToButton(imageThree, checkmarkImageThree)
        categoryFour.addSubviewsToButton(imageFour, checkmarkImageFour)
        imageEllipse.addSubview(imageOne)
        buttonsStack.addArrangedSubviews(categoryOne, categoryTwo, categoryThree, categoryFour)
        self.addSubviews(backgroundView, startGame, buttonsStack)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageEllipse.leadingAnchor.constraint(equalTo: categoryOne.leadingAnchor, constant: 25),
            imageEllipse.centerYAnchor.constraint(equalTo: categoryOne.centerYAnchor),
            
            imageOne.centerXAnchor.constraint(equalTo: imageEllipse.centerXAnchor),
            imageOne.centerYAnchor.constraint(equalTo: imageEllipse.centerYAnchor),
            
            checkmarkImageOne.trailingAnchor.constraint(equalTo: categoryOne.trailingAnchor, constant: -25),
            checkmarkImageOne.centerYAnchor.constraint(equalTo: categoryOne.centerYAnchor),
            
            checkmarkImageTwo.trailingAnchor.constraint(equalTo: categoryTwo.trailingAnchor, constant: -25),
            checkmarkImageTwo.centerYAnchor.constraint(equalTo: categoryTwo.centerYAnchor),
            
            checkmarkImageThree.trailingAnchor.constraint(equalTo: categoryThree.trailingAnchor, constant: -25),
            checkmarkImageThree.centerYAnchor.constraint(equalTo: categoryThree.centerYAnchor),
            
            checkmarkImageFour.trailingAnchor.constraint(equalTo: categoryFour.trailingAnchor, constant: -25),
            checkmarkImageFour.centerYAnchor.constraint(equalTo: categoryFour.centerYAnchor),
            
            imageTwo.leadingAnchor.constraint(equalTo: categoryTwo.leadingAnchor, constant: 25),
            imageTwo.centerYAnchor.constraint(equalTo: categoryTwo.centerYAnchor),
            
            imageThree.leadingAnchor.constraint(equalTo: categoryThree.leadingAnchor, constant: 25),
            imageThree.centerYAnchor.constraint(equalTo: categoryThree.centerYAnchor),
            
            imageFour.leadingAnchor.constraint(equalTo: categoryFour.leadingAnchor, constant: 25),
            imageFour.centerYAnchor.constraint(equalTo: categoryFour.centerYAnchor),
            
            startGame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            startGame.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            startGame.heightAnchor.constraint(equalToConstant: 60),
            startGame.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -60),
            
            buttonsStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            buttonsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            buttonsStack.topAnchor.constraint(equalTo: topAnchor, constant: 180),
            buttonsStack.bottomAnchor.constraint(equalTo: startGame.topAnchor, constant: -50)
        ])
    }
}
