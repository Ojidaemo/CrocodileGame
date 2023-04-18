//
//  ViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class MainViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    backgroundImageConstraints()
    crocodileImageConstraints()
    startGameButtonConstraints()
    rulesButtonConstraints()
    stackImageConstraints()


  }

  private lazy var backroundImage: UIImageView = {

    let image = UIImageView()
    image.image = UIImage(named: "background")
    image.translatesAutoresizingMaskIntoConstraints = false
    return image

  }()

  private lazy var crocodileImage: UIImageView = {
         let theImageView = UIImageView()
         theImageView.image = UIImage(named: "pngwing 1")
         theImageView.translatesAutoresizingMaskIntoConstraints = false
         return theImageView
      }()


  private lazy var startGameButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Старт Игры", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .green



    return button
  }()


  private lazy var rulesButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Правила", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .green



    return button
  }()


  private lazy var grassImageOne: UIImageView = {
         let theImageView = UIImageView()
         theImageView.image = UIImage(named: "grass 2")

          return theImageView
      }()

  private lazy var grassImageTwo: UIImageView = {
         let theImageView = UIImageView()
         theImageView.image = UIImage(named: "grass 3")

         return theImageView
      }()


  private lazy var stackViewImages: UIStackView = {

    let stack = UIStackView()
       stack.axis = .horizontal
       stack.spacing = 180.0
       stack.alignment = .fill
       stack.distribution = .fillEqually
    stack.addArrangedSubview(grassImageOne)
    stack.addArrangedSubview(grassImageTwo)
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


  func crocodileImageConstraints() {

    view.addSubview(crocodileImage)

    NSLayoutConstraint.activate([

      crocodileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      crocodileImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      crocodileImage.widthAnchor.constraint(equalToConstant: 268),
      crocodileImage.heightAnchor.constraint(equalToConstant: 280)
    ])

  }





  func startGameButtonConstraints() {
    view.addSubview(startGameButton)

    NSLayoutConstraint.activate([

      startGameButton.topAnchor.constraint(equalTo: crocodileImage.bottomAnchor, constant: 20),
      startGameButton.widthAnchor.constraint(equalToConstant: 274),
      startGameButton.heightAnchor.constraint(equalToConstant: 83),
      startGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)



    ])
  }


  func rulesButtonConstraints() {
    view.addSubview(rulesButton)

    NSLayoutConstraint.activate([

      rulesButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 39),
      rulesButton.widthAnchor.constraint(equalToConstant: 211),
      rulesButton.heightAnchor.constraint(equalToConstant: 63),
      rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)



    ])
  }


  func stackImageConstraints() {

    view.addSubview(stackViewImages)

    NSLayoutConstraint.activate([

      stackViewImages.topAnchor.constraint(equalTo: rulesButton.bottomAnchor, constant: 19),
      stackViewImages.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
      stackViewImages.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      stackViewImages.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)

    ])

  }




}

