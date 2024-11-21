//
//  extension Array.swift
//  IFitApp
//
//  Created by Sasha on 20.11.24.
//

import Foundation


// расширение для массивов которые используют за элемент LoginedApp
extension Array where Element == LoginedApp {

    func safeApp(for type: TypeTraine) -> LoginedApp? {
        return self.first { $0.typeTraine == type } ?? self.first
    }

}
