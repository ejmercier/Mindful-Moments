//
//  QuestionView.swift
//  Mindful Moments
//
//  Created by Cathy Pham on 10/12/23.
//

import SwiftUI

struct QuestionView: View {
    var name: String
    
    var body: some View {
        VStack {
            Text("Hi \(name)!")
                .font(.title)
                .padding(.bottom, 20)
                .foregroundStyle(.gray)
            Text("How do you feel?").font(.largeTitle)
            FeelingPicker()
        }
        .padding(.top, 40)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(name: "User")
    }
}
