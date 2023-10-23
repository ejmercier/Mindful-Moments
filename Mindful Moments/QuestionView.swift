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
//    @EnvironmentObject var userInput: UserInputModel
    var name: String
    
    var body: some View {
        VStack {
            Text("Hello \(name)")
            Text("This is the Question Screen")
            TimePicker(countdownInterval: $selectedTime.timeInterval)
            Text("Selected Time Interval in seconds: \(selectedTime.timeInterval)")

           //button to the next page (main screen)
            NavigationLink("Find Recommendations") {
                MainScreenView(userInput: UserInputModel(name: name, feeling: "Happy", time: selectedTime.timeInterval))
                    .navigationTitle("Mindful Moments")
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(name: "Cathy")
    }
}
