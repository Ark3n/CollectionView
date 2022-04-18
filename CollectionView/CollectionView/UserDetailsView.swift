//
//  UserDetailsView.swift
//  CollectionView
//
//  Created by Arken Sarsenov on 18.04.2022.
//

import UIKit


class UserDetailsView: UIView {

    var titleLabel: UILabel  = {
        let label = UILabel()
        return label
    }()
    
    var spaceLabel: UILabel  = {
        let label = UILabel()
        label.text = ":  "
        return label
    }()
    
    var valueLabel: UILabel  = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
   lazy var deviderView: UIView = {
        let devider = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
       devider.backgroundColor = UIColor.FlatColor.Green.PersianGreen
        devider.translatesAutoresizingMaskIntoConstraints = false
        return devider
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        let labelsStackView = UIStackView(arrangedSubviews: [titleLabel, spaceLabel, valueLabel])
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.axis = .horizontal
        labelsStackView.alignment = .leading
        addSubview(labelsStackView)
        addSubview(deviderView)
        labelsStackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10)
        deviderView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
        self.setHeight(50)
    }
    
    func configureView(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


