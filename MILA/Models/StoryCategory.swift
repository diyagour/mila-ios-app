import SwiftUI

enum StoryCategory: String, CaseIterable, Identifiable {

    case all
    case fantasy
    case sciFi
    case adventure
    case educational

    var id: String { rawValue }

    var title: String {
        switch self {
        case .all: return "All"
        case .fantasy: return "Fantasy"
        case .sciFi: return "Sci-Fi"
        case .adventure: return "Adventure"
        case .educational: return "Educational"
        }
    }

    var color: Color {
        switch self {
        case .all: return .gray
        case .fantasy: return .green
        case .sciFi: return .cyan
        case .adventure: return .orange
        case .educational: return .yellow
        }
    }
}
