//
//  Node.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit

class Node{
	func render(renderCommandEncoder: MTLRenderCommandEncoder){
		if let renderable = self as? Renderable {
			renderable.doRender(renderCommandEncoder: renderCommandEncoder)
		}
	}
}
