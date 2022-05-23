//
//  DebugCameraInputController.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/22/22.
//

import MetalKit
import GameplayKit

class DebugCameraInputComponent: GKComponent{
	override func update(deltaTime seconds: TimeInterval) {
		if let node = entity as? Node {
			node.moveZ(-Mouse.GetDWheel())
			if Keyboard.IsKeyPressed(.leftArrow){
				node.moveX(-ClassConstants.keyMove)
			}
			if Keyboard.IsKeyPressed(.rightArrow){
				node.moveX(ClassConstants.keyMove)
			}
			if Keyboard.IsKeyPressed(.upArrow){
				node.moveY(ClassConstants.keyMove)
			}
			if Keyboard.IsKeyPressed(.downArrow){
				node.moveY(-ClassConstants.keyMove)
			}
			
		}
		
		
		super.update(deltaTime: seconds)
	}
	struct ClassConstants {
		static let keyMove: Float = 0.05
	}
}
