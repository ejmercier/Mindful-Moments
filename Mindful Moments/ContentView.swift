//
//  ContentView.swift
//  Mindful Moments
//
//  Created by Cathy Pham on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var givenName: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Mindful Moments")
                    .foregroundStyle(.primary)
                    .font(.largeTitle)
                    .padding()
                Text("Please enter your name")
                    .foregroundStyle(.primary)
                    .font(.title2)
                TextField("First Name",text: $givenName)
                    .disableAutocorrection(true)
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                    .textFieldStyle(.roundedBorder)
                NavigationLink("Submit") {
                    QuestionView(name: givenName)
                }
            }
            .padding()
        }
        
    }
}


#Preview {
    ContentView()
}