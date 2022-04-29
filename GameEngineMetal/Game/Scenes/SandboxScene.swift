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
	var cube = Cube()
	override func buildScene() {
		addCamera(camera)
		camera.position.z = 5
		addChild(cube)
	}
	override func update(deltaTime: Float) {
		cube.rotation.x += deltaTime
		cube.rotation.y += deltaTime
		super.update(deltaTime: deltaTime)
	}
	
}
