import Foundation
import Combine

class ArtworksViewModel: ObservableObject {
    @Published var artworks: [ArtworkModel] = []
    var totalPages = 1
    var page: Int = 1
    
    init() {
        getArtworks()
    }
    
    func loadMoreContent(currentItem item: ArtworkModel) {
        if let lastArtwork = artworks.last, lastArtwork.id == item.id, (page + 1) <= totalPages {
            page += 1
            getArtworks()
        }
    }
    
    func getArtworks() {
        let apiUrl = "https://api.artic.edu/api/v1/artworks?page=\(page)&limit=20"
        guard let url = URL(string: apiUrl) else { return }

        let decoder = JSONDecoder()

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let data = data else { return }

            // Imprimir JSON para depuración
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON Response: \(jsonString)")
            }

            do {
                let artworksResponse = try decoder.decode(Artworks.self, from: data)
                DispatchQueue.main.async {
                    self?.artworks.append(contentsOf: artworksResponse.data)
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}
