//
//  ViewController.swift
//  CollectionView
//
//  Created by Arken Sarsenov on 15.04.2022.
//

import UIKit
import SwiftUI

enum UserAction: String, CaseIterable {
    case dowloandImage = "Dowloand Image"
    case users = "Users"
}

final class MainController: UIViewController{
    
    //MARK: - Properties
    
    private var collectionView: UICollectionView?
    private let layout = UICollectionViewFlowLayout()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCollectionView()
    }
    
    //MARK: - Configure UICollectionView
    private func configureCollectionView() {
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width - 30, height: 100)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: MainCell.reuseID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
    }
}


//MARK: - UICollectionView DataSource & Delegate

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.reuseID, for: indexPath) as! MainCell
        cell.configureCell(title: UserAction.allCases[indexPath.row].rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserAction.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = UserAction.allCases[indexPath.item]
        switch userAction {
        case .dowloandImage:
            let vc = PhotosController()
            navigationController?.pushViewController(vc, animated: true)
        case .users:
            let vc = UsersTController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//MARK: - UIPreviewProvider

struct MainControllerProvider: PreviewProvider {
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

