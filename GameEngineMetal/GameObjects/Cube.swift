//
//  Cube.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/29/22.
//

import MetalKit

class Cube: GameObject, Updateable {
    
    init(){
        super.init(meshType: .Cube_Custom)
        self.setName("Cube")
    }
    
    func doUpdate() {
        self.rotateX(GameTime.DeltaTime)
        self.rotateY(GameTime.DeltaTime)
    }
 }