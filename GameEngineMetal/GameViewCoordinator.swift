//
//  GameViewCoordinator.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import MetalKit

class GameViewCoordinator: NSObject, MTKViewDelegate {
	
	var parent: MetalView
	var device: MTLDevice!
	var commandQueue: MTLCommandQueue!
	var renderPipelineState: MTLRenderPipelineState!
	//var clearColor: MTLClearColor
	var colorPixelFormat: MTLPixelFormat
	
	init (_ parent: MetalView){
		
		self.parent = parent
		
		if let metalDevice = MTLCreateSystemDefaultDevice(){
			self.device = metalDevice
		}
		
		//self.clearColor = MTLClearColor(red: 0.43, green: 0.73, blue: 0.35, alpha: 1.0)
		
		self.colorPixelFormat = .bgra8Unorm
		
		self.commandQueue = device.makeCommandQueue()!
		
		super.init()
		
		createRenderPipelineState()
	}
	
	func createRenderPipelineState(){
		let library = device.makeDefaultLibrary()
		let vertexFunction = library?.makeFunction(name: "basic_vertex_function")
		let fragmentFunction = library?.makeFunction(name: "basic_fragment_shader")
		
		let renderPipeLineDescriptor = MTLRenderPipelineDescriptor()
		renderPipeLineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
		
		renderPipeLineDescriptor.vertexFunction = vertexFunction
		renderPipeLineDescriptor.fragmentFunction = fragmentFunction
		do{
			renderPipelineState = try device.makeRenderPipelineState(descriptor: renderPipeLineDescriptor)
		}catch let error as NSError {
			print(error)
		}
		
		
	}
	func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
		
	}
		
	func draw(in view: MTKView) {
		guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return}
			let commandBuffer = commandQueue.makeCommandBuffer()
				let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
			renderCommandEncoder?.setRenderPipelineState(renderPipelineState)
			
			// send info to rendering commander
			
			renderCommandEncoder?.endEncoding()
			commandBuffer?.present(drawable)
			commandBuffer?.commit()
		}
}
