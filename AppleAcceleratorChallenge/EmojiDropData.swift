//
//  EmojiDropData.swift
//  AppleAcceleratorChallenge
//
//  Created by Kenli Shaw on 12/14/23.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct DragEmojiItem: Codable, Identifiable, Transferable{
    var emoji: String
    var fontSize: CGFloat = 30
    var rotationAngle: Double = 0
    var position: CGPoint = .zero
    var id = UUID()
    
    static var transferRepresentation: some TransferRepresentation{
        CodableRepresentation(contentType: .dragEmojiItem)
    }
}

extension UTType{
    static let dragEmojiItem = UTType(exportedAs: "nwktc.AppleAcceleratorChallenge.dragEmojiItem")
}
