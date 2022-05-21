//
//  LightManager.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/21/22.
//

import MetalKit
class LightManager {
	private var _lightObjects: [LightObject] = []
	
	func addLightObject(_ lightObject: LightObject){
		_lightObjects.append(lightObject)
	}
	
	private func gatherLightData()->[LightData] {
		var result: [LightData] = []
		for lightObject in _lightObjects {
			result.append(lightObject.lightData)
		}
		return result
	}
	
	func setLightData(_ renderCommandEncoder: MTLRenderCommandEncoder) {
		var lightDatas = gatherLightData()
		renderCommandEncoder.setFragmentBytes(&lightDatas, length: LightData.size(lightDatas.count), index: 2)
	}
}
