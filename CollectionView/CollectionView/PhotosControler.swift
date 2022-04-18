//
//  PhotosControler.swift
//  CollectionView
//
//  Created by Arken Sarsenov on 15.04.2022.
//

import UIKit
import SwiftUI

final class PhotosController: UIViewController {
    
    //MARK: - Properties
    
    var photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    var activityIndicator: UIActivityIndicatorView  = {
        let ai = UIActivityIndicatorView()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.FlatColor.Gray.WhiteSmoke
        view.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoImageView)
        photoImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.center(inView: view)
        activityIndicator.startAnimating()
        fetchImage()
    }
    
    //MARK: - func dowloads Image from Internet
    
    private func fetchImage() {
        guard let url = URL(string: ApiConstants.imageUrl) else {
            fatalError("can't dowloand data")
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) {[weak self] data, responce, error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
            }
            if let responce = responce as? HTTPURLResponse {
                print("DEBUG: \(responce.statusCode)")
            }
            
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self!.activityIndicator.stopAnimating()
                    self!.photoImageView.image = image
                }
            }
        }
        task.resume()
    }
}


//MARK: - PreviewProvider

struct PhotosProvider: PreviewProvider {
    
    static var previews: some View {
        ConteinerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ConteinerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: Context) -> some UIViewController {
            PhotosController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
