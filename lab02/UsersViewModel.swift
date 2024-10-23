//
//  UsersViewModel.swift
//  lab02
//
//  Created by Lucely Mendoza on 17/10/24.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    var totalPages = 1
    var page: Int = 1
    
    init() {
        getUsers()
    }
    
    func loadMoreContent(currentItem item: UserModel) {
        if let lastUser = users.last, lastUser.id == item.id, (page + 1) <= totalPages {
            page += 1
            getUsers()
        }
    }
    
    func getUsers() {
        let apiUrl = "https://randomuser.me/api/?page=\(page)&results=20"
        guard let url = URL(string: apiUrl) else { return }
        
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let data = data else { return }
            do {
                let usersResponse = try decoder.decode(Users.self, from: data)
                DispatchQueue.main.async {
                    self?.users.append(contentsOf: usersResponse.results)
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}
