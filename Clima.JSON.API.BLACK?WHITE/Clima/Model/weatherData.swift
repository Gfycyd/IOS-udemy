//
//  weatherData.swift
//  Clima
//
//  Created by MacbookAir on 20.01.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
struct weatherData:Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    }

    struct Main: Decodable {
        let temp: Double
    }
struct Weather: Decodable {
    let id: Int
}

