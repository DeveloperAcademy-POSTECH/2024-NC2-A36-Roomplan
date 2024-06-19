//
//  Room.swift
//  Chajabang
//
//  Created by 지영 on 6/16/24.
//

import Foundation
import RoomPlan

struct RoomObject: Hashable, Identifiable {
    let id = UUID()
    var category: CapturedRoom.Object.Category
    var memos: [String] = []
}
