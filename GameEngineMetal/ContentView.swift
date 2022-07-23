//
//  ContentView.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import SwiftUI
import MetalView
import GameEngine

struct ContentView: View {
	let gameTime = GameTime()
	let engine = MetalEngine.shared
	let pref = Preferences.shared
	let scene = SandboxScene()
    var body: some View {
		MetalView(device: engine.device, drawingMode: .Timed, clearColor: pref.clearColor, colorPixelFormat: pref.mainPixelFormat, depthPixelFormat: pref.mainDepthPixelFormat)
			.onDraw(){ drawable, renderPassDescriptor, bounds in
				gameTime.UpdateTime()
				scene.updateScene(deltaTime: gameTime.DeltaTime)
				//guard let drawable = view.currentDrawable else { return}
				if let commandBuffer = engine.commandQueue.makeCommandBuffer(),
				   let renderCommandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor){
					commandBuffer.label = "My Command Buffer"
					// if view.currentRenderPassDescriptor != nil {
					renderCommandEncoder.label = "First Render Command Encoder"
					scene.render(renderCommandEncoder: renderCommandEncoder)
					renderCommandEncoder.endEncoding()
					commandBuffer.present(drawable)
					commandBuffer.commit()
				}
			}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
	
    }
}
