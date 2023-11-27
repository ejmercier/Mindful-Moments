//
//  DesignB_TimeView.swift
//  Mindful Moments
//
//  Created by Annie Michel on 11/27/23.
//

import SwiftUI

struct DesignB_TimeView: View {
    @ObservedObject private var selectedTime = Time()
    @Environment(UserInputModel.self) private var userInput: UserInputModel
    @State private var selectedFeeling: String = ""
    
    var body: some View {
        VStack {
            Text("How much time do you have?").font(.system(size: 32))
            //TODO: fix time picker to be able to add time to userinput
            TimePicker(countdownInterval: $selectedTime.timeInterval).padding(.bottom)

           //button to the next page (main screen)
            NavigationLink("Find Recommendations") {
                MainScreenView(time: selectedTime.timeInterval)
                    .environment(userInput)
                    .navigationTitle("Mindful Moments")
            }
            .buttonStyle(.bordered)
            .font(.title)
            .padding()
        }
        .padding(.top)
    }
}

#Preview {
    MainScreenView(time: 0)
}

