//
//  FeelingPicker.swift
//  Mindful Moments
//
//  Created by Annie Michel on 10/16/23.
//

import SwiftUI

struct FeelingPicker: View {
    let feelings: [Feeling] = [Feeling(name: "Happy", emoji: "😄"), Feeling(name: "Sad", emoji: "😢"), Feeling(name: "Stressed", emoji: "😓"), Feeling(name: "Angry", emoji: "😠"), Feeling(name: "Lonely", emoji: "😔")]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(feelings, id: \.id) { feeling in
                        FeelingsIcon(feeling: feeling)
                            .foregroundStyle(.black)
                            .font(.title2)
                            .padding(.horizontal, 12)
                            .padding(.bottom, 25)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

class Feeling {
    var id = UUID()
    var name: String
    var emoji: String
    
    init (name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
    }
}

struct FeelingsIcon: View {
    var feeling: Feeling
    
    var body: some View {
        VStack {
            Text("\(feeling.emoji)").font(.system(size: 50))
            Text("\(feeling.name)")
        }
    }
}

struct FeelingPicker_Previews: PreviewProvider {
    static var previews: some View {
        FeelingPicker()
    }
}
