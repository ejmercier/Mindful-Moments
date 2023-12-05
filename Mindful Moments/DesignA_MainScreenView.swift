//
//  DesignA_MainScreenView.swift
//  Mindful Moments
//
//  Created by Annie Michel on 12/5/23.
//

import SwiftUI

struct DesignA_MainScreenView: View {
    @Environment(UserInputModel.self) private var userInput: UserInputModel
    var time: TimeInterval
    
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
                let timeInMin: Int = Int(time/60)
                Text("\(timeInMin) mins")
                    .frame(width: 90, height: .infinity, alignment: .center)
                    .padding(.all, 10)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.background.secondary))
            }
            .padding()
        }
        
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
                    .frame(width: geometry.size.width)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
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
    }
}

#Preview {
    DesignA_MainScreenView(time: 0)
}
