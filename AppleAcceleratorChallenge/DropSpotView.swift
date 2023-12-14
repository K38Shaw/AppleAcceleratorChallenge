//
//  DropSpotView.swift
//  AppleAcceleratorChallenge
//
//  Created by Kenli Shaw on 12/14/23.
//

import SwiftUI


struct DropSpotView: View {
    @Binding var dragEmojiItem: DragEmojiItem
    var body: some View {
        VStack{
            
            Text(dragEmojiItem.emoji).font(.system(size: dragEmojiItem.fontSize)).rotationEffect(.degrees(dragEmojiItem.rotationAngle)).position(dragEmojiItem.position).gesture(DragGesture()
                .onChanged { gesture in
                    
                    self.dragEmojiItem.position = gesture.location
                })
                                                                                                                                                                                 
                                                                                                                                                                     }.frame(width: 300, height: 300)
                                                                                                                                                                     }
                                                                                                                                                                     }
                                                                                                                                                                                 
                                                                                                                                                                                 
