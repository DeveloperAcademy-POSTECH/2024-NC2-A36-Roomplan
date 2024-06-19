//
//  SceneView.swift
//  Chajabang
//
//  Created by 지영 on 6/19/24.
//

import SwiftUI
import RoomPlan
import SceneKit


struct SceneView : UIViewRepresentable {
    @Environment(RoomCaptureController.self) private var captureController
    
    func makeUIView(context: Context) -> some UIView {
        captureController.sceneView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}


