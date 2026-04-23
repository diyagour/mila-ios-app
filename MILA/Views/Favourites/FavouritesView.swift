import SwiftUI

struct FavouritesView: View {

    @EnvironmentObject var favouritesStore: FavouritesStore

    @State private var title = ""
    @State private var author = ""
    @State private var notes = ""

    var body: some View {
        ZStack {
            SpaceBackground()

            ScrollView {
                VStack(spacing: 24) {

                    // 🔹 TITLE
                    Text("My Favourites")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)

                    // ✨ INPUT CARD
                    GlassCard {
                        VStack(alignment: .leading, spacing: 16) {

                            // 📖 BOOK NAME
                            Text("Book Name")
                                .foregroundColor(.white)
                                .font(.headline)

                            TextField("Enter book name", text: $title)
                                .foregroundColor(.white)
                                .accentColor(.cyan)
                                .padding()
                                .background(Color.white.opacity(0.18))
                                .cornerRadius(12)

                            // ✍️ AUTHOR
                            Text("Author")
                                .foregroundColor(.white)
                                .font(.headline)

                            TextField("Enter author name", text: $author)
                                .foregroundColor(.white)
                                .accentColor(.cyan)
                                .padding()
                                .background(Color.white.opacity(0.18))
                                .cornerRadius(12)

                            // 💡 NOTES
                            Text("What I loved / learned")
                                .foregroundColor(.white)
                                .font(.headline)

                            TextEditor(text: $notes)
                                .foregroundColor(.white)
                                .scrollContentBackground(.hidden)
                                .padding()
                                .frame(height: 120)
                                .background(Color.white.opacity(0.18))
                                .cornerRadius(12)
                        }
                    }

                    // ⭐ SAVE BUTTON
                    Button {
                        let fav = FavouriteBook(
                            title: title,
                            author: author,
                            notes: notes
                        )
                        favouritesStore.add(fav)

                        title = ""
                        author = ""
                        notes = ""
                    } label: {
                        Text("Save Favourite ⭐️")
                            .bold()
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.cyan)
                            .cornerRadius(14)
                    }

                    // 📚 SAVED FAVOURITES
                    VStack(spacing: 14) {
                        ForEach(favouritesStore.favourites) { fav in
                            GlassCard {
                                VStack(alignment: .leading, spacing: 6) {

                                    Text(fav.title)
                                        .font(.headline)
                                        .foregroundColor(.white)

                                    Text("by \(fav.author)")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.85))

                                    Text(fav.notes)
                                        .foregroundColor(.white.opacity(0.65))
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}
