//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by app-kaihatsusha on 24/12/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageName = ""
    //    @State private var imageNumber = 0
    //    @State private var messageNumber = 0
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    
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
                
                
                var messageNumber = Int.random(in: 0...messages.count-1)
                var imageNumber = Int.random(in: 0...9)
                
                while (messageNumber == lastMessageNumber || imageNumber == lastImageNumber) {
                    
                    messageNumber = Int.random(in: 0...messages.count-1)
                    imageNumber = Int.random(in: 0...9)
                    
                    if (imageNumber == lastImageNumber || messageNumber == lastMessageNumber) {
                        print("duplicate: image number \(imageNumber) last time: \(lastImageNumber), message number: \(messageNumber) last time: \(lastMessageNumber)")
                    }
                }
                
                message = messages[messageNumber]
                imageName="image\(imageNumber)"
                
                lastImageNumber = imageNumber
                lastMessageNumber = messageNumber
                
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
