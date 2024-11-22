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
            "bodyText": "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
            "imageName": "TrackYouGoal"
        ],
        .burn: [
            "headerText": "Burn and Transform",
            "bodyText": "Intense workouts designed to maximize calorie burn and build lean muscle",
            "imageName": "GetBurn"
        ],
        .eat: [
            "headerText": "Nutrition Optimization",
            "bodyText": "Personalized meal plans and nutritional guidance for your fitness goals",
            "imageName": "EatWell"
        ],
        .sleep: [
            "headerText": "Restorative Sleep Strategies",
            "bodyText": "Advanced techniques to improve sleep quality and recovery",
            "imageName": "Sleep"
        ],
        .login: [
            "headerText": "IFit",
            "bodyText": "Everybody Can Train"
        ]
    ]

    private init() {}
}

