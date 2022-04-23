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
				mtkView.preferredFramesPerSecond = 60
				mtkView.enableSetNeedsDisplay = false
				if let metalDevice = MTLCreateSystemDefaultDevice() {
					mtkView.device = metalDevice
				}
				mtkView.framebufferOnly = false
				mtkView.clearColor = MTLClearColor(red: 0, green: 255, blue: 0, alpha: 0)
				mtkView.drawableSize = mtkView.frame.size
				return mtkView
	}
	func updateNSView(_ nsView: NSViewType, context: Context) {
		
	}
}
