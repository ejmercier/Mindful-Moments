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
    @ObservedObject private var selectedTime = Time()
    var name: String
    
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
                MainScreenView(userInput: UserInputModel(name: name, feeling: "Happy", time: selectedTime.timeInterval))
                    .navigationTitle("Mindful Moments")
            }
        }
    }
}

struct UserInputModel {
    var name: String = ""
    var feeling: String = ""
    var time: TimeInterval = 0
    
    init(name: String, feeling: String, time: TimeInterval) {
        self.name = name
        self.feeling = feeling
        self.time = time
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(name: "Cathy")
    }
}
