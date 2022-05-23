//
//  MeshComponent.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/21/22.
//

import MetalKit
import GameplayKit

class MeshComponent: GKComponent {
	var modelConstants: [ModelConstants] = []
	var material = Material()
	var _textureType: TextureLibrary.Types = .None
	var mesh: Mesh!
	var renderState: RenderPipelineLibrary.Types
	var depthStencilStates = Engine.shared.DepthStencilStates(.Less)
	var samplerState = Engine.shared.SamplerState(.Linear)
	private var _modelConstantBuffer: MTLBuffer!
	
	init (meshType: Entities.Types) {
		mesh = Engine.shared.Mesh(meshType)
		modelConstants.append(ModelConstants())
		renderState = .Basic
		super.init()
	}
	init(meshType: Entities.Types, instanceCount: Int){
		mesh = Engine.shared.Mesh(meshType)
		mesh.setInstanceCount(instanceCount)
		renderState = .Instanced
		super.init()
		createModelConstants(instanceCount)
		createBuffers(instanceCount)
	}
	
	override func didAddToEntity(){
		if modelConstants.count != 1 {
			if let node = entity as? Node {
				for _ in 0..<modelConstants.count {
					node.addChild(Node())
				}
			}else {fatalError("entity is not a node.")}
		}
		
	}
	func createModelConstants(_ instanceCount: Int){
		for _ in 0..<instanceCount {
			modelConstants.append(ModelConstants())
		}
	}
	func createBuffers(_ instanceCount: Int){
		_modelConstantBuffer = Engine.shared.device.makeBuffer(length: ModelConstants.stride(instanceCount), options: [])
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	override func update(deltaTime: TimeInterval) {
		updateModelConstants()
		super.update(deltaTime: deltaTime)
	}
	
	
	private func updateModelConstants(){
		if let node = entity as? Node {
			if modelConstants.count == 1 {
				modelConstants[0].modelMatrix = node.modelMatrix
			}
			else {
				var pointer = _modelConstantBuffer.contents().bindMemory(to: ModelConstants.self, capacity: node.children.count)
				for child in node.children {
					pointer.pointee.modelMatrix = child.modelMatrix
					pointer = pointer.advanced(by: 1)
				}
			}
		}
	}
	
	func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
		renderCommandEncoder.setRenderPipelineState(Engine.shared.RenderState(renderState))
		renderCommandEncoder.setDepthStencilState(depthStencilStates)
		
		//Vertex Shader
		if modelConstants.count == 1 {
			renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 2)
		}else{
			renderCommandEncoder.setVertexBuffer(_modelConstantBuffer, offset: 0, index: 2)
		}
		
		
		//Fragment Shader
		renderCommandEncoder.setFragmentSamplerState(samplerState, index: 0)
		renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
		if(material.useTexture){
			renderCommandEncoder.setFragmentTexture(Engine.shared.Texture(_textureType), index: 0)
		}
		mesh.drawPrimitives(renderCommandEncoder)
	}
	
}


extension MeshComponent {
	public func setColor(_ color: simd_float4){
		self.material.color = color
		self.material.useMaterialColor = true
	}
	
	public func setTexture(_ textureType: TextureLibrary.Types){
		self.material.useTexture = true
		self.material.useMaterialColor = false
		self._textureType = textureType
	}
 }
