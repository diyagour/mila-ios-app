import SwiftUI

struct StoryMagicView: View {

    @EnvironmentObject var magicStore: StoryMagicStore

    @State private var character = ""
    @State private var power = "✨ Flying"
    @State private var ending = ""

    let powers = ["✨ Flying", "⏳ Time Travel", "🔥 Fire", "❄️ Ice", "🌙 Moon Magic", "⚡ Lightning"]

    var body: some View {
        ZStack {
            SpaceBackground()

            ScrollView {
                VStack(spacing: 24) {

                    // TITLE
                    Text("Story Magic ✨")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)

                    Text("Create your own magical ending")
                        .foregroundColor(.white.opacity(0.9))

                    // INPUT CARD
                    GlassCard {
                        VStack(alignment: .leading, spacing: 16) {

                            // CHARACTER
                            Text("Favourite Character")
                                .foregroundColor(.white)
                                .font(.headline)

                            Text("Who is the hero of the story?")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.caption)

                            TextField("e.g. Harry Potter", text: $character)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Color.white.opacity(0.25))
                                .cornerRadius(12)

                            // POWER
                            Text("Magic Power")
                                .foregroundColor(.white)
                                .font(.headline)

                            Picker("Magic Power", selection: $power) {
                                ForEach(powers, id: \.self) { p in
                                    Text(p)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .foregroundColor(.white)

                            // ENDING
                            Text("My Magical Ending")
                                .foregroundColor(.white)
                                .font(.headline)

                            Text("What happens next in the story?")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.caption)

                            TextEditor(text: $ending)
                                .frame(height: 140)
                                .foregroundColor(.white)
                                .scrollContentBackground(.hidden)
                                .padding(12)
                                .background(Color.white.opacity(0.25))
                                .cornerRadius(12)
                        }
                    }

                    // SAVE BUTTON
                    Button {
                        let magic = StoryMagic(
                            character: character,
                            power: power,
                            ending: ending
                        )
                        magicStore.add(magic)

                        character = ""
                        ending = ""
                        power = "✨ Flying"
                    } label: {
                        Text("Save My Magic ✨")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.black)
                            .cornerRadius(16)
                    }

                    // SAVED MAGIC
                    VStack(spacing: 14) {
                        ForEach(magicStore.magics) { magic in
                            GlassCard {
                                VStack(alignment: .leading, spacing: 8) {

                                    Text(magic.character)
                                        .font(.headline)
                                        .foregroundColor(.white)

                                    Text("Power: \(magic.power)")
                                        .foregroundColor(.cyan)

                                    Text(magic.ending)
                                        .foregroundColor(.white.opacity(0.95))
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
