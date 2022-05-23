//
//  LIghtComponent.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/21/22.
//

import MetalKit
import GameplayKit

class LightComponent: GKComponent {
	var lightData: LightData
	override init(){
		lightData = LightData()
		super.init()
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func update(deltaTime: TimeInterval) {
		if let node = entity as? Node {
			lightData.position = node.getPosition()
			print("update lightdata")
		}
		print("not a node for lightcomponet")
	}
}
