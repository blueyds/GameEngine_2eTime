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
	override func buildScene() {
		addCamera(camera)
		let count: Int = 5
		for y in -count..<count{
			for x in -count..<count{
				let player = Pointer(camera: camera)
				player.position.y = Float(Float(y) + 0.5) / Float(count)
				player.position.x = Float(Float(x) + 0.5) / Float(count)
				player.scale = simd_float3(repeating: 0.1)
				addChild(player)
			}
		}
	}
	
}
