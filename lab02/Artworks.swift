import Foundation

// This is the model for representing the API response
struct Artworks: Decodable {
    let data: [ArtworkModel]
}

// This is the model for representing each artwork
struct ArtworkModel: Decodable, Hashable {
    let id: Int
    let title: String
    let artistTitle: String?
    let imageId: String? // Cambiado a String? para manejar posibles nulos

    // Map the JSON keys to Swift properties
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case artistTitle = "artist_title"
        case imageId = "image_id"
    }
}
