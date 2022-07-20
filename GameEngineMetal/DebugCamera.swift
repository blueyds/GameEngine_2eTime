//
//  DebugCamera.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/29/22.
//

import simd

class DebugCamera: Camera {
	private var _zoom: Float = 45.0
    override var projectionMatrix: matrix_float4x4 {
        return matrix_float4x4.perspective(degreesFov: _zoom,
                                           aspectRatio: Renderer.AspectRatio,
                                           near: 0.1,
                                           far: 1000)
    }
    
    init() {
        super.init(cameraType: .Debug)
    }
	
	
	
//	func doUpdate(_ deltaTime: Float) {
//        if(Keyboard.IsKeyPressed(.leftArrow)){
//            self.moveX(-deltaTime)
//        }
//
//        if(Keyboard.IsKeyPressed(.rightArrow)){
//            self.moveX(deltaTime)
//        }
//
//        if(Keyboard.IsKeyPressed(.upArrow)){
//            self.moveY(deltaTime)
//        }
//
//        if(Keyboard.IsKeyPressed(.downArrow)){
//            self.moveY(-deltaTime)
//        }
//		self._zoom -= Mouse.GetDWheel()
//    }
// }
