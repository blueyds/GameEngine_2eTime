//
//  CruiserInputComponent.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/22/22.
//

import MetalKit
import GameplayKit

class CruiserInputComponent: GKComponent{
	override func update(deltaTime seconds: TimeInterval) {
		if let node = entity as? Node {
			if Mouse.IsMouseButtonPressed(button: .left){
				node.rotateX(Mouse.GetDY() * ClassConstants.deltaMove)
				node.rotateY(Mouse.GetDX() * ClassConstants.deltaMove)
			}
			if Keyboard.IsKeyPressed(.w){
				node.moveZ(-ClassConstants.deltaMove)
			}
			if Keyboard.IsKeyPressed(.x) {
				node.moveZ(ClassConstants.deltaMove)
			}
		}
		
		
		super.update(deltaTime: seconds)
	}
	struct ClassConstants {
		static let deltaMove: Float = 0.05
	}
}
