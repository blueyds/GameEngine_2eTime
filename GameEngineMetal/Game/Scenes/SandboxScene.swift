//
//  SandboxScene.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import Foundation
import simd

class SandboxScene: GameScene {
	
	override func buildScene() {
		for y in -5..<5{
			for x in -5..<5{
				let player = Player()
				player.position.y = Float(Float(y) + 0.5) / 5
				player.position.x = Float(Float(x) + 0.5) / 5
				player.scale = simd_float3(repeating: 0.1)
				addChild(player)
			}
		}
	}
	override func update(deltaTime: Float) {
		for child in children {
			child.rotation.z += 0.02
		}
		super.update(deltaTime: deltaTime)
	}
}
