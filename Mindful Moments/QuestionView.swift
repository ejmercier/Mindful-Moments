//
//  QuestionView.swift
//  Mindful Moments
//
//  Created by Cathy Pham on 10/12/23.
//

import SwiftUI

class Time: ObservableObject {
    @Published var timeInterval: TimeInterval = 0
}


struct QuestionView: View {
    var name: String
    @ObservedObject private var selectedTime = Time()
    
    var body: some View {
        VStack {
            Text("Hi \(name)!")
                .font(.system(size: 28))
                .padding(.bottom)
                .foregroundStyle(.gray)
            Text("How do you feel?").font(.system(size: 32))
            FeelingPicker().padding(.bottom)
            Text("How much time do you have?").font(.system(size: 32))
            TimePicker(countdownInterval: $selectedTime.timeInterval).padding(.bottom)
           //button to the next page (main screen)
            NavigationLink("Find Recommendations") {
                MainScreenView(feeling: "Happy", time: "30")
                    .navigationTitle("Mindful Moments")
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(name: "User")
    }
}
