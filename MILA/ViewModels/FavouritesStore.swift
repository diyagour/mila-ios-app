import Foundation

class FavouritesStore: ObservableObject {
    @Published var favourites: [FavouriteBook] = []

    func add(_ book: FavouriteBook) {
        favourites.insert(book, at: 0)
    }
}
