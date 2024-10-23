//
//  ContentView.swift
//  lab02
//
//  Created by Lucely Mendoza on 1/10/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var isLoggedin: Bool

    var body: some View {
        TabView {
            NavigationView {
                HomeView(isLoggedin: $isLoggedin)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Logout") {
                                isLoggedin = false
                            }
                            .foregroundColor(.blue)
                        }
                    }
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            NavigationView {
                ArtworksView()
            }
            .tabItem {
                Label("Pinturas", systemImage: "paintpalette.fill")
            }
            
            NavigationView {
                UsersView() // Vista de lista de usuarios
            }
            .tabItem {
                Label("Users", systemImage: "person.fill")
            }

            NavigationView {
                MapaView()
            }
            .tabItem {
                Label("Mapa", systemImage: "map.fill")
            }
        }
    }
}
