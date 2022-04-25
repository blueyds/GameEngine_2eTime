//
//  MetalView.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import MetalKit
import SwiftUI

 // -- Metal View with a delegate
struct MetalView: NSViewRepresentable{
	typealias NSViewType = MTKView
	typealias Coordinator = GameViewCoordinator
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	func makeNSView(context: Context) -> NSViewType {
		let mtkView = NSViewType()
		mtkView.delegate = context.coordinator
		mtkView.preferredFramesPerSecond = preferences.framesPerSEcond
		mtkView.enableSetNeedsDisplay = false
		mtkView.isPaused = false
		mtkView.device =  Engine.shared.device
		
		mtkView.framebufferOnly = false
		mtkView.clearColor = preferences.clearColor
		mtkView.drawableSize = mtkView.frame.size
		return mtkView
	}
	func updateNSView(_ nsView: NSViewType, context: Context) {
		
	}
}
