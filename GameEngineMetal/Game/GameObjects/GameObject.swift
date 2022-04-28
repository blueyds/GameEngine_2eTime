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
	
	//var deltaPosition: Float = 0
	init(meshType: MeshLibrary.Types){
		mesh = Engine.shared.Mesh(meshType)
	}
	var time: Float = 0
	func update(deltaTime: Float){
		time += deltaTime
		
		self.scale = simd_float3(repeating: cos(time))
		
		updateModelConstants()
	}
	private func updateModelConstants(){
		modelConstants.modelMatrix = self.modelMatrix
	}
}

extension GameObject: Renderable {
	func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
		renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 1)
		renderCommandEncoder.setRenderPipelineState(Engine.shared.RenderState(.Basic))
		// send info to rendering commander
		renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
		renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
	}
}
