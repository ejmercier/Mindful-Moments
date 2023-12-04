//
//  MainScreenView.swift
//  Mindful Moments
//
//  Created by Cathy Pham on 10/17/23.
//

import SwiftUI

struct MainScreenView: View {
    @Environment(UserInputModel.self) private var userInput: UserInputModel
    var time: TimeInterval
    var body: some View {
        HStack (alignment: .top) {
            VStack {
                Text("Feeling Selected:")
                FeelingsIcon(feeling: Feeling(name: userInput.feeling, emoji: userInput.feeling.emoji))
                    .frame(width:105)
                    .background(RoundedRectangle(cornerRadius: 25).fill(.background.secondary))
            }
            .padding()
           
            VStack {
                Text("Time Selected:")
                let timeInMin: Int = Int(time/60)
                Text("\(timeInMin) mins")
                    .frame(width: 90, height: 30)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.background.secondary))
            }
            .padding()
        }
        
        NavigationLink("Change selections", destination: QuestionView(name: userInput.name))
            .padding(.bottom, 30)
        
        GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false){
                    Text("Recomended Meditations")
                        .foregroundStyle(.primary)
                        .font(.title)
                    
                    VStack{
                        let a = generateRandomValues()
                        API(ufeeling: userInput.feeling, index: a[0], time: Int(time/60))
                        API(ufeeling: userInput.feeling, index: a[1], time: Int(time/60))
                        API(ufeeling: userInput.feeling, index: a[2], time: Int(time/60))
                        API(ufeeling: userInput.feeling, index: a[3], time: Int(time/60))
                    }
                }
                    .frame(width: geometry.size.width)
            }
        }
    func generateRandomValues() -> [Int] {
        var uniqueValues = Set<Int>()

        while uniqueValues.count < 4 {
            let randomValue = Int.random(in: 0..<4)
            uniqueValues.insert(randomValue)
            print(randomValue)
        }

        return Array(uniqueValues)
    }    }

#Preview {
    MainScreenView(time: 0)
}
