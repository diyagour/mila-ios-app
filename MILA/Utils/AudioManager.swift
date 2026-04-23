import AVFoundation

class AudioManager: ObservableObject {
    
    static let shared = AudioManager()
    
    private var ambientPlayer: AVAudioPlayer?
    private let speechSynth = AVSpeechSynthesizer()

    @Published var isPlayingAmbient = false
    @Published var isSpeaking = false

    // MARK: - Ambient Sound
    func playAmbient() {
        guard let url = Bundle.main.url(forResource: "ambient", withExtension: "mp3") else {
            print("Ambient sound file missing")
            return
        }

        do {
            ambientPlayer = try AVAudioPlayer(contentsOf: url)
            ambientPlayer?.numberOfLoops = -1
            ambientPlayer?.volume = 0.5
            ambientPlayer?.play()
            isPlayingAmbient = true
        } catch {
            print("Audio error:", error)
        }
    }

    func stopAmbient() {
        ambientPlayer?.stop()
        isPlayingAmbient = false
    }

    // MARK: - Read Aloud
    func speak(_ text: String) {
        if speechSynth.isSpeaking {
            speechSynth.stopSpeaking(at: .immediate)
            isSpeaking = false
            return
        }

        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.45
        utterance.pitchMultiplier = 0.9

        speechSynth.speak(utterance)
        isSpeaking = true
    }

    func stopSpeaking() {
        speechSynth.stopSpeaking(at: .immediate)
        isSpeaking = false
    }
}

