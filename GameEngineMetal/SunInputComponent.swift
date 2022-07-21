//
//  SunInputComponent.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/28/22.
//
import MetalKit
import GameplayKit
import GameEngine

class SunInputComponent: GKComponent{
	let toggleKey: Keyboard.KeyCodes
	init(toggleKey: Keyboard.KeyCodes){
		self.toggleKey = toggleKey
		super.init()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	override func update(deltaTime seconds: TimeInterval) {
		if let node = entity as? GameNode {
			if let light = node.component(ofType: LightComponent.self){
				if Keyboard.IsKeyPressed(toggleKey){
					light.setLightBrightness(0)
				} else {
					light.setLightBrightness(1.0)
				}
			}
			
		}
		super.update(deltaTime: seconds)
	}
	struct ClassConstants {
		static let keyMove: Float = 0.05
	}
}
