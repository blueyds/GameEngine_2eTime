//
//  SandboxScene.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import Foundation
import simd
class SandboxScene: GameScene, Updateable {
    
    var debugCamera = DebugCamera()
    var cruiser = Cruiser()
	override func buildScene() {
        addCamera(debugCamera)
        
        debugCamera.setPositionZ(5)
		
		cruiser.setTexture(.Cruiser)
        addChild(cruiser)
    }
    
	func doUpdate(_ deltaTime: Float) {
		
		if Mouse.IsMouseButtonPressed(button: .left){
			cruiser.rotateX(Mouse.GetDY() * deltaTime)
			cruiser.rotateY(Mouse.GetDX() * deltaTime)
		}
		
    }

 }
