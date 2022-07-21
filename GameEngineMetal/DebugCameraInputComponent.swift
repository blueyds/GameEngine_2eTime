//
//  DebugCameraInputController.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/22/22.
//

import MetalKit
import GameplayKit
import GameEngine

class DebugCameraInputComponent: GKComponent{
	override func update(deltaTime: TimeInterval) {
		if let node = entity as? GameNode {
			let deltaMove = deltaTime.RatePerSecond * ClassConstants.speed
//			let deltaMove = ClassConstants.speed
			if Keyboard.IsKeyPressed(.leftArrow){
				node.moveX(-deltaMove)
			}
			if Keyboard.IsKeyPressed(.rightArrow){
				node.moveX(deltaMove)
			}
			if Keyboard.IsKeyPressed(.upArrow){
				node.moveY(deltaMove)
			}
			if Keyboard.IsKeyPressed(.downArrow){
				node.moveY(-deltaMove)
			}
			//node.moveZ(-Mouse.GetDWheel() * deltaTime.RatePerSecond * ClassConstants.speed)
			
		}
		super.update(deltaTime: deltaTime)
	}
	struct ClassConstants {
		static let speed: Float = 0.1
	}
}
