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
		camera.position.z = 6
		
		addCubes()
	}
	func addCubes() {
		let yCount = 5
		let xCount = 8
		for y in -yCount..<yCount {
			let posY = Float(y) + 0.5
			for x in -xCount..<xCount {
				let posX = Float(x) + 0.5
				let cube = Cube()
				cube.position.y = posY
				cube.position.x = posX
				cube.scale = simd_float3(repeating:  0.3)
				cube.setColor(ColorUtil.randomColor)
				addChild(cube)
			}
		}
	}
	
	
}
