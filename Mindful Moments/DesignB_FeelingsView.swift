//
//  DesignB_FeelingsView.swift
//  Mindful Moments
//
//  Created by Annie Michel on 11/27/23.
//

import SwiftUI

struct DesignB_FeelingsView: View {
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
            DesignB_FeelingPicker(selectedFeeling: $userInput.feeling).padding(.bottom)
            // TODO: intensity
            NavigationLink("Next") {
                DesignB_TimeView()
                    .environment(userInput)
                    .navigationTitle("Mindful Moments")
            }
            .buttonStyle(.bordered)
            .padding()
            .font(.title)
        }
        .padding(.top)
    }
}

struct DesignB_FeelingsView_Previews: PreviewProvider {
    static var previews: some View {
        DesignB_FeelingsView(name: "Cathy")
    }
}
