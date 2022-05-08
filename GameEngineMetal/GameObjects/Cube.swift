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
    
	func doUpdate(_ deltaTime: Float) {
        self.rotateX(deltaTime)
        self.rotateY(deltaTime)
    }
 }
