//
//  Types.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/23/22.
//

import simd

protocol sizeable{
	static func size( _ count: Int)-> Int
	static func stride(_ count: Int)-> Int
}

extension sizeable{
	static var size: Int {
		MemoryLayout<Self>.size
	}
	static var stride: Int {
		MemoryLayout<Self>.stride
	}
	static func size(_ count: Int) -> Int {
		MemoryLayout<Self>.size * count
	}
	static func stride(_ count: Int)-> Int {
		MemoryLayout<Self>.stride * count
	}
}

extension simd_float3: sizeable{}
extension simd_float4: sizeable {}
extension simd_float2: sizeable {}
extension Float: sizeable {}


struct Vertex: sizeable {
	var position: simd_float3
	var color: simd_float4
}

struct ModelConstants: sizeable {
	var modelMatrix = matrix_identity_float4x4
}

struct SceneConstants:sizeable {
	var viewMatrix = matrix_identity_float4x4
}
