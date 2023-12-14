//
//  ContentView.swift
//  AppleAcceleratorChallenge
//
//  Created by Kenli Shaw on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @State var fontSize: CGFloat = 30
    @State var rotationAngle: Double = 0
    @State private var colourValue = Color.white
    @State var currentEmojis: [DragEmojiItem] = []
    @State var droppableEmojis = [
        DragEmojiItem(emoji: "🎄"), DragEmojiItem(emoji: "☃️"), DragEmojiItem(emoji: "🤖"), DragEmojiItem(emoji: "❄️")]
    
    func updateEmojiValues() {
        for index in currentEmojis.indices {
            currentEmojis[index].fontSize = fontSize
            currentEmojis[index].rotationAngle = rotationAngle
        }
    }
    
    var body: some View {
        VStack {
            
            ZStack {
                Rectangle().fill(colourValue).frame(width: 300, height: 300).border(Color.black, width: 3).dropDestination (for: DragEmojiItem.self){ droppedEmojis, location in
                    for droppedEmoji in droppedEmojis{
                        let newEmojiItem = DragEmojiItem(
                            emoji: droppedEmoji.emoji,
                            fontSize: droppedEmoji.fontSize,
                            rotationAngle: droppedEmoji.rotationAngle,
                            position: location, // Use the dropped location
                            id: UUID() // Assign a new UUID
                        )
                        currentEmojis.append(newEmojiItem)
                    }
                    
                   
                    return true
                    
                }
                ForEach($currentEmojis){
                    $emoji in DropSpotView(dragEmojiItem: $emoji)
                }
            }
            
            
            
            HStack{
                ForEach(droppableEmojis, id:\.id){
                    emoji in
                    Text(emoji.emoji)
                        .font(.system(size: 30)).frame(width: 45, height: 45).border(Color.black, width: 2)
                        .shadow(
                            color:.black, radius: 3)
                        .draggable(emoji)
                    
                    
                }            }
            HStack{
                Text("Paint Color").font(.system(size: 30))
                Spacer()
                ColorPickerCircleView(colorValue: $colourValue)
            }.padding(.horizontal, 30)
            
            VStack {
                //                Text("Hello World").font(.system(size: fontSize)).rotationEffect(.degrees(rotationAngle))
                Text("Font Size of \(Int(fontSize))")
                Slider(value: $fontSize, in: 10...50, step: 1).onChange(of: fontSize) {oldSize, newSize in if newSize != oldSize
                    {updateEmojiValues()}
                    
                }
                
                Text("Rotation of \(Int(rotationAngle)) degrees")
                Slider(value: $rotationAngle, in: 0...360, step: 1).onChange(of: rotationAngle) {oldAngle, newAngle in if newAngle != oldAngle
                    {updateEmojiValues()
                }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
