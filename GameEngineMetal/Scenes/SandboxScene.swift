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
    var quad = Quad()
    override func buildScene() {
        addCamera(debugCamera)
        
        debugCamera.setPositionZ(5)
		quad.setTexture(.PartyPirateParot)
		quad.scaleX(2.0)
		quad.scaleY(2.0)
        addChild(quad)
    }
    
	func doUpdate(_ deltaTime: Float) {
		
        quad.rotateY(deltaTime)
    }

 }
