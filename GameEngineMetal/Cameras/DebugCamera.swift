//
//  DebugCamera.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/29/22.
//

import Foundation
import simd

class DebugCamera: Camera {
	var cameraType: CameraTypes = .Debug
	
	var position: simd_float3 = simd_float3(repeating: 0)
	
	var projectionMatrix: matrix_float4x4 {
		matrix_float4x4.perspective(degreesFov: 45,
									aspectRatio: Renderer.AspectRatio,
									near: 0.1,
									far: 1000)
	}
	
	func update(deltaTime: Float) {
		if(Keyboard.IsKeyPressed(.leftArrow)){
			position.x -= deltaTime
		}
		if(Keyboard.IsKeyPressed(.rightArrow)){
			position.x += deltaTime
		}
		if(Keyboard.IsKeyPressed(.upArrow)){
			position.y += deltaTime
		}
		if(Keyboard.IsKeyPressed(.downArrow)){
			position.y -= deltaTime
		}
	}
	
	
}
