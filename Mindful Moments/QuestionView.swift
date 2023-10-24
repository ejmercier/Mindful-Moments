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
    @State var userInput = UserInputModel(name: "", feeling: "", time: 0)
    @State private var selectedFeeling: String = ""
    
    var body: some View {
        VStack {
            Text("Hi \(name)!")
                .font(.system(size: 28))
                .padding(.bottom)
                .foregroundStyle(.gray)
            Text("How do you feel?").font(.system(size: 32))
            FeelingPicker(selectedFeeling: $userInput.feeling).padding(.bottom)
            Text("How much time do you have?").font(.system(size: 32))
            //TODO: fix time picker to be able to add time to userinput
            TimePicker(countdownInterval: $selectedTime.timeInterval).padding(.bottom)

           //button to the next page (main screen)
            NavigationLink("Find Recommendations") {
                MainScreenView()
                    .environment(userInput)
                    .navigationTitle("Mindful Moments")
            }
        }
    }
}

@Observable
class UserInputModel {
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
