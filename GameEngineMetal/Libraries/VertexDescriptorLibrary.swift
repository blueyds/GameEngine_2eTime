//
//  VertexDescriptorLibrary.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/23/22.
//

import MetalKit

enum VertexDescriptorTypes {
	case Basic
}

class VertexDescriptorLibrary {
	
	private var vertexDescriptors: [VertexDescriptorTypes: VertexDescriptor] = [:]
	init () {
		createDefaultVertexDescriptors()
	}
	private func createDefaultVertexDescriptors(){
		createBasic()
	}
	func descriptor(_ vertexDescriptorType: VertexDescriptorTypes) -> MTLVertexDescriptor {
		vertexDescriptors[vertexDescriptorType]!.vertexDescriptor
	}
	private func createBasic(){
		let basic = MTLVertexDescriptor()
		
		// position
		basic.attributes[0].format = .float3
		basic.attributes[0].bufferIndex = 0
		basic.attributes[0].offset = 0
		
		// color
		basic.attributes[1].format = .float4
		basic.attributes[1].bufferIndex = 0
		basic.attributes[1].offset = simd_float3.size()
		
		basic.layouts[0].stride = Vertex.stride()
		vertexDescriptors.updateValue(
			VertexDescriptor(name: "Basic Vertex Descriptor",
							 vertexDescriptor: basic), forKey: .Basic)
	}
	
}

class VertexDescriptor {
	var name: String
	var vertexDescriptor: MTLVertexDescriptor
	init ( name: String, vertexDescriptor: MTLVertexDescriptor){
		self.name = name
		self.vertexDescriptor = vertexDescriptor
	}
}
