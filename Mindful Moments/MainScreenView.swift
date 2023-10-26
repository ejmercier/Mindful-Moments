//
//  MainScreenView.swift
//  Mindful Moments
//
//  Created by Cathy Pham on 10/17/23.
//

import SwiftUI

struct MainScreenView: View {
    var feeling: String
    var time: String
    
    var body: some View {
        HStack {
            Text("Emotion: \(feeling)")
            Spacer()
            Text("Time: \(time) mins")
        }
        .padding(.all, 25)
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Change selections")
        })
        .padding(.bottom, 30)
        
        Text("Recomended Meditations")
            .foregroundStyle(.primary)
            .font(.title)
        
        GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false){
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
                Text("tags")
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
        .background(Rectangle().fill(.background).shadow(radius: 3, x: 0, y:0))
    }
}

#Preview {
    MainScreenView(feeling: "Happy", time: "30")
}
