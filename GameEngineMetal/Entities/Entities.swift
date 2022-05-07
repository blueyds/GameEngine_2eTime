//
//  MeshLibrary.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit


protocol Mesh {
	var vertexCount: Int! {get}
	var instanceCount: Int { get set }
	func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder)
}
// TODO: rename entities
class Entities {
	enum Types {
		case Triangle_Custom
		case Quad_Custom
		case Cube_Custom
	}
	private var _meshes: [Types:Mesh] = [:]
	private var _device: MTLDevice!
	
	init(device: MTLDevice!){
		self._device = device
		createDefaultMeshes()
	}
	private func createDefaultMeshes(){
		_meshes.updateValue(Triangle_CustomMesh(device: _device), forKey: .Triangle_Custom)
		_meshes.updateValue(Quad_CustomMesh(device: _device), forKey: .Quad_Custom)
		_meshes.updateValue(Cube_CustomMesh(device: _device), forKey: .Cube_Custom)
		
	}
	public func mesh(_ meshType: Types)->Mesh{
		_meshes[meshType]!
	}
	
}





