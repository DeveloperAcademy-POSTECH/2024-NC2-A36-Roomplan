//
//  CaptureView.swift
//  Chajabang
//
//  Created by 지영 on 6/19/24.
//

import SwiftUI
import RoomPlan
import UIKit

struct CaptureView: UIViewRepresentable {
    @Environment(RoomCaptureController.self) private var captureController
    
    func makeUIView(context: Context) -> some UIView {
        captureController.roomCaptureView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct ActivityView: UIViewControllerRepresentable {
    var items: [Any]
    var activities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: activities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {}
}

