//
//  OnboardingView.swift
//  Chajabang
//
//  Created by 지영 on 6/19/24.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var captureController = RoomCaptureController()
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("findIt")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("방을 스캔하고 물건을 메모하면\n원하는 물건을 쉽게 찾을 수 있어요!")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                Spacer().frame(height: 120)
                NavigationLink(destination: ScanningView(),
                               label: {
                    Text("스캔하기")
                        .padding()
                })
                    .buttonStyle(.borderedProminent)
                    .tint(.indigo)
                    .cornerRadius(40)
                    .font(.title.bold())
                    .foregroundStyle(Color.white)
            }
        }
        .environmentObject(captureController)
    }
}

#Preview {
    OnboardingView()
}
