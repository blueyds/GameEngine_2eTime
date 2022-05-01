//
//  SandboxScene.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import Foundation
import simd

class SandboxScene: GameScene {
	var camera = DebugCamera()
//	var cube = Cube()
	var cubeCollection1: CubeCollection!
//	var cubeCollection2: CubeCollection!
	override func buildScene() {
		addCamera(camera)
		camera.position.z = 10
		
		addCubes()
	}
	override func update(deltaTime: Float) {
		camera.position.z -= Mouse.GetDWheel()
		cubeCollection1.rotation.z += deltaTime
//		cubeCollection1.rotation.z -= deltaTime
		super.update(deltaTime: deltaTime)
	}
	func addCubes() {
		cubeCollection1 = CubeCollection(cubesWide: 20, cubesHigh: 20, cubesBack: 20)
		cubeCollection1.position.x = -16
		addChild(cubeCollection1)
		
	}
	
	
}
