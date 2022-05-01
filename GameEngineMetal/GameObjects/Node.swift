//
//  Node.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit

class Node{
	var position: simd_float3 = simd_float3(repeating: 0)
	var scale: simd_float3 = simd_float3(repeating: 1)
	var rotation: simd_float3 = simd_float3(repeating: 0)
	
	var modelMatrix : matrix_float4x4 {
		var matrix = matrix_identity_float4x4
		matrix.translate(direction: position)
		matrix.scale(axis: scale)
		matrix.rotate(angle: rotation.x, axis: .x)
		matrix.rotate(angle: rotation.y, axis: .y)
		matrix.rotate(angle: rotation.z, axis: .z)
		return matrix
		
	}
	var children: [Node] = []
	func addChild(_ child: Node){
		children.append(child)
	}
	func update(deltaTime: Float){
		for child in children {
			child.update(deltaTime: deltaTime)
		}
	}
	
	func render(renderCommandEncoder: MTLRenderCommandEncoder){
		for child in children {
			child.render(renderCommandEncoder: renderCommandEncoder)
		}
		if let renderable = self as? Renderable {
			renderable.doRender(renderCommandEncoder: renderCommandEncoder)
		}
	}
}
