//
//  InstancedGameObject.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/1/22.
//

import MetalKit
import SwiftUI

/// <#Description#>
///
class InstancedGameObject: Node {
	var material = Material()
	internal var _nodes: [Node] = []
//	private var _modelConstants: [ModelConstants] = []
	private var _modelConstantBuffer: MTLBuffer!
	private var _mesh: Mesh!
	let engine: Engine
	
	
	init(meshType: MeshLibrary.Types, instanceCount: Int) {
//		super.init()
		engine = Engine.shared
		_mesh = engine.Mesh(meshType)
		_mesh.setInstanceCount(instanceCount)
		super.init()
		generateInstance(instanceCount)
		createBuffers(instanceCount)
	}
	
	func generateInstance(_ instanceCount: Int){
		for _ in 0..<instanceCount {
			_nodes.append(Node())
//			_modelConstants.append(ModelConstants())
		}
	}
	
	func createBuffers(_ instanceCount: Int){
		_modelConstantBuffer = engine.device.makeBuffer(length: ModelConstants.stride(instanceCount), options: [])
	}
	private func updateModelConstantsBuffer(){
		var pointer = _modelConstantBuffer.contents().bindMemory(to: ModelConstants.self, capacity: _nodes.count)
		for node in _nodes {
			pointer.pointee.modelMatrix = matrix_multiply(self.modelMatrix, node.modelMatrix)
			pointer = pointer.advanced(by: 1)
		}
	}
	
	override func update(deltaTime: Float) {
		updateModelConstantsBuffer()
		super.update(deltaTime: deltaTime)
	}
	
}

extension InstancedGameObject: Renderable {
	func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
		renderCommandEncoder.setRenderPipelineState(Engine.shared.RenderState(.Instanced))
		renderCommandEncoder.setDepthStencilState(engine.DepthStencilStates(.Less))
		// Vertex shader
		renderCommandEncoder.setVertexBuffer(_modelConstantBuffer, offset: 0, index: 2)
		
		//fragment shader
		renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
		// draw function
		_mesh.drawPrimitives(renderCommandEncoder)
	}
	
	
}

// Material property
extension InstancedGameObject {
	public func setColor(_ color: simd_float4){
		material.color = color
		material.useMaterialColor = true
	}
}
