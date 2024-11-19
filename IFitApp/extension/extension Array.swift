//
//  extension Array.swift
//  IFit
//
//  Created by Sasha on 19.11.24.
//

import Foundation


extension Array where Element == LoginedApp {
    func safeApp(for type: TypeTraine) -> LoginedApp? {
        return self.first { $0.typeTraine == type } ?? self.first
    }
}
