//
//  Cruiser.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/7/22.
//

import MetalKit

class Cruiser: GameObject{
	
	init(){
		super.init(meshType: .Cruiser)
		setName("Cruiser")
	}
}
