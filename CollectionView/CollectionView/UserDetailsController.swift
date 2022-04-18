//
//  UserDetailsController.swift
//  CollectionView
//
//  Created by Arken Sarsenov on 17.04.2022.
//

import UIKit
import SwiftUI
import MapKit

class UserDetailsController: UIViewController {
    
    //MARK: - Properties
    
    var user:User?
    
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameView = UserDetailsView()
    let usernameView = UserDetailsView()
    let emailView = UserDetailsView()
    let phoneView = UserDetailsView()
    let websiteView = UserDetailsView()
    let companyView = UserDetailsView()
    let catchPhraseView = UserDetailsView()
    let bsView = UserDetailsView()
    let streetView = UserDetailsView()
    let suiteView = UserDetailsView()
    let cityView = UserDetailsView()
    let zipcodeView = UserDetailsView()
    

    
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        
    }
    
    func configureUI() {
        if let user = user {
            nameView.configureView(title: "name", value: user.name!)
            usernameView.configureView(title: "username", value: user.username!)
            emailView.configureView(title: "email", value: user.email!)
            phoneView.configureView(title: "phone", value: user.phone!)
            websiteView.configureView(title: "website", value: user.website!)
            companyView.configureView(title: "company", value: (user.company?.name!)!)
            catchPhraseView.configureView(title: "catch Phrase", value: (user.company?.catchPhrase!)!)
            bsView.configureView(title: "BS", value: (user.company?.bs!)!)
            streetView.configureView(title: "street", value: (user.address?.street!)!)
            suiteView.configureView(title: "suite", value: (user.address?.suite!)!)
            cityView.configureView(title: "city", value: (user.address?.city!)!)
            zipcodeView.configureView(title: "zip code", value: (user.address?.zipcode!)!)
            
        }
        
        let stackView = UIStackView(arrangedSubviews: [nameView, usernameView, emailView, phoneView, websiteView, companyView,
                                                      catchPhraseView, bsView, streetView, suiteView, cityView, zipcodeView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
    
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        contentView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor)
        stackView.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, left: contentView.safeAreaLayoutGuide.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.safeAreaLayoutGuide.rightAnchor, paddingLeft: 20, paddingRight: 20)
    }
}

//MARK: - PreviewProvider

struct UserDetailsProvider: PreviewProvider {
    static var previews: some View {
        ConteinerView()
    }
    
    struct ConteinerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            UserDetailsController()
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
