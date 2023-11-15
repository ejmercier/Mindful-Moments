//
//  API.swift
//  Mindful Moments
//
//  Created by Kayla Benton on 10/30/23.
//

import Foundation
import SwiftUI
import Combine

struct API: View {
    
    @State private var keyResponse: Response?
    @State private var image: String = ""
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var duration: String = ""
    @State private var feeling: String
    
    init(ufeeling: String) {
            self.feeling = ufeeling
        }
    
    var body: some View{
        HStack(alignment: .top, spacing: 10) {
            VStack(alignment: .leading, spacing: 5){
                AsyncImage(
                    url: URL(string: image),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .onTapGesture{self.openURL()}
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                Text(duration)
            }
            VStack(alignment: .leading, spacing: 5){
                Text(name)
                    .frame(maxHeight: 20)
                
                Text(description)
                    .font(.caption)
                    .frame(maxHeight: 65)
            }
            .padding(.trailing, 10)
            .padding(.vertical, 10)
        }.onAppear{self.loadData()}
    }
    
    private func loadData(){
        let parameters = "client_id=8e0cf38431f8459d9756f6db7e26c677&client_secret=c61f6986d0e34e94b61725d249571334&grant_type=client_credentials"
        let postData =  parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://accounts.spotify.com/api/token")!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let decodedData = try?
                JSONDecoder().decode(Response.self, from: data)
            {
                loadSongs(accesstoken: decodedData.access_token)
                print(decodedData.access_token)
                print(String(data: data, encoding: .utf8)!)
            }
        }
        task.resume()
    }
    private func loadSongs(accesstoken: String) {
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/search?q=5+min+meditation+for+\(feeling)&type=episode&market=ES")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer " + accesstoken, forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let decodedData = try?
                JSONDecoder().decode(Objects.self, from: data)
            {
                print("made it")
                var duration_ms = decodedData.episodes.items[0].duration_ms / 1000
                let (minutes, remainingSeconds) = secondsToMinutesAndSeconds(seconds: duration_ms)
                duration = String(minutes) + " min " + String(remainingSeconds) + " sec"
                name = decodedData.episodes.items[0].name
                description = decodedData.episodes.items[0].description
                image = decodedData.episodes.items[0].images[0].url
                print(decodedData.episodes.items[0].images[0].url)
            }
            //print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
    private func openURL() {
        if let url = URL(string: "https://api.spotify.com/v1/search?q=5+min+meditation+for+\(feeling)&type=episode&market=ES") {
            UIApplication.shared.open(url)
        }
    }
    func secondsToMinutesAndSeconds(seconds: Int) -> (minutes: Int, seconds: Int) {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return (minutes, remainingSeconds)
    }
}
struct Response: Decodable {
    var access_token: String
    var token_type: String
    var expires_in: Int
}

struct Objects: Decodable{
    var episodes: Episodes
}

struct Episodes: Decodable{
    var items: [Items]
}

struct Items: Decodable{
    var duration_ms: Int
    var name: String
    var description: String
    var href: String
    var external_urls: External_urls
    var images: [Image]
}

struct Image: Decodable{
    var url: String
    var height: Int
    var width: Int
}

struct External_urls: Decodable{
    var spotify: String
}
struct API_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading){
            API(ufeeling: "moist")
        }
        .padding()
    }
}
