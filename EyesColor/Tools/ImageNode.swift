//
//  ImageNode.swift
//  EyesColor
//
//  Created by Tibor Waxmann on 16.05.2021.
//

import SceneKit

final class ImageNode: SCNNode {
    init(width: CGFloat, height: CGFloat, image: UIImage) {
        super.init()
        let plane = SCNPlane(width: width, height: height)
        plane.firstMaterial?.diffuse.contents = image
        plane.firstMaterial?.isDoubleSided = true
        geometry = plane
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented!")
    }
}

struct GlobalVar {
    static var irisNames = ["blue0.png", "blue1.png", "blue2.png", "gray.png", "green.png", "hazel.png"]
    static var leftIrisName = "blue0.png"
    static var rightIrisName = "blue0.png"
}
