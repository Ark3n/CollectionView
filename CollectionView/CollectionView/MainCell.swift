//
//  MainCell.swift
//  CollectionView
//
//  Created by Arken Sarsenov on 15.04.2022.
//

import UIKit
import SwiftUI

final class MainCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let reuseID = "mainCell"
    let cellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.FlatColor.Green.PersianGreen
        layer.cornerRadius = 16
        clipsToBounds = true
        addSubview(cellLabel)
        cellLabel.center(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(title: String) {
        cellLabel.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
}



//MARK: - UIPreviewProvider

struct MainCellProvider: PreviewProvider {
    static var previews: some View {
        ConteinerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ConteinerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            MainController()
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

