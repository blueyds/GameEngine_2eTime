//
//  Renderable.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit
protocol Renderable{
	func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder)
}
