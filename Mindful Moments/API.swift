import Foundation
import Alamofire

struct Response: Decodable
{
    let access_token: String
    let token_type: String
    let expires_in: Int
}
struct Shows: Decodable
{
    let test: String
}
func API(url: String)
{
    print("Ran")
    let parameters = ["client_id": "8e0cf38431f8459d9756f6db7e26c677",
                      "client_secret": "c61f6986d0e34e94b61725d249571334",
                      "grant_type": "client_credentials"]
    var accessToken = ""
    Alamofire.AF.request("https://accounts.spotify.com/api/token", method: .post, parameters: parameters)
        .responseDecodable(of: Response.self){
            (response) in
            accessToken = response.value!.access_token
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(accessToken)",
                "Accept": "application/json"
            ]            
            Alamofire.AF.request("https://api.spotify.com/v1/shows/6rmydpcCvLzN4744S1fCsW/episodes", method: .get, headers: headers)
                .responseDecodable(of: Shows.self){
                    music in
                    switch music.result {
                    case .success(let token):
                        // Handle the successful response
                        print(token)
                        // Add additional handling for other properties
                    case .failure(let error):
                        // Handle the error
                        print("Error: \(error)")
                        
                        if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                            print("Response Data: \(utf8Text)")        }
                    }
                }
        }
}
