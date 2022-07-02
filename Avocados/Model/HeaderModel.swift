//
//  HeaderModel.swift
//  Avocados
//
//  Created by Tornelius Broadwater, Jr on 7/1/22.
//

import Foundation
import SwiftUI

// MARK: - Header Model

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
