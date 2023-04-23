//
//  NavController.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-19.
//

import UIKit

class NavController: UINavigationController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        config()
    }
    
    private func config() {
        navigationBar.backgroundColor = .clear
        navigationBar.backIndicatorImage = UIImage(named: Resources.Image.arrow)?.withRenderingMode(.alwaysOriginal)
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: Resources.Image.arrow)
        navigationBar.tintColor = .label
        let backButton = UIBarButtonItem()
        navigationBar.topItem?.backBarButtonItem = backButton
        
        // Set the font and size of the title
        let titleFont = UIFont(name: Resources.Fonts.changaBold, size: 22)
        let titleColor = UIColor.black
        let attributes: [NSAttributedString.Key: Any] = [
            .font: titleFont as Any,
            .foregroundColor: titleColor
        ]
        navigationBar.titleTextAttributes = attributes
    }
}
