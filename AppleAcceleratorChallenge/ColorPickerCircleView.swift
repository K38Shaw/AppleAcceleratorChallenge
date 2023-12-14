//
//  ColorPickerCircleView.swift
//  AppleAcceleratorChallenge
//
//  Created by Kenli Shaw on 12/14/23.
//

import SwiftUI

struct ColorPickerCircleView: View {
    @Binding var colorValue: Color
    var body: some View {
        colorValue.frame(width: 45, height: 45, alignment: .center).cornerRadius(50).overlay(Circle().stroke(Color.white, style: StrokeStyle(lineWidth: 3))).padding(20).background(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .pink]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(50)).overlay(ColorPicker("", selection: $colorValue).labelsHidden().opacity(0.015)).shadow(radius: 5.0)
    }
}


