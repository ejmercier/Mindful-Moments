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
    
    var body: some View{
        HStack(alignment: .top, spacing: 10) {
            
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
            VStack(alignment: .leading, spacing: 5){
                Text(name)
                
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
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/shows/6rmydpcCvLzN4744S1fCsW")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer " + accesstoken, forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let decodedData = try?
                JSONDecoder().decode(Episode.self, from: data)
            {
                name = decodedData.name
                description = decodedData.description
                image = decodedData.images[0].url
                print(decodedData.images[0].url)
                print("test")
            }
            //print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
    private func openURL() {
        if let url = URL(string: "https://open.spotify.com/show/6rmydpcCvLzN4744S1fCsW") {
            UIApplication.shared.open(url)
        }
    }
}
struct Response: Decodable {
    var access_token: String
    var token_type: String
    var expires_in: Int
}
struct Episode: Decodable{
    var name: String
    var description: String
    var images: [Image]
    //var episodes: Episodes
}
struct Image: Decodable{
    var url: String
    var height: Int
    var width: Int
}
struct Episodes: Decodable{
    var href: String
    var items: Items
}
struct Items: Decodable{
    var href: String
    var external_urls: EURL
}
struct EURL: Decodable{
    var spotify: String
}
struct API_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading){
            API()
            API()
            API()
            API()
        }
        .padding()
    }
}
