import SwiftUI

struct MainTabView: View {

    @State private var selectedTab: Int = 0   // ✅ REQUIRED
    
    var body: some View {
        TabView(selection: $selectedTab) {

            // 📚 Library — tag 0
            LibraryView()
                .tabItem {
                    Label("Library", systemImage: "books.vertical")
                }
                .tag(0)

            // ✍️ Create — tag 1
            CreateStoryFlowView()
                .tabItem {
                    Label("Create", systemImage: "plus.square")
                }
                .tag(1)

            // ⭐ Favourites — tag 2
            FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "star.fill")
                }
                .tag(2)

            // ✨ Story Magic — tag 3
            StoryMagicView()
                .tabItem {
                    Label("Magic", systemImage: "wand.and.stars")
                }
                .tag(3)

            // ⚙️ Settings — tag 4
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag(4)
        }
    }
}
