//
//  LIghtObject.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/21/22.
//

import MetalKit

class LightEntit: GameObject {
	
	var lightData = LightData()
	
	init(name: String) {
		super.init(meshType: .None)
		setName(name)
	}
	init(meshType: Entities.Types, name: String){
		super.init(meshType: meshType)
		setName(name)
	}
	override func update() {
		lightData.position = getPosition()
		super.update()
	}
}
