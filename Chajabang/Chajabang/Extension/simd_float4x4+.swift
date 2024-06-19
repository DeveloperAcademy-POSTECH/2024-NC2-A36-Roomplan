//
//  simd_float4x4+.swift
//  Chajabang
//
//  Created by 지영 on 6/19/24.
//

import Foundation
import ARKit

extension simd_float4x4 {
    var position: SIMD3<Float> {
        let translation = self.columns.3
        return SIMD3<Float>(translation.x, translation.y, translation.z)
    }
}
