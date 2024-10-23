//
//  Users.swift
//  lab02
//
//  Created by Lucely Mendoza on 17/10/24.
//

import Foundation

// Este es el modelo para representar la respuesta de la API
struct Users: Decodable {
    let results: [UserModel]
}

// Este es el modelo para representar cada usuario
struct UserModel: Decodable, Hashable {
    let id: UUID = UUID() // Añadimos un ID único para conformar con Hashable
    let name: Name
    let email: String
    let picture: Picture

    // Definimos los CodingKeys si necesitas un mapeo específico
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case picture
    }
}

// Modelo para representar el nombre del usuario
struct Name: Decodable, Hashable {
    let title: String
    let first: String
    let last: String
}

// Modelo para representar la imagen del usuario
struct Picture: Decodable, Hashable {
    let large: URL
    let medium: URL
    let thumbnail: URL
}
