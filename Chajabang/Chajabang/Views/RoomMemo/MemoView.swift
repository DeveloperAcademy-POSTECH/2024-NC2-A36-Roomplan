//
//  MemoView.swift
//  Chajabang
//
//  Created by 지영 on 6/19/24.
//

import SwiftUI

struct MemoView: View {
    @Binding var roomObject: RoomObject?
    @State var appendTextFiled: String = ""
    
    var body: some View {
        VStack {
            if let roomObject {
                Text("\(roomObject.category)")
                    .font(.title2)
                HStack {
                    TextField("물건을 적어주세요", text: $appendTextFiled)
                        .foregroundStyle(Color.gray)
                    
                    Button {
                        self.roomObject?.memos.append(appendTextFiled)
                        appendTextFiled = ""
                    } label: {
                        Text("추가")
                            .foregroundStyle(Color.white)
                            .padding()
                            .background(
                                Rectangle()
                                    .foregroundStyle(Color.indigo)
                                    .cornerRadius(14)
                            )
                    }
                }
                .listRowBackground(Color.clear)
                
                List {
                    ForEach(roomObject.memos, id: \.self) { memo in
                        Text(memo)
                    }
                    .transition(.move(edge: .bottom))
                }
            }
        }
        .padding()
    }
}

