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
protocol Camera {
	var cameraType: CameraTypes {get}
	var position: simd_float3 { get set}
	var projectionMatrix: matrix_float4x4 { get }
	func update(deltaTime: Float)
}

extension Camera {
	var viewMatrix: matrix_float4x4 {
		var result = matrix_identity_float4x4
		result.translate(direction: -position)
		return result
	}
}
