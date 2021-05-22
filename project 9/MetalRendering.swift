//
//  MetalRendering.swift
//  project 9
//
//  Created by Anisha Lamichhane on 5/22/21.
//

import SwiftUI
struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    var body: some View {
        ZStack{
            ForEach(0..<steps){ value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(self.color(for: value, brightness: 1), lineWidth: 2)
            }
        }
    }
    
    func color(for value: Int, brightness: Double)-> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
        
    }
    
}

struct MetalRendering: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MetalRendering_Previews: PreviewProvider {
    static var previews: some View {
        MetalRendering()
    }
}
