import Foundation

struct FavouriteBook: Identifiable {
    let id = UUID()
    var title: String
    var author: String
    var notes: String
    var dateAdded: Date = Date()
}
