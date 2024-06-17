//
//  Item.swift
//  Chajabang
//
//  Created by 지영 on 6/15/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
