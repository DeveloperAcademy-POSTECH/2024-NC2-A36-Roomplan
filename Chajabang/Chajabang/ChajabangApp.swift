//
//  ChajabangApp.swift
//  Chajabang
//
//  Created by 지영 on 6/15/24.
//

import SwiftUI

@main
struct ChajabangApp: App {
    static let captureController = RoomCaptureController()

    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environment(ChajabangApp.captureController)
        }
    }
}
