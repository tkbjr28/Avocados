//
//  RipeningModel.swift
//  Avocados
//
//  Created by Tornelius Broadwater, Jr on 7/2/22.
//

import Foundation
import SwiftUI

// MARK: - Ripening Model

struct Ripening: Identifiable {
    var id = UUID()
    var image: String
    var stage: String
    var title: String
    var description: String
    var ripeness: String
    var instruction: String
}
