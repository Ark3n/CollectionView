//
//  UserDetailsController.swift
//  CollectionView
//
//  Created by Arken Sarsenov on 17.04.2022.
//

import UIKit
import MapKit

class UserDetailsController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - Properties
    
    var user:User?
    
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.isDirectionalLockEnabled = true
        sv.showsHorizontalScrollIndicator = false
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
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.isScrollEnabled = true
        map.isZoomEnabled = true
        return map
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        scrollView.delegate = self
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
            let lat = Double((user.address?.geo?.lat)!)
            let lng = Double((user.address?.geo?.lng)!)
            if let lat = lat, let lng = lng {
            let userLoaction = CLLocation(latitude: lat, longitude: lng)
            mapView.setLocation(userLoaction)
                
            }
        }
        mapView.setDimensions(height: 400, width: view.frame.width)
        let stackView = UIStackView(arrangedSubviews: [mapView, nameView, usernameView, emailView, phoneView, websiteView, companyView,
                                                      catchPhraseView, bsView, streetView, suiteView, cityView, zipcodeView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 2
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 8, paddingRight: 8)
        stackView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingLeft: 10, paddingRight: 20)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
}


extension MKMapView {
    func setLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
        print("DEBUG \(location)")
    }
}
