//
//  GameObject.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit

class GameObject: Node {
	var mesh: Mesh!
	init(meshType: MeshLibrary.Types){
		mesh = Engine.shared.Mesh(meshType)
	}
}

extension GameObject: Renderable {
	func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
		renderCommandEncoder.setRenderPipelineState(Engine.shared.RenderState(.Basic))
		// send info to rendering commander
		renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
		renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
	}
}
