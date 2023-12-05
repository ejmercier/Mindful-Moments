//
//  DesignB_TimeView.swift
//  Mindful Moments
//
//  Created by Annie Michel on 11/27/23.
//

import SwiftUI

struct DesignB_TimeView: View {
    @ObservedObject private var minTime = Time()
    @ObservedObject private var maxTime = Time()
    @Environment(UserInputModel.self) private var userInput: UserInputModel
    @State private var selectedFeeling: String = ""
    
    var body: some View {
        VStack {
            Text("How much time do you have?")
                .font(.system(size: 32))
                .padding()
            //TODO: fix time picker to be able to add time to userinput
            Text("Minimum:")
                .font(.title2)
            TimePicker(countdownInterval: $minTime.timeInterval).padding(.bottom)
                .frame(height: 150)
            
            Text("Maximum:")
                .font(.title2)
                .padding(.top)
            TimePicker(countdownInterval: $maxTime.timeInterval).padding(.bottom)
                .frame(height: 150)
        }
        .padding()
        
        //button to the next page (main screen)
         NavigationLink("Find Recommendations") {
             DesignB_MainScreenView(minTime: minTime.timeInterval, maxTime: maxTime.timeInterval)
                 .environment(userInput)
                 .navigationTitle("Mindful Moments")
         }
         .buttonStyle(.bordered)
         .padding()
         .font(.title)

    }
}
