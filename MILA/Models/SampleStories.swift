import SwiftUI

struct SampleStories {

    static let all: [Story] = [

        // 1️⃣ Fantasy — The Magic Forest
        Story(
            title: "The Magic Forest",
            author: "Emma Wilson",
            category: .fantasy,
            coverColor: .green,
            icon: "leaf.fill",
            pages: [
                StoryPage(text: "Beyond the silver hills lay a forest untouched by time, where sunlight filtered softly through emerald leaves and the air shimmered with ancient magic that few had ever witnessed."),
                StoryPage(text: "The trees whispered secrets older than kingdoms, their roots tangled with spells forgotten by history, humming gently beneath the forest floor."),
                StoryPage(text: "Elara stepped inside with cautious wonder, feeling the ground respond to her presence as if the forest itself recognized her spirit."),
                StoryPage(text: "In that quiet moment, she realized the forest had chosen her, and once chosen, destiny could never be escaped.")
            ]
        ),

        // 2️⃣ Fantasy — Ashes and Embers
        Story(
            title: "Ashes and Embers",
            author: "Ethan Cole",
            category: .fantasy,
            coverColor: .orange,
            icon: "flame.fill",
            pages: [
                StoryPage(text: "The world burned beneath a crimson sky, cities reduced to ash as fear spread faster than fire."),
                StoryPage(text: "From the ruins, something ancient stirred, awakened by destruction and long-forgotten rage."),
                StoryPage(text: "Flames were no longer symbols of loss alone, but of power waiting to be claimed."),
                StoryPage(text: "From ashes came embers, and from embers, a rebirth that would change everything.")
            ]
        ),

        // 3️⃣ Fantasy — Shadows of the Crown
        Story(
            title: "Shadows of the Crown",
            author: "Noah King",
            category: .fantasy,
            coverColor: .purple,
            icon: "crown.fill",
            pages: [
                StoryPage(text: "The crown was forged in fire and blood, carrying the weight of countless wars and broken oaths."),
                StoryPage(text: "Kings rose and fell for its power, their names erased but their mistakes remembered."),
                StoryPage(text: "A forgotten heir returned from exile, burdened with fear, hope, and destiny."),
                StoryPage(text: "The throne would not remain empty, and the shadows of the past began to stir.")
            ]
        ),

        // 4️⃣ Sci-Fi — Echoes of Andromeda
        Story(
            title: "Echoes of Andromeda",
            author: "Liam Carter",
            category: .sciFi,
            coverColor: .blue,
            icon: "sparkles",
            pages: [
                StoryPage(text: "At exactly 3:17 AM, a mysterious signal pierced through Earth’s communication systems without warning."),
                StoryPage(text: "It was not human, yet it spoke directly to the mind, filling scientists with awe and unease."),
                StoryPage(text: "Governments denied its existence, but observatories across the globe recorded the same anomaly."),
                StoryPage(text: "Humanity had finally been noticed by the universe, and silence would never be the same again.")
            ]
        ),

        // 5️⃣ Sci-Fi — Neon Skies
        Story(
            title: "Neon Skies",
            author: "Maya Chen",
            category: .sciFi,
            coverColor: .cyan,
            icon: "bolt.fill",
            pages: [
                StoryPage(text: "The city never slept beneath glowing neon lights, where rain-soaked streets reflected endless advertisements."),
                StoryPage(text: "Drones ruled the skies while data ruled people, turning freedom into a controlled illusion."),
                StoryPage(text: "One hacker uncovered a truth buried deep within the system, carefully hidden for decades."),
                StoryPage(text: "In a world controlled by code, rebellion began with a single keystroke.")
            ]
        ),

        // 6️⃣ Adventure — The Last Map
        Story(
            title: "The Last Map",
            author: "Oliver Reed",
            category: .adventure,
            coverColor: .brown,
            icon: "map.fill",
            pages: [
                StoryPage(text: "The map was torn and faded, its markings barely visible beneath layers of dust and time."),
                StoryPage(text: "Legends claimed it led to a treasure powerful enough to rewrite history itself."),
                StoryPage(text: "Many had followed its path, venturing into danger, never to return."),
                StoryPage(text: "When she found it hidden in the attic, a journey beyond imagination began.")
            ]
        ),

        // 7️⃣ Adventure — Beyond the Horizon
        Story(
            title: "Beyond the Horizon",
            author: "Ryan Hale",
            category: .adventure,
            coverColor: .teal,
            icon: "sailboat.fill",
            pages: [
                StoryPage(text: "The sea stretched endlessly before them, hiding secrets beyond the distant horizon."),
                StoryPage(text: "Armed with courage and an old compass, the crew sailed into uncharted waters."),
                StoryPage(text: "Storms tested their resolve, waves crashing like thunder against the ship."),
                StoryPage(text: "Still, they sailed on, knowing adventure favored the brave.")
            ]
        ),

        // 8️⃣ Educational — The Curious Mind
        Story(
            title: "The Curious Mind",
            author: "Dr. Ananya Rao",
            category: .educational,
            coverColor: .yellow,
            icon: "brain.head.profile",
            pages: [
                StoryPage(text: "Curiosity is the foundation of learning, driving humans to question and explore the world around them."),
                StoryPage(text: "From childhood, curiosity helps us understand nature, science, and society."),
                StoryPage(text: "Every invention begins with a question, no matter how simple it seems."),
                StoryPage(text: "A curious mind never stops growing, adapting, and discovering.")
            ]
        ),

        // 9️⃣ Educational — How Technology Shapes Us
        Story(
            title: "How Technology Shapes Us",
            author: "Amit Verma",
            category: .educational,
            coverColor: .indigo,
            icon: "desktopcomputer",
            pages: [
                StoryPage(text: "Technology has transformed how humans communicate, learn, and interact with the world."),
                StoryPage(text: "From smartphones to artificial intelligence, tools influence behavior and decisions."),
                StoryPage(text: "Understanding technology allows us to use it responsibly and ethically."),
                StoryPage(text: "The future belongs to those who learn, adapt, and innovate.")
            ]
        ),

        // 🔟 Educational — The Power of Habit
        Story(
            title: "The Power of Habit",
            author: "Neha Sharma",
            category: .educational,
            coverColor: .mint,
            icon: "repeat",
            pages: [
                StoryPage(text: "Habits shape daily life more than we realize, guiding actions without conscious effort."),
                StoryPage(text: "Small habits, repeated consistently, lead to significant long-term change."),
                StoryPage(text: "Understanding how habits form helps us build positive routines."),
                StoryPage(text: "Change does not happen overnight, but persistence makes it possible.")
            ]
        )
    ]
}
