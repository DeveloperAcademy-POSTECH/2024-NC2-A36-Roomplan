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
    var object: CapturedRoom.Object
    var category: CapturedRoom.Object.Category
    var memos: [String] = []
}

extension CapturedRoom.Object: Hashable, Equatable {
    public static func == (lhs: CapturedRoom.Object, rhs: CapturedRoom.Object) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

extension CapturedRoom.Object.Category: Hashable, Equatable {}

