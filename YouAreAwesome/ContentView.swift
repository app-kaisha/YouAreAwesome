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
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
            Spacer()
            
            Button("Show Message") {
                //                let message1 = "You are Awesome!"
                //                let message2 = "You are Great!"
                //                let message3 = "Fabulous? That's You!"
                //
                //                if message == message1 {
                //                    message = message2
                //                } else if message == message2 {
                //                    message = message3
                //                } else {
                //                    message = message1
                //                }
                
                let messages = ["You Are Awesome!",
                                "You Are Skilled!",
                                "You Are Great!",
                                "Fabulous? That\'s You!",
                                "You Are Fantastic!",
                                "When the Genius Bar Need Help, They Call You!",
                                "You Are A Code Monster!",
                                "You Make Me Smile!",
                                "I Think You Are Magic!"]
                
                message = messages[messageNumber]
                messageNumber += 1
                
                if messageNumber == messages.count {
                    messageNumber = 0
                }
                //                message = messages[Int.random(in: 0..<messages.count)]
                
                
                //                message = (message == message1 ? message2 : message1)
                //                imageName = (imageName == "image0" ? "image1" : "image0")
                //TODO: - update image name variable -
                imageName="image\(imageNumber)"
                
                
                imageNumber += 1
                
                if imageNumber > 9 {
                    imageNumber = 0
                }
                
                print(imageNumber)
                
                
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
