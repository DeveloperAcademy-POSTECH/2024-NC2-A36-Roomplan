//
//  RoomCaptureController.swift
//  Chajabang
//
//  Created by 지영 on 6/16/24.
//

import Foundation
import RoomPlan
import SceneKit
import Observation

@Observable
class RoomCaptureController: RoomCaptureViewDelegate, RoomCaptureSessionDelegate, ObservableObject {
    var roomCaptureView: RoomCaptureView
    var showExportButton = false
    var showShareSheet = false
    var exportUrl: URL?
    
    var sessionConfig: RoomCaptureSession.Configuration
    var finalResult: CapturedRoom?
    var sceneView: SCNView
    var scene: SCNScene
    var selectedNode: SCNNode?
    
    var roomObjects: [RoomObject] = []
    
    init() {
        roomCaptureView = RoomCaptureView(frame: CGRect(x: 0, y: 0, width: 42, height: 42))
        sceneView = SCNView(frame: .zero)
        scene = SCNScene()
        sessionConfig = RoomCaptureSession.Configuration()
        
        roomCaptureView.captureSession.delegate = self
        roomCaptureView.delegate = self
        
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = UIColor.clear
        setupSceneView()
    }
    
    func setupSceneView() {
        roomCaptureView.addSubview(sceneView)
        sceneView.frame = roomCaptureView.bounds
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

        guard let finalResult = finalResult else { return }  
        
        for object in finalResult.objects {
            roomObjects.append(RoomObject(object: object, category: object.category))
        }
        addWallsToScene(walls: finalResult.walls)
        addObjectsToScene(objects: finalResult.objects)
    }
    
    private func addWallsToScene(walls: [CapturedRoom.Surface]) {
        for wall in walls {
            guard wall.category == .wall else {
                continue // 벽 카테고리가 아닌 경우 무시
            }
            let wallNode = createWallNode(wall: wall)
            scene.rootNode.addChildNode(wallNode)
        }
    }
    
    private func createWallNode(wall: CapturedRoom.Surface) -> SCNNode {
            // simd_float4x4 형식의 transform을 SCNMatrix4로 변환
            let transform = SCNMatrix4(wall.transform)
            
            // 벽의 크기와 위치 정보를 기반으로 SCNBox 생성
            let width = CGFloat(wall.dimensions.x)
            let height = CGFloat(wall.dimensions.y)
            let length = CGFloat(0.1) // 벽 두께를 작게 설정
            
            let geometry = SCNBox(width: width, height: height, length: length, chamferRadius: 0)
            let material = SCNMaterial()
            material.diffuse.contents = UIColor.lightGray
            geometry.materials = [material]
            
            let node = SCNNode(geometry: geometry)
            node.transform = transform // 변환된 transform 설정
            
            return node
        }
    
    private func addObjectsToScene(objects: [CapturedRoom.Object]) {
        for object in objects {
            let node = createNode(from: object)
            scene.rootNode.addChildNode(node)
        }
    }
    
    private func createNode(from object: CapturedRoom.Object) -> SCNNode {
            let geometry = SCNBox(width: CGFloat(object.dimensions.x), height: CGFloat(object.dimensions.y), length: CGFloat(object.dimensions.z), chamferRadius: 0)
            let node = SCNNode(geometry: geometry)
            node.name = object.identifier.uuidString
            
            // simd_float4x4 형식의 transform을 SCNMatrix4로 변환
            let transform = SCNMatrix4(object.transform)
            node.transform = transform // 변환된 transform 설정
            
            return node
        }
    
    func selectObject(_ object: CapturedRoom.Object) {
        if let previousNode = selectedNode {
            previousNode.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        }
        if let node = scene.rootNode.childNode(withName: object.identifier.uuidString, recursively: true) {
            node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
            selectedNode = node
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not needed.")
    }
    
    func encode(with coder: NSCoder) {
        fatalError("Not needed.")
    }
}
