//
//  UserView.swift
//  lab02
//
//  Created by Lucely Mendoza on 17/10/24.
//

import SwiftUI

struct UserView: View {
    var user: UserModel
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: user.picture.large) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80.0, height: 80.0)
                    .cornerRadius(40)
            } placeholder: {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80.0, height: 80.0)
                    .foregroundColor(.orange)
            }
            .padding(.all, 20)

            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("First Name:")
                        .fontWeight(.semibold)
                    Text(user.name.first)
                }
                
                HStack {
                    Text("Last Name:")
                        .fontWeight(.semibold)
                        .bold()
                    Text(user.name.last)
                }
                
                HStack {
                    Text("Email:")
                        .fontWeight(.semibold)
                    Text(user.email)
                }
            }
            .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10.0)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 0)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}
