//
//  MetalView.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import MetalKit
import SwiftUI

 // -- Metal View with a delegate
struct GameView: NSViewRepresentable{
	typealias NSViewType = MTKView
	typealias Coordinator = Renderer
	let preferences = Preferences.shared
	let engine = Engine.shared
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	func makeNSView(context: Context) -> NSViewType {
		let mtkView = NSViewType()
		mtkView.delegate = context.coordinator
		mtkView.preferredFramesPerSecond = preferences.framesPerSEcond
		mtkView.enableSetNeedsDisplay = false
		mtkView.isPaused = false
		mtkView.device =  engine.device
		mtkView.framebufferOnly = true
		mtkView.clearColor = preferences.clearColor
		mtkView.colorPixelFormat = preferences.mainPixelFormat
		mtkView.depthStencilPixelFormat = preferences.mainDepthPixelFormat
		mtkView.drawableSize = mtkView.frame.size
		
		return mtkView
	}
	func updateNSView(_ nsView: NSViewType, context: Context) {
		engine.screenSize = simd_float2(Float(nsView.bounds.width),
										Float(nsView.bounds.height))
		
	}
	
}

