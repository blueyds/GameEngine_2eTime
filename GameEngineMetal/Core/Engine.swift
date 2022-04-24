//
//  Engine.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/23/22.
//

import MetalKit

let engine = Engine()

class Engine {
	let device: MTLDevice!
	let commandQueue: MTLCommandQueue!
	let shaders: ShaderLibrary
	let descriptors: VertexDescriptorLibrary
	init () {
		if let local_device = MTLCreateSystemDefaultDevice(){
			self.device = local_device
		} else { fatalError("Could not create metal device") }
		if let cq = device.makeCommandQueue() {
			self.commandQueue = cq
		} else { fatalError("Could not create command queue") }
		shaders = ShaderLibrary(devive: self.device)
		descriptors = VertexDescriptorLibrary()
	}
}
