//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by app-kaihatsusha on 24/12/2025.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = true
    
    let numberOfImages = 10
    let numberOfSounds = 6
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button("Show Message") {
                    
                    let messages = ["You Are Awesome!",
                                    "Gadzooks my friend! I am astonished at how utterly magnificent you are!",
                                    "You Are Great!",
                                    "Fabulous? That\'s You!",
                                    "You Are Fantastic!",
                                    "When the Genius Bar Need Help, They Call You!"]
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count-1)
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages-1)
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds-1)
                    
                    message = messages[lastMessageNumber]
                    imageName="image\(lastImageNumber)"
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                    
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            
        }
        .padding()
        
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        
        var randomNumber: Int
        
        repeat {
            randomNumber = Int.random(in: 0...upperBounds)
        } while randomNumber == lastNumber
        
        return randomNumber
    }
    func playSound(soundName: String) {
        
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}

#Preview {
    ContentView()
}
