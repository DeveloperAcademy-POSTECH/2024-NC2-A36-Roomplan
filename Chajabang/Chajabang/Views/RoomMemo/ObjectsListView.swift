//
//  ObjectsListView.swift
//  Chajabang
//
//  Created by 지영 on 6/19/24.
//

import SwiftUI

struct ObjectsListView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(RoomCaptureController.self) private var captureController
    @State private var selectedRoomObject: RoomObject? = nil

    
    var body: some View {
        VStack(spacing: 0){
            SceneView()
                .frame(height: UIScreen.main.bounds.height / 3)
            List {
                ForEach(captureController.roomObjects, id: \.self) { object in
                    HStack {
                        Button(action: {
                            captureController.selectObject(object.object)
                            selectedRoomObject = object
                        }) {
                            Text("\(object.category)")
                                .foregroundStyle(.indigo)
                        }
                    }
                }
                .sheet(item: $selectedRoomObject) { _ in
                    MemoView(roomObject: $selectedRoomObject)
                        .presentationDetents([.medium, .large])
                }
            }
        }
    }
}


#Preview {
    ObjectsListView()
}
