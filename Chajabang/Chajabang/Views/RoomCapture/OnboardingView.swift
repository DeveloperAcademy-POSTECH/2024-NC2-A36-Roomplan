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
                Text("찾아방").font(.title)
                Spacer().frame(height: 40)
                Text("방을 스캔하고 물건을 메모하면 원하는 물건을 쉽게 찾을 수 있어요!")
                    .multilineTextAlignment(.center)
                Spacer().frame(height: 40)
                NavigationLink(destination: ScanningView(), label: {Text("스캔하기").padding()})
                    .buttonStyle(.borderedProminent)
                    .tint(.indigo)
                    .cornerRadius(40)
                    .font(.title3)
                    .foregroundStyle(Color.white)
            }
            .background(.black)
        }
        .environmentObject(captureController)
    }
}

#Preview {
    OnboardingView()
}
