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

extension LightComponent {
	// Light Color
	public func setLightColor(_ color: simd_float3){
		lightData.color = color
	}
	public func getLightColor()->simd_float3 {
		lightData.color
	}
	// Light Brighness
	public func setLightBrightness(_ brightness: Float){
		lightData.brightness = brightness
	}
	public func getLightBrightness()-> Float {
		lightData.brightness
	}
	
	// Ambient Intensity
	public func setLigtAmbientIntensity(_ intensity: Float) {
		lightData.ambientIntensity = intensity
	}
	public func getLightAmbientIntensity()-> Float {
		lightData.ambientIntensity
	}
}
