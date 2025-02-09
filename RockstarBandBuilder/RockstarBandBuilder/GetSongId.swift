//
//  GetSongId.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/8/25.
//

import Foundation

struct GetSongId {
    func getSongID(trackName: String, accessToken: String, completion: @escaping (String?) -> Void) {
        
        let query = trackName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = URL(string: "https://api.spotify.com/v1/search?q=\(query)&type=track&limit=1")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        // Make the API call
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let tracks = json?["tracks"] as? [String: Any],
                   let items = tracks["items"] as? [[String: Any]],
                   let firstTrack = items.first,
                   let trackID = firstTrack["id"] as? String {
                    completion(trackID)
                } else {
                    print("Track not found")
                    completion(nil)
                }
            } catch {
                print("JSON Parsing error: \(error)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}
