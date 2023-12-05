//
//  MainScreenView.swift
//  Mindful Moments
//
//  Created by Cathy Pham on 10/17/23.
//

import SwiftUI

struct MainScreenView: View {
    @Environment(UserInputModel.self) private var userInput: UserInputModel

    var minTime: TimeInterval
    var maxTime: TimeInterval
    
    var body: some View {
        HStack (alignment: .top) {
            VStack {
                Text("Feeling Selected:")
                FeelingsIcon(feeling: Feeling(name: userInput.feeling, emoji: userInput.feeling.emoji))
                    .frame(width:105)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.background.secondary))
            }
            .padding()
           
            VStack {
                Text("Time Selected:")
                let mintimeInMin: Int = Int(minTime/60)
                let maxtimeInMin: Int = Int(maxTime/60)
                Text("\(mintimeInMin) mins - \(maxtimeInMin) mins")
                    .frame(width: 90, height: .infinity, alignment: .center)
                    .padding(.all, 10)
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
                        API(ufeeling: userInput.feeling, index: a[0], time: Int(mintime/60))
                        API(ufeeling: userInput.feeling, index: a[1], time: Int(mintime/60))
                        API(ufeeling: userInput.feeling, index: a[2], time: Int(mintime/60))
                        API(ufeeling: userInput.feeling, index: a[3], time: Int(mintime/60))
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
    MainScreenView(minTime: 0, maxTime: 5)
}
