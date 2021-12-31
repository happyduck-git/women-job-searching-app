//
//  ClubManager.swift
//  playWithMe
//
//  Created by HappyDuck on 2021/12/01.
//

import Foundation


struct ClubManager {
    
    let clubDataUrl = "https://api.odcloud.kr/api/15056221/v1/uddi:a2a57262-fa68-4b6f-9b5e-935d8134f395_201909021042?page=1&perPage=10&serviceKey=tiXFYcCrPTR3BKMmvHaGKSoVgD4mGNuzd7ykBVNzy9U4pkPJvbSV%2FsCATlmnZ6fMG3u4t6kPUolZ009qu0rbLQ%3D%3D"
    

    func performRequest(urlString: String){

        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }

                if let safeData = data {
                    self.parseJSON(clubData: safeData)
                }
            }

            task.resume()

        }
    }
    
    func parseJSON(clubData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ClubData.self, from: clubData)
            print(decodedData.name)
        } catch {
            print(error)
        }
     

    }
    
}

