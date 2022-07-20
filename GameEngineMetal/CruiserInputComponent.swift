//
//  CruiserInputComponent.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/22/22.
//

import MetalKit
import GameplayKit

class CruiserInputComponent: GKComponent{
	override func update(deltaTime: TimeInterval) {
		if let node = entity as? GameNode {
			if Mouse.IsMouseButtonPressed(button: .left){
				node.rotateX(Mouse.GetDY() * deltaTime.RatePerSecond * ClassConstants.speed)
				node.rotateY(Mouse.GetDX() * deltaTime.RatePerSecond * ClassConstants.speed)
			}
			if Keyboard.IsKeyPressed(.w){
				node.moveZ(-deltaTime.RatePerSecond * ClassConstants.speed)
			}
			if Keyboard.IsKeyPressed(.x) {
				node.moveZ(deltaTime.RatePerSecond * ClassConstants.speed)
			}
		}
		
		
		super.update(deltaTime: deltaTime)
	}
	struct ClassConstants {
		static let speed: Float = 0.05
	}
}
