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
                        API()
                        API()
                        API()
                        API()
                    }
                }
                    .frame(width: geometry.size.width)
                    .edgesIgnoringSafeArea(.all)
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
    MainScreenView(time: 0)
}
