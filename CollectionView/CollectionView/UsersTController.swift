//
//  UsersTController.swift
//  CollectionView
//
//  Created by Arken Sarsenov on 17.04.2022.
//

import UIKit
import SwiftUI

class UsersTController: UITableViewController {
    
    var users: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchData()
        navigationController?.navigationBar.tintColor = UIColor.FlatColor.Green.PersianGreen
        
    }
    
    //MARK:  - Fetch DATA
    
    func fetchData() {
        
        guard let url = URL(string: ApiConstants.usersUrl) else {return}
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let responce = response as? HTTPURLResponse else { return}
            print("DEBUG: \(responce.statusCode)")
            guard let data = data else {return}
            print("DEBUG: Data did fetch")
            do {
                self?.users = try JSONDecoder().decode([User].self, from: data)
            } catch let error {
                print("DEBUG: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        task.resume()
    }
    
   
    //MARK: - ConfigureUI
    
    private func configureUI() {

        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseID) as? UserCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = users[indexPath.row].name
        cell.usernameLabel.text = users[indexPath.row].username
        
        //cell.configureCell(name: users[indexPath.row].name, username: users[indexPath.row].username)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UserDetailsController()
        vc.user = users[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


//MARK: - PriviewProvider

struct UsersTableViewProvider: PreviewProvider {
    static var previews: some View {
        ConteinerView()
    }
    struct ConteinerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            UsersTController()
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
