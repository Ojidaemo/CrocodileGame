//
//  CategoryView.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-18.
//

import UIKit

class CategoryView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backgroundImage = UIImage(named: "background")
        let backgroundColor = UIColor(patternImage: backgroundImage!)
        self.backgroundColor = backgroundColor
        setupCheckmarkImages()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var checkmarkImageOne: UIImageView!
    private var checkmarkImageTwo: UIImageView!
    private var checkmarkImageThree: UIImageView!
    private var checkmarkImageFour: UIImageView!
    
    lazy var imageOne = createImageView(image: UIImage(named: "frog")!)
    lazy var imageTwo = createImageView(image: UIImage(named: "Avatar1")!)
    lazy var imageThree = createImageView(image: UIImage(named: "Avatar2")!)
    lazy var imageFour = createImageView(image: UIImage(named: "Avatar3")!)
    
    private let buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 25
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
        
    }()
    
    lazy var categoryOne: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.7483206391, green: 0.3211311698, blue: 0.8083065748, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Животные", for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .clear
        button.titleLabel?.font = UIFont(name: "Bhavuka", size: 20)
        button.addTarget(self, action: #selector(categoryOneTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var imageEllipse: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Ellipse")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    lazy var categoryTwo: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.831372549, blue: 0.1568627451, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Еда", for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .clear
        button.titleLabel?.font = UIFont(name: "Bhavuka", size: 20)
        button.addTarget(self, action: #selector(categoryTwoTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var categoryThree: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.5333333333, blue: 0.8470588235, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Личности", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Bhavuka", size: 20)
        button.addTarget(self, action: #selector(categoryThreeTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var categoryFour: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.2745098039, blue: 0.2745098039, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Хобби", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Bhavuka", size: 20)
        button.addTarget(self, action: #selector(categoryFourTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var startGame: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6549019608, blue: 0.1882352941, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Начать игру", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Bhavuka", size: 20)
        button.addTarget(self, action: #selector(startGamePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func createCheckmarkImage() -> UIImageView {
        let image = UIImageView()
        image.isHidden = true
        image.image = UIImage(systemName: "checkmark.circle")
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }
    
    private func setupCheckmarkImages() {
        checkmarkImageOne = createCheckmarkImage()
        checkmarkImageTwo = createCheckmarkImage()
        checkmarkImageThree = createCheckmarkImage()
        checkmarkImageFour = createCheckmarkImage()
    }
    
    func createImageView(image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }
    
    private func updateButtonAppearance(_ button: UIButton, checkmarkView: UIImageView) {
        button.isSelected ? (checkmarkView.isHidden = false) : (checkmarkView.isHidden = true)
        
    }
    
    //MARK: - Buttons' methods
    
    @objc func categoryOneTapped() {
        categoryOne.isSelected = !categoryOne.isSelected
        updateButtonAppearance(categoryOne, checkmarkView: checkmarkImageOne)
    }
    
    @objc func categoryTwoTapped() {
        categoryTwo.isSelected = !categoryTwo.isSelected
        updateButtonAppearance(categoryTwo, checkmarkView: checkmarkImageTwo)
        
    }
    
    @objc func categoryThreeTapped() {
        categoryTwo.isSelected = !categoryTwo.isSelected
        updateButtonAppearance(categoryTwo, checkmarkView: checkmarkImageThree)
    }
    
    @objc func categoryFourTapped() {
        categoryTwo.isSelected = !categoryTwo.isSelected
        updateButtonAppearance(categoryTwo, checkmarkView: checkmarkImageFour)
    }
    
    @objc func startGamePressed() {
        
    }
    
    private func setupViews() {
        categoryOne.addSubview(imageEllipse)
        categoryOne.addSubview(checkmarkImageOne)
        imageEllipse.addSubview(imageOne)
        categoryTwo.addSubview(imageTwo)
        categoryTwo.addSubview(checkmarkImageTwo)
        categoryThree.addSubview(imageThree)
        categoryThree.addSubview(checkmarkImageThree)
        categoryFour.addSubview(imageFour)
        categoryFour.addSubview(checkmarkImageFour)
        buttonsStack.addArrangedSubviews(categoryOne, categoryTwo, categoryThree, categoryFour)
        self.addSubview(startGame)
        self.addSubview(buttonsStack)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
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
