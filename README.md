# 2024-NC2-A36-Roomplan
## 🎥 Youtube Link
(추후 만들어진 유튜브 링크 추가)

## 💡 About Roomplan
- ARKit에 기반하고 iPhone 및 iPad에서 카메라, LiDAR 스캐너로 방의 크기 및 가구 유형과 같은 핵심 특성이 포함된 3D 평면도 생성 <br/>
- 사용자가 환경을 스캔하면 3D 모델이 생성되며, 이를 통해 공간 설계 및 가구 배치 등에 활용 가능 <br/>
- RoomPlan내 기본적으로 구분된 카테고리를(침대, 옷장 등) 자동으로 분류해줌 

## 🎯 What we focus on?
- **제공된 카테고리 내 물체 인식 가능**은 침대, 책상, 의자 등 가구를 자동으로 인식하고 3D 평면도로 표시하는 기능이다. <br/>
- 다른 기본적인 기능처럼 데이터를 불러오는 것에서 멈추지 않고, 다양한 물체를 인식하기 때문에 활용도가 높아보였고, RoomPlan을 활용한 물건 위치 메모 기능을 구상했다. 

## 💼 Use Case
방에 물건을 어디에 뒀는지 자주 잊어버리는 사람이 그 위치를 쉽게 찾을 수 있도록 RoomPlan을 활용해 물건 위치를 메모하자!

## 🖼️ Prototype
<img width="547" alt="3" src="https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A36-Roomplan/assets/111112592/249d547b-1619-4e11-ba47-425b419856ba">
<img width="558" alt="ㄷㄷ" src="https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A36-Roomplan/assets/111112592/7392c0e3-9c97-41b8-a723-29a6455357a3">

## 🛠️ About Code
- UIKit이 아니라 SwiftUI를 활용하여 작성함 
- RoomCaptureController를 사용해서 RoomPlan을 활용할 수 있도록 세팅
  
```Swift
import Foundation
import RoomPlan
import Observation

@Observable
class RoomCaptureController: RoomCaptureViewDelegate, RoomCaptureSessionDelegate, ObservableObject
{
    var roomCaptureView: RoomCaptureView
    var showExportButton = false
    var showShareSheet = false
    var exportUrl: URL?
    var sessionConfig: RoomCaptureSession.Configuration
    var finalResult: CapturedRoom?
    
    init() {
        roomCaptureView = RoomCaptureView(frame: CGRect(x: 0, y: 0, width: 42, height: 42))
        sessionConfig = RoomCaptureSession.Configuration()
        roomCaptureView.captureSession.delegate = self
        roomCaptureView.delegate = self
    }
    
    func startSession() {
        roomCaptureView.captureSession.run(configuration: sessionConfig)
    }
    
    func stopSession() {
        roomCaptureView.captureSession.stop()
    }
    
    func captureView(shouldPresent roomDataForProcessing: CapturedRoomData, error: Error?) -> Bool {
        return true
    }
    
    func captureView(didPresent processedResult: CapturedRoom, error: Error?) {
        finalResult = processedResult
    }
    /* … */
}

import SwiftUI
import RoomPlan

struct CaptureView : UIViewRepresentable
{
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
```
