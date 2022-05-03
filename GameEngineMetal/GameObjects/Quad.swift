//
//  Quad.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/1/22.
//

import MetalKit

class Quad: GameObject {
	init() {
		super.init(meshType: .Quad_Custom)
		self.setName("Quad")
		let cube = Cube()
		cube.setScale(0.3)
		addChild(cube)
	}
}
