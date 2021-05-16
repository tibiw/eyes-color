//
//  ARView.swift
//  EyesColor
//
//  Created by Tibor Waxmann on 16.05.2021.
//

import Foundation
import ARKit
import SwiftUI

// MARK: - ARViewIndicator
struct ARViewIndicator: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ARView
    
    func makeUIViewController(context content: Context) -> ARView {
        return ARView()
    }
    
    func updateUIViewController(_ uiViewController: ARViewIndicator.UIViewControllerType, context: UIViewControllerRepresentableContext<ARViewIndicator>) -> {}
}

class ARView: UIViewController, ARSCNViewDelegate {
    private let sceneView = ARSCNView(frame: .zero)
    
    private var leftEyeNode: ImageNode?
    private var rightEyeNode: ImageNode?
    
    private let aceTrackingConfiguration = ARFaceTrackingConfiguration()
    
    var arView: ARSCNView {
        return self.view as! ARSCNView
    }
    
    override func loadView() {
        self.view = ARSCNView(frame: .zero)
        view = sceneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arView.delegate = self
        arView.scene = SCNScene()
    }
    
    guard ARFaceTrackingConfiguration.isSupported else { fatalError("A True Depth camera is required!") }
    
    sceneView.delegate = self
}
