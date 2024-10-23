import SwiftUI

struct ArtworkView: View {
    var artwork: ArtworkModel
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: artwork.imageId != nil ? "https://www.artic.edu/iiif/2/\(artwork.imageId!)/full/200,/0/default.jpg" : "url_default_image")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80.0, height: 80.0)
                    .cornerRadius(40)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80.0, height: 80.0)
                    .foregroundColor(.gray)
            }
            .padding(.all, 20)

            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("Title:")
                        .fontWeight(.semibold)
                    Text(artwork.title)
                }
                
                HStack {
                    Text("Artist:")
                        .fontWeight(.semibold)
                        .bold()
                    Text(artwork.artistTitle ?? "Unknown Artist") // Handle nil case
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
