//
//  WeatherManager.swift
//  Clima
//
//  Created by MacbookAir on 20.01.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}
struct WeatherManager {
    var city = "london"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=e72ca729af228beabd5d20e3b7749713&units=metric&q="
    
    func fetchWeather(cityName: String) -> String{
        let url = "\(weatherURL)\(cityName)"
        performRequest(with: url)
        return url
    }
    
    var delegate: WeatherManagerDelegate?
    func performRequest(with url: String) {
        if let myURL = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: myURL){(data, urlResponse, error) in
                    if error != nil {
                        self.delegate?.didFailWithError(error: error!)
                        return
                    }
                    if let dataMy = data {
                        if let weather = self.parseJSON(dataMy) {
                            self.delegate?.didUpdateWeather(self, weather: weather)
                        }
                    }
                }
            task.resume()
        }
        
    }
    func parseJSON(_ weather: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(weatherData.self, from: weather)
            let id = data.weather[0].id
            let temp = data.main.temp
            let name = data.name
            
            let weatherModel = WeatherModel(conditionId: id, nameCity: name, temperature: temp)
            return weatherModel
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }

    
}
