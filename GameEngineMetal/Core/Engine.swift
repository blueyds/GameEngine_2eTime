//
//  Engine.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/23/22.
//

import MetalKit

final class Engine {
	static let shared: Engine = Engine()
	let device: MTLDevice!
	let commandQueue: MTLCommandQueue!
	var screenSize = simd_float2(repeating: 0)
	private let _shaders: ShaderLibrary
	private let _descriptors: VertexDescriptorLibrary
	private let _renderDescriptors: RenderDescriptorLibrary
	private let _renderStates: RenderPipelineLibrary
	private let _meshes: MeshLibrary
	private let _preferences: Preferences
	
	
	func Vertex(_ vertexFunctionType: ShaderLibrary.VertexShaderTypes)-> MTLFunction{
		_shaders.Vertex(vertexFunctionType)
	}
	func Fragment(_ fragmentFunctionType: ShaderLibrary.FragmentShaderTypes)-> MTLFunction{
		_shaders.Fragment(fragmentFunctionType)
	}
	func Descriptor(_ vertexDescriptorType: VertexDescriptorLibrary.Types)->MTLVertexDescriptor{
		_descriptors.descriptor(vertexDescriptorType)
	}
	func RenderDescriptor(_ renderDescriptionType: RenderDescriptorLibrary.Types)-> MTLRenderPipelineDescriptor{
		_renderDescriptors.descriptor(renderDescriptionType)
	}
	func RenderState(_ renderPipelineStateType: RenderPipelineLibrary.Types)-> MTLRenderPipelineState {
		_renderStates.renderState(renderPipelineStateType)
	}
	func Mesh(_ meshType: MeshLibrary.Types)->Mesh {
		_meshes.mesh(meshType)
	}
	
	private init () {
		if let local_device = MTLCreateSystemDefaultDevice(){
			self.device = local_device
		} else { fatalError("Could not create metal device") }
		if let cq = device.makeCommandQueue() {
			self.commandQueue = cq
		} else { fatalError("Could not create command queue") }
		self._preferences = Preferences.shared
		self._shaders = ShaderLibrary(device: self.device)
		self._descriptors = VertexDescriptorLibrary()
		self._renderDescriptors = RenderDescriptorLibrary(library: _shaders, vertexDescriptorLibrary: _descriptors, preferences: _preferences )
		self._renderStates = RenderPipelineLibrary(device: device, descriptorLibrary: _renderDescriptors)
		self._meshes = MeshLibrary(device: device)
	}
}
