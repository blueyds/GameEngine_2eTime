//
//  GameViewCoordinator.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import MetalKit

class Renderer: NSObject, MTKViewDelegate {
	
	var parent: GameView
	
	let engine: Engine
	let preferences: Preferences
	var player: Player

	
	init (_ parent: GameView){
		self.parent = parent
		preferences = Preferences.shared
		engine = Engine.shared
		player = Player()
		super.init()
	}

	
	func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
		
	}
		
	func draw(in view: MTKView) {
		guard let drawable = view.currentDrawable else { return}
		let commandBuffer = engine.commandQueue.makeCommandBuffer()
		if view.currentRenderPassDescriptor != nil {
			if let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: view.currentRenderPassDescriptor!) {
				player.render(renderCommandEncoder: renderCommandEncoder)
				renderCommandEncoder.endEncoding()
			}
		}
		
		commandBuffer?.present(drawable)
		commandBuffer?.commit()
	}
}
