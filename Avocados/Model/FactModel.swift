//
//  FactModel.swift
//  Avocados
//
//  Created by Tornelius Broadwater, Jr on 7/1/22.
//

import Foundation
import Swift

// MARK: - Fact Model

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
