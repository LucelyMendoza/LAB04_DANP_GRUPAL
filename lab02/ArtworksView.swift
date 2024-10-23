import SwiftUI

struct ArtworksView: View {
    
    //MARK: - PROPERTIES
    @StateObject var artworksVM = ArtworksViewModel()
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(artworksVM.artworks, id: \.self) { artwork in
                        ArtworkView(artwork: artwork)
                            .onAppear {
                                artworksVM.loadMoreContent(currentItem: artwork)
                            }
                    }
                }
            }
            .navigationTitle("Artworks")
        }
    }
}
