//
//  DesignB_FeelingPicker.swift
//  Mindful Moments
//
//  Created by Annie Michel on 11/27/23.
//

import SwiftUI

struct DesignB_FeelingPicker: View {
    let feelings: [Feeling] = [Feeling(name: "Happy", emoji: "😄"), Feeling(name: "Sad", emoji: "😢"), Feeling(name: "Stressed", emoji: "😓"), Feeling(name: "Angry", emoji: "😠"), Feeling(name: "Lonely", emoji: "😔"), Feeling(name: "Nervous", emoji: "😖")]
    @Binding var selectedFeeling: String

    var body: some View {
        // feelings
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                ForEach(feelings, id: \.id) { feeling in
                    Button(action: {self.selectedFeeling = feeling.name}) {
                        FeelingsIcon(feeling: feeling)
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
                .padding(.horizontal)
            }
            .padding()
        }
    }
}
