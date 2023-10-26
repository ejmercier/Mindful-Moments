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
        
//        NavigationLink("Change selections", destination: QuestionView(name: userInput.name))
//            .padding(.bottom, 30)
        
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false){
                    Text("Recomended Meditations")
                        .foregroundStyle(.primary)
                        .font(.title)
                    
                    VStack{
                        
                        Button(action:{}) {
                            MeditationIcon(title: "Daytime Meditation for Stress Relief", time: "22 min 13 sec")
                        }
                            .foregroundStyle(.black)
                            .padding(.top, 15)
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        Button(action:{}) {
                            MeditationIcon(title: "10-Minute Meditation For Anxiety", time: "10 min 20 sec")
                        }
                            .foregroundStyle(.black)
                            .padding(.top, 15)
                        
                        Button(action:{}) {
                            MeditationIcon(title: "Meditation for Anxiety Relief", time: "3 min 4 sec")
                        }
                            .foregroundStyle(.black)
                            .padding(.top, 15)
                        
//                        ForEach(meditations) { meditation in
//                            VStack {
//                                Button(action:{}) {
//                                    MeditationIcon(meditation: meditation)
//                                }
//                                .foregroundStyle(.black)
//                        }.padding(.top, 15)
                    }
                }
                .frame(width: geometry.size.width)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        
    }
}

//class openLink: UIViewController {
//    @IBAction func openLinkButtonClicked(/*_ sender: UIButton*/) {
//        if let url = URL(string: "https://www.google.com") {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
//    }
//}

//struct Meditation: Identifiable {
//    var id = UUID()
//    var title: String
////    var link: String?
//    var time: String
//    
//    init (title: String, time: String) {
//        self.title = title
//        self.time = time
//    }
//}

struct MeditationIcon: View {
//    var meditation: Meditation
    var title: String
    var time: String
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 75, height: 75)
            VStack(alignment: .leading, content: {
//                Text("duration")
//                    .foregroundStyle(.tertiary)
                Text("\(title)")
                    .foregroundStyle(.primary)
                    .font(.title3)
                Text("\(time)")
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
