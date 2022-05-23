//
//  LightManager.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/21/22.
//

import MetalKit
import GameplayKit
class LightManager {
	//private var _lightObjects: [LightObject] = []
	var _components = GKComponentSystem<LightComponent>()
	
	init (){
		_components = GKComponentSystem<LightComponent>(componentClass: LightComponent.self)
	}

	
	func setLightData(_ renderCommandEncoder: MTLRenderCommandEncoder) {
		var lightDatas: [LightData] = []
		_components.components.forEach(){
			lightDatas.append($0.lightData)
		}
		renderCommandEncoder.setFragmentBytes(&lightDatas, length: LightData.size(lightDatas.count), index: 2)
	}
	func updateAll(deltaTime: TimeInterval){
		
	}
	
	func addComponent(foundIn fromNode: Node){
		_components.addComponent(foundIn: fromNode)
		print("Light system has \(_components.components.count) lights")
	}
	func removeComponent(foundIn fromNode: Node){
		_components.removeComponent(foundIn: fromNode)
	}
}
