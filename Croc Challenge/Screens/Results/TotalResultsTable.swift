//
//  TotalResults.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-25.
//

import UIKit
import SnapKit

class ResultTableView: UIView {
    
    var tableView = UITableView()
    private let teamManager = TeamsManager.shared

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTableDelegates()
        configureTable()
        setupViews()
        setupConstraints()
    }
    
    private let backgroundView: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: Resources.Image.backGround)
        background.contentMode = .scaleToFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear results", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        button.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func resetButtonPressed() {
        teamManager.teamResults = []
        teamManager.saveData(dataToSave: teamManager.teamResults)
        tableView.reloadData()
    }
    
    func configureTable() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ResultCell.self, forCellReuseIdentifier: ResultCell.identifier)
    }
    
    func setTableDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupViews() {
        self.addSubview(backgroundView)
        self.addSubviews(resetButton)
        self.addSubview(tableView)
    }
    
    func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        resetButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(80)
            make.height.equalTo(63)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.left.equalToSuperview()
            make.bottom.equalTo(resetButton.snp.top).inset(-20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TableView Delegate
extension ResultTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamManager.teamResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.identifier, for: indexPath) as? ResultCell else { return UITableViewCell() }
        let result = teamManager.teamResults[indexPath.row]
        cell.configureCell(with: result)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        116
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
