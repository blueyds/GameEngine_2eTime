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
	static func size()-> Int {
		MemoryLayout<Self>.size
	}
	static func stride()-> Int {
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

struct Vertex: sizeable {
	var position: simd_float3
	var color: simd_float4
}
