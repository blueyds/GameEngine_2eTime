//
//  Camera.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/29/22.
//
import Foundation
import simd

enum CameraTypes {
	case Debug
}
class Camera: Node {
    var cameraType: CameraTypes!
    
    var viewMatrix: matrix_float4x4 {
        var viewMatrix = matrix_identity_float4x4
		viewMatrix.rotate(angle: getRotationX(), axis: .x)
		viewMatrix.rotate(angle: getRotationY(), axis: .y)
		viewMatrix.rotate(angle: getRotationZ(), axis: .z)
        viewMatrix.translate(direction: -getPosition())
        return viewMatrix
    }
    
    var projectionMatrix: matrix_float4x4 {
        return matrix_identity_float4x4
    }
    
    init(cameraType: CameraTypes){
        super.init(name: "Camera")
        self.cameraType = cameraType
    }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
