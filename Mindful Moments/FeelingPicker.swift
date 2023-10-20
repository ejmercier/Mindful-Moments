//
//  FeelingPicker.swift
//  Mindful Moments
//
//  Created by Annie Michel on 10/16/23.
//

import SwiftUI

struct FeelingPicker: View {
    let feelings: [Feeling] = [Feeling(name: "Happy", emoji: "😄"), Feeling(name: "Sad", emoji: "😢"), Feeling(name: "Stressed", emoji: "😓"), Feeling(name: "Angry", emoji: "😠"), Feeling(name: "Lonely", emoji: "😔"), Feeling(name: "Nervous", emoji: "😖")]
    @State private var selectedFeeling: String?

    var body: some View {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(feelings, id: \.id) { feeling in
                        Button(action: {self.selectedFeeling = feeling.name}) {
                            FeelingsIcon(feeling: feeling)
                                .foregroundStyle(.black)
                                .padding(.bottom, 6)
                                .frame(width: 85, height: 80)
                        }
                        .buttonStyle(.bordered)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(selectedFeeling == feeling.name ? .blue : .clear, lineWidth: 2)
                                .padding(1)
                        )
                        .buttonBorderShape(.roundedRectangle(radius: 30))
                        .padding(.bottom)
                    }
                }
            }
            .padding(.horizontal, 20)
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
            Text("\(feeling.emoji)").font(.system(size: 40))
            Text("\(feeling.name)").font(.system(size: 20))
        }
    }
}

struct FeelingPicker_Previews: PreviewProvider {
    static var previews: some View {
        FeelingPicker()
    }
}
