//
//  UserCell.swift
//  CollectionView
//
//  Created by Arken Sarsenov on 17.04.2022.
//

import UIKit

class UserCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let reuseID = "UserCell"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textColor = UIColor.FlatColor.Green.PersianGreen
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        label.textColor = UIColor.FlatColor.Green.Fern
        return label
    }()
    
    private lazy var chevronImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "chevron.right")
        iv.tintColor = UIColor.FlatColor.Green.PersianGreen
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    
    //MARK: - configureUI
    private func configureUI() {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, usernameLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 8, paddingBottom: 10, paddingRight: 8)
        addSubview(chevronImageView)
        chevronImageView.anchor(right: rightAnchor, paddingRight: 20)
        chevronImageView.centerY(inView: stackView)
    }
    
    func configureCell(name: String, username: String){
        
        nameLabel.text = name
        usernameLabel.text = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
