import SwiftUI

@main
struct MILApp: App {

    // 👇 ADD THIS INIT (THIS IS THE FIX)
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    @StateObject private var authVM = AuthViewModel()
    @StateObject private var storyStore = StoryStore()
    @StateObject private var progressStore = ReadingProgressStore()
    @StateObject private var favouritesStore = FavouritesStore()
    @StateObject private var magicStore = StoryMagicStore()

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(authVM)
                .environmentObject(storyStore)
                .environmentObject(progressStore)
                .environmentObject(favouritesStore)
                .environmentObject(magicStore)
        }
    }
}
