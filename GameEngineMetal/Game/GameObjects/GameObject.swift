//
//  GameObject.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit

class GameObject: Node {
	var modelConstants = ModelConstants()
	var mesh: Mesh!
	let engine: Engine
	
	//var deltaPosition: Float = 0
	init(meshType: MeshLibrary.Types){
		engine = Engine.shared
		mesh = engine.Mesh(meshType)
	}
	
	override func update(deltaTime: Float){
		
		updateModelConstants()

	}
	private func updateModelConstants(){
		modelConstants.modelMatrix = self.modelMatrix
	}
}

extension GameObject: Renderable {
	func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
		renderCommandEncoder.setRenderPipelineState(Engine.shared.RenderState(.Basic))
		renderCommandEncoder.setDepthStencilState(engine.DepthStencilStates(.Less))
		renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
		renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 2)
		renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
	}
}
