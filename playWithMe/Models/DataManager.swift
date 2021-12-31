//
//  DataManager.swift
//  playWithMe
//
//  Created by HappyDuck on 2021/11/30.
//

import Foundation

struct DataManager {
    let dataUrl = "http://apis.data.go.kr/1383000/nwis/newWorkCenterService/getNewWorkCenterList?serviceKey=tiXFYcCrPTR3BKMmvHaGKSoVgD4mGNuzd7ykBVNzy9U4pkPJvbSV%2FsCATlmnZ6fMG3u4t6kPUolZ009qu0rbLQ%3D%3D&pageNo=1&numOfRows=10&type=json"
    
    func fetchData(cityName: String){
        let urlString = "\(dataUrl)&ctpvNm=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
      
    }
    
    func performRequest(urlString: String){

        if let url = URL(string: urlString) {

            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))

            task.resume()

        } else {
            print("Error in performRequest")
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }

        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        } else {
            print("Error in safeData")
        }
    }
    
}

