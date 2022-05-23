//
//  GameObject.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit

class GameObject: Node {
    
    var modelConstants = ModelConstants()
    private var material = Material()
	private var _textureType: TextureLibrary.Types = .None
    var mesh: Mesh!
    
	init(meshType: Entities.Types) {
		mesh = Engine.shared.Mesh(meshType)
		super.init()
    }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
//	override func doUpdate(deltaTime: TimeInterval){
//        updateModelConstants()
//    }
//
    private func updateModelConstants(){
        modelConstants.modelMatrix = self.modelMatrix
    }
    
}

//extension GameObject: Renderable{
//    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
//		renderCommandEncoder.setRenderPipelineState(Engine.shared.RenderState(.Basic))
//		renderCommandEncoder.setDepthStencilState(Engine.shared.DepthStencilStates(.Less))
//
//        //Vertex Shader
//        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 2)
//
//        //Fragment Shader
//		renderCommandEncoder.setFragmentSamplerState(Engine.shared.SamplerState(.Linear), index: 0)
//		renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
//		if(material.useTexture){
//			renderCommandEncoder.setFragmentTexture(Engine.shared.Texture(_textureType), index: 0)
//		}
//        mesh.drawPrimitives(renderCommandEncoder)
//    }
//}

//Material Properties
//extension GameObject {
//    public func setColor(_ color: simd_float4){
//        self.material.color = color
//        self.material.useMaterialColor = true
//    }
//
//	public func setTexture(_ textureType: TextureLibrary.Types){
//		self.material.useTexture = true
//		self.material.useMaterialColor = false
//		self._textureType = textureType
//	}
// }

