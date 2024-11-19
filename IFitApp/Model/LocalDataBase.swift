//
//  LocalDataBase.swift
//  IFitApp
//
//  Created by Sasha on 20.11.24.
//

import Foundation


final class LocalDatabase {
    static let shared = LocalDatabase()

    let trainingDescriptions: [TypeTraine: [String: String]] = [
        .track: [
            "headerText": "Track Your Personal Goals",
            "bodyText": "Customize and monitor your fitness journey with precision and motivation"
        ],
        .burn: [
            "headerText": "Burn and Transform",
            "bodyText": "Intense workouts designed to maximize calorie burn and build lean muscle"
        ],
        .eat: [
            "headerText": "Nutrition Optimization",
            "bodyText": "Personalized meal plans and nutritional guidance for your fitness goals"
        ],
        .sleep: [
            "headerText": "Restorative Sleep Strategies",
            "bodyText": "Advanced techniques to improve sleep quality and recovery"
        ],
        .login: [
            "headerText": "IFit",
            "bodyText": "Everybody Can Train"
        ]
    ]

    private init() {}
}

