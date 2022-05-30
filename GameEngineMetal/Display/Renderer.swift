//
//  GameViewCoordinator.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import MetalKit
import SwiftUI

class Renderer: NSObject, MTKViewDelegate {
	static var ScreenSize = simd_float2(repeating: 0)
	static var AspectRatio: Float {
		ScreenSize.x / ScreenSize.y
	}
	var parent: GameView
	
	let engine: Engine
	let preferences: Preferences
	var scenes: SceneManager
	let gameTime: GameTime
	
	init (_ parent: GameView){
		self.parent = parent
		preferences = Preferences.shared
		engine = Engine.shared
		scenes = SceneManager.shared
		gameTime = GameTime()
		super.init()
	}
	func updateScreenSize(view: MTKView){
		Renderer.ScreenSize = simd_float2(Float(view.bounds.width),
										  Float(view.bounds.height))
	}
	
	func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
		updateScreenSize(view: view)
	}
		
	func draw(in view: MTKView) {
		gameTime.UpdateTime()
		scenes.updateScene(deltaTime: gameTime.DeltaTime)
		//guard let drawable = view.currentDrawable else { return}
		if let drawable = view.currentDrawable,
		   let commandBuffer = engine.commandQueue.makeCommandBuffer(),
		   let renderPassDescriptor = view.currentRenderPassDescriptor,
		   let renderCommandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor){
			commandBuffer.label = "My Command Buffer"
			// if view.currentRenderPassDescriptor != nil {
			renderCommandEncoder.label = "First Render Command Encoder"
			scenes.renderScene(renderCommandEncoder: renderCommandEncoder)
			renderCommandEncoder.endEncoding()
			commandBuffer.present(drawable)
			commandBuffer.commit()
			
		}
	}
}
