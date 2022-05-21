//
//  Sun.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/21/22.
//

import simd

class Sun: LightObject {
	init() {
		super.init(meshType: .Sphere, name: "Sun")
		setColor(simd_float4(0.5, 0.5, 0, 1.0))
		setScale(0.3)
	}
}
