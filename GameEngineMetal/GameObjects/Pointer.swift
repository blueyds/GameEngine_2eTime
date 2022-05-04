//
//  Player.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit

class Pointer: GameObject, Updateable {
    
    private var camera: Camera!
    init(camera: Camera) {
        super.init(meshType: .Triangle_Custom)
        self.camera = camera
        self.setName("Pointer")
    }
    
    func doUpdate() {
        self.rotateZ(-atan2f(Mouse.GetMouseViewportPosition().x - getPositionX() + camera.getPositionX(),
                             Mouse.GetMouseViewportPosition().y - getPositionY() + camera.getPositionY()))
        
    }
    
 }
