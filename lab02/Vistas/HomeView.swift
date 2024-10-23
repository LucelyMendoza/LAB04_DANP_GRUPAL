//
//  HomeView.swift
//  lab02
//
//  Created by Lucely Mendoza on 1/10/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var isLoggedin: Bool
    var body: some View {
        VStack {
            Text("Welcome to my application!")
                .padding()
        }
    }
}
