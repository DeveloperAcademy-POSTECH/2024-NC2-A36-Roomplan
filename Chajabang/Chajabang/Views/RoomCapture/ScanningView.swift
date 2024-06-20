//
//  ScanningView.swift
//  Chajabang
//
//  Created by 지영 on 6/19/24.
//

import SwiftUI

struct ScanningView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(RoomCaptureController.self) private var captureController
    @State private var showObjectsListView = false
    @State private var showMakeMemoButton = false
    
    var body: some View {
        @Bindable var bindableController = captureController
        
        ZStack(alignment: .bottom) {
            CaptureView()
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button("취소") {
                    captureController.stopSession()
                    presentationMode.wrappedValue.dismiss()
                })
                .foregroundColor(.indigo)
                .navigationBarItems(trailing: Button("완료") {
                    captureController.stopSession()
//                    if !captureController.roomObjects.isEmpty {
                        showMakeMemoButton = true
//                    } else {
//                        showMakeMemoButton = false
//                    }
                })
                .foregroundColor(.indigo)
                .onAppear() {
                    captureController.startSession()
                }
            
            if showMakeMemoButton {
                NavigationLink { 
                    ObjectsListView()
                } label: {
                    Text("메모하기")
                }
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
                .cornerRadius(40)
                .font(.system(size: 20).weight(.heavy))
                .foregroundStyle(Color.white)
                .padding(.bottom, 40)
            }
        }
    }
}

