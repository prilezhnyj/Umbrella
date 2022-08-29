//
//  LocationManager.swift
//  Umbrella
//
//  Created by Максим Боталов on 27.08.2022.
//

import Foundation

class LocationManager {
    
    private let apiKey = "35dcd7f1eb8dbd0d458136dfea7ff4db"
    
    func getWeatherData(cityName: String, completion: @escaping (UmbrellaModel) -> Void) {
        let urlStr = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName),&appid=\(apiKey)&units=metric&lang=ru"
        
        guard let url = URL(string: urlStr) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let umbrellaModel = self.jsonDecoder(data: data) else { return }
                completion(umbrellaModel)
            }
        }.resume()
    }
    
    private func jsonDecoder(data: Data?) -> UmbrellaModel? {
        if let data = data {
            let umbrellaModel = try? JSONDecoder().decode(UmbrellaModel.self, from: data)
            return umbrellaModel
        } else {
            return nil
        }
    }
    
    
}
