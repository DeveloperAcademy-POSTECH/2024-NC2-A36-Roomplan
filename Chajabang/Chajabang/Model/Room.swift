//
//  Room.swift
//  Chajabang
//
//  Created by 지영 on 6/16/24.
//

import Foundation
import RoomPlan

struct Room {
    let capturedRoom: CapturedRoom
    var objects: [RoomObject]
}

struct RoomObject {
    let object: CapturedRoom.Object
    var memos: [String]
}
