//
//  ContentView.swift
//  Mindful Moments
//
//  Created by Cathy Pham on 10/12/23.
//

import SwiftUI



struct ContentView: View {
    @State private var givenName: String = ""
//    @Environment(\.modelContext) private var modelContext
   // @Bindable var userInput: UserInputModel = UserInputModel(name: "", feeling: "", time: 0)

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
                        .navigationTitle("Mindful Moments")
                }
            }
            .padding()
//            .environmentObject(self.userInput)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
