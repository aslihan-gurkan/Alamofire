//
//  APIHandler.swift
//  AlamofireGetData
//
//  Created by Aslıhan Gürkan on 8.01.2024.
//

import Foundation
import Alamofire


class APIHandler {
    
    // (Singleton Pattern)
    static let sharedInstance = APIHandler()
    
    func getData(handler: @escaping (_ apiData: [Model]) -> Void) {
        
        let url = ""
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([Model].self, from: data)
                    
                    //Closure calling
                    handler(jsonData)
                    
                    print(jsonData)
                } catch {
                    print(error.localizedDescription)
                    
                }
            case let .failure(error):
                print(error.localizedDescription)
            
            }
        }
    }
}
