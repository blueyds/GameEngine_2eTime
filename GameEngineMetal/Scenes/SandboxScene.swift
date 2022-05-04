//
//  SandboxScene.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import Foundation
import simd
class SandboxScene: Scene{
    
    var debugCamera = DebugCamera()
    var quad = Quad()
    override func buildScene() {
        addCamera(debugCamera)
        
        debugCamera.setPositionZ(5)

        addChild(quad)
    }
    
    override func doUpdate() {
        quad.setPositionX(cos(GameTime.TotalGameTime))
    }

 }