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
        
        GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false){
                    Text("Recomended Meditations")
                        .foregroundStyle(.primary)
                        .font(.title)
                    
                    VStack{
                        ForEach(0..<7){ _ in
                            VStack {
                                MeditationIcon()
                        }.padding(.top, 15)
                    }
                }
                    .frame(width: geometry.size.width)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct MeditationIcon: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 75, height: 75)
            VStack(alignment: .leading, content: {
                Text("duration")
                    .foregroundStyle(.tertiary)
                Text("Meditation Title")
                    .foregroundStyle(.primary)
                    .font(.title3)
                Text("description")
                    .foregroundStyle(.secondary)
            })
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 15).fill(.background).shadow(radius: 2, x: 0, y:0))
    }
}

#Preview {
    MainScreenView(minTime: 0, maxTime: 5)
}
