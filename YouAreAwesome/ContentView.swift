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
    @State private var soundName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    
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
            
            Button("Show Message") {
                
                let messages = ["You Are Awesome!",
                                "Gadzooks my friend! I am astonished at how utterly magnificent you are!",
                                "You Are Great!",
                                "Fabulous? That\'s You!",
                                "You Are Fantastic!",
                                "When the Genius Bar Need Help, They Call You!"]
                
                var messageNumber: Int
                var imageNumber: Int
                var soundNumber: Int
                
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                    imageNumber = Int.random(in: 0..<numberOfImages)
                    soundNumber = Int.random(in: 0..<numberOfSounds)
                }  while (messageNumber == lastMessageNumber || imageNumber == lastImageNumber || soundNumber == lastSoundNumber)
                
                message = messages[messageNumber]
                imageName="image\(imageNumber)"
                soundName = "sound\(soundNumber)"
                
                lastImageNumber = imageNumber
                lastMessageNumber = messageNumber
                lastSoundNumber = soundNumber

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
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
