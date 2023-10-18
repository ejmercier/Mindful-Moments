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
            Text("Hello \(name)")
            Text("This is the Question Screen")
            TimePicker(countdownInterval: $selectedTime.timeInterval)
//            Text("Selected Time Interval in seconds: \(selectedTime.timeInterval)")
          
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
