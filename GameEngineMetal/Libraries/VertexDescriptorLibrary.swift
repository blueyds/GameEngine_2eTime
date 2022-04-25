//
//  VertexDescriptorLibrary.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/23/22.
//

import MetalKit


class VertexDescriptorLibrary {
	enum VertexDescriptorTypes {
		case Basic
	}

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
		// position attributes
		basic.addAttributes(position: 0, format: .float3, offset: 0, bufferIndex: 0)
		// color attributes
		basic.addAttributes(position: 1, format: .float4, offset: simd_float3.size, bufferIndez: 0)
		// layout
		basic.addLayout(stride = Vertex.stride())
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
	init (name: String){
		self.name = name
		vertexDescriptor = MTLVertexDescriptor()
	}
	func addAttribute(position: Int, format: MTLVertexFormat, offset: Int, bufferIndex: Int){
		if vertexDescriptor.attributes.count > position {
			print("could not load attribute due to position out of bounds")
			return
		}
		vertexDescriptor.attributes[position].format = format
		vertexDescriptor.attributes[position].offset = offset
		vertexDescriptor.attributes[position].bufferIndex = bufferIndex
	}
	func addLayout(stride: Int, stepFunction: MTLVertexStepFunction = .perVertex, stepRate: Int = 1){
		vertexDescriptor.layouts[0].stride = stride
		vertexDescriptor.layouts[0].stepFunction = stepFunction
		vertexDescriptor.layouts[0].stepRate = stepRate
	}
}
