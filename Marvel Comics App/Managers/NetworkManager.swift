//
//  NetworkManager.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 06/10/2021.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    let baseURL = "https://gateway.marvel.com/v1/public/comics?format=comic&formatType=comic&noVariants=true&orderBy=-onsaleDate&ts=1"
    
    private init() {}
    
    private func valueForAPIKey(named keyname:String) -> String {
        let filePath = Bundle.main.path(forResource: "ApiKey", ofType: "plist")
        let plist = NSDictionary(contentsOfFile:filePath!)
        let value = plist?.object(forKey: keyname) as! String
        return value
    }
    
    func getComics(completed: @escaping (Result<ComicsModel, CustomErrors>) -> Void){
        let apiKey = valueForAPIKey(named: "API_CLIENT_ID")
        let hash = valueForAPIKey(named: "API_HASH")
        let endpoint = baseURL + "&apikey=\(apiKey)" + "&hash=\(hash)"
        
        guard let url = URL(string: endpoint) else{
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error{
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do{
                let decoder = JSONDecoder()
                let comics = try decoder.decode(ComicsModel.self, from: data)
                completed(.success(comics))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
