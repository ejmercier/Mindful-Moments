//
//  API.swift
//  Mindful Moments
//
//  Created by Kayla Benton on 10/30/23.
//

import Foundation
import SwiftUI

struct API: View {
    
    @State private var keyResponse: Response?
    
    var body: some View{
        HStack{
            VStack(alignment: .trailing)
            {
                Spacer()
                Text(keyResponse?.access_token ?? "test")
                Spacer()
                
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    loadData()
                }
            }
                .contentShape(Rectangle())
            }
        .multilineTextAlignment(.trailing)
        .padding(.top)
        }
    
    private func loadData() {

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
                    print(String(data: data, encoding: .utf8)!)
                }
        }
        task.resume()
    }
}
struct Response: Decodable {
    var access_token: String
    var token_type: String
    var expires_in: Int
}

struct API_Previews: PreviewProvider {
    static var previews: some View {
        API()
    }
}
