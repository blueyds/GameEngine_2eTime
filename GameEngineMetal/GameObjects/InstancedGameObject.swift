//
//  InstancedGameObject.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/1/22.
//

import MetalKit
import SwiftUI

/// <#Description#>
///
class InstancedGameObject: Node {
    private var _mesh: Mesh!
    
    var material = Material()
    
    internal var _nodes: [Node] = []    
    private var _modelConstantBuffer: MTLBuffer!
    
	init(meshType: Entities.Types, instanceCount: Int) {
        super.init(name: "Instanced Game Object")
		_mesh = Engine.shared.Mesh(meshType)
		_mesh.setInstanceCount(instanceCount)
        generateInstances(instanceCount)
        createBuffers(instanceCount)
    }
    
    func generateInstances(_ instanceCount: Int){
        for _ in 0..<instanceCount {
            _nodes.append(Node())
        }
    }
    
    func createBuffers(_ instanceCount: Int) {
		_modelConstantBuffer = Engine.shared.device.makeBuffer(length: ModelConstants.stride(instanceCount), options: [])
    }
    
    private func updateModelConstantsBuffer() {
        var pointer = _modelConstantBuffer.contents().bindMemory(to: ModelConstants.self, capacity: _nodes.count)
        for node in _nodes {
            pointer.pointee.modelMatrix = matrix_multiply(self.modelMatrix, node.modelMatrix)
            pointer = pointer.advanced(by: 1)
        }
    }

    override func update() {
        updateModelConstantsBuffer()
        super.update()
    }
}

extension InstancedGameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
		renderCommandEncoder.setRenderPipelineState(Engine.shared.RenderState(.Instanced))
		renderCommandEncoder.setDepthStencilState(Engine.shared.DepthStencilStates(.Less))
        
        //Vertex Shader
        renderCommandEncoder.setVertexBuffer(_modelConstantBuffer, offset: 0, index: 2)
        
        //Fragment Shader
        renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
        
        _mesh.drawPrimitives(renderCommandEncoder)
    }
}

//Material Properties
extension InstancedGameObject {
    public func setColor(_ color: simd_float4){
        self.material.color = color
        self.material.useMaterialColor = true
    }
}

