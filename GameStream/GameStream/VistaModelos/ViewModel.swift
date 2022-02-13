//
//  ViewModel.swift
//  GameStream
//
//  Created by Joaquin Segovia on 13/2/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var gamesInfo = [Game]()
    
    init() {
        let urlServer = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        
        var request = URLRequest(url: urlServer)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    print("Tamaño del JsonData: \(jsonData)")
                    
                    let decodeData = try
                    JSONDecoder().decode([Game].self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                    
                }
                
            } catch{
                print("Error: \(error)")
            }
            
        }.resume()
        
    }
               
}
