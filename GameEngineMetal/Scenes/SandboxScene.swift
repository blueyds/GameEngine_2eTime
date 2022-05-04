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

        addChild(quad)
    }
    
    func doUpdate() {
		GameTime.UpdateTime()
        quad.setPositionX(cos(GameTime.TotalGameTime))
    }

 }
