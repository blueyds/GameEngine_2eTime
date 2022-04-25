//
//  Engine.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/23/22.
//

import MetalKit

final class Engine {
	static let shared: Engine = Engine()
	private let _device: MTLDevice!
	private let _commandQueue: MTLCommandQueue!
	private let _shaders: ShaderLibrary
	private let _descriptors: VertexDescriptorLibrary
	private let _renderDescriptors: RenderDescriptorLibrary
	private let _renderStates: RenderPipelineLibrary
	private let _preferences: Preferences
	
	func Vertex(_ vertexFunctionType: ShaderLibrary.VertexShaderTypes)-> MTLFunction{
		_shaders.Vertex(vertexFunctionType)
	}
	
	func Fragment(_ fragmentFunctionType: ShaderLibrary.FragmentShaderTypes)-> MTLFunction{
		_shaders.Fragment(fragmentFunctionType)
	}
	func Descriptor(_ vertexDescriptorType: ShaderLibrary.Types)->MTLVertexDescriptor{
		_descriptors.VertexDescription(vertexDescriptorType)
	}
	func RenderDescriptor(_ renderDescriptionType: RenderDescriptorLibrary.Types)-> MTLRenderPipelineDescriptor{
		_renderDescriptors.descriptor(renderDescriptionType)
	}
	func RenderState(_ renderPipelineStateType: RenderPipelineLibrary.Types)-> MTLRenderPipelineState {
		_renderStates[renderPipelineStateType].state
	}
	
	private init () {
		if let local_device = MTLCreateSystemDefaultDevice(){
			self._device = local_device
		} else { fatalError("Could not create metal device") }
		if let cq = _device.makeCommandQueue() {
			self._commandQueue = cq
		} else { fatalError("Could not create command queue") }
		self._preferences = Preferences.shared
		self._shaders = ShaderLibrary(device: self._device)
		self._descriptors = VertexDescriptorLibrary()
		self._renderDescriptors = RenderDescriptorLibrary(library: _shaders, vertexDescriptorLibrary: _descriptors, prefernces: _preferences )
		self._renderPipelineStates = RenderPipelineLibrary(device: _device, descriptorLibrary: _renderDescriptors)
	}
}
