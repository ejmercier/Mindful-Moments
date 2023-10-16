//
//  QuestionView.swift
//  Mindful Moments
//
//  Created by Cathy Pham on 10/12/23.
//

import SwiftUI

struct QuestionView: View {
    var name: String
    @State private var selectedCountdownInterval: TimeInterval = 0
    
    var body: some View {
        VStack {
            Text("Hello \(name)")
            Text("This is the Question Screen")
            TimePicker(countdownInterval: $selectedCountdownInterval)
            Text("Selected Time Interval in seconds: \(selectedCountdownInterval)")
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(name: "User")
    }
}
