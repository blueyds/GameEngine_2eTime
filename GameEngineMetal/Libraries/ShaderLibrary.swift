//
//  ShaderLibrary.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/23/22.
//

import MetalKit


enum VertexShaderTypes{
	case Basic
}

enum FragmentShaderTypes{
	case Basic
}
class ShaderLibrary {
	var library: MTLLibrary!
	let device: MTLDevice!
	private var vertexShaders: [VertexShaderTypes: Shader]=[:]
	private var fragmentShaders: [FragmentShaderTypes: Shader]=[:]
	
	init (devive: MTLDevice){
		self.device = devive
		if let lib = self.device.makeDefaultLibrary(){
			library = lib
		} else { fatalError("Could not create library")}
		createDefaultShaders()
	}
	func createDefaultShaders(){
		vertexShaders.updateValue(
			Shader(name: "Basic Vertex Shader",
				functionName: "basic_vertex_shader",
				  library: library),
			forKey: .Basic)
		fragmentShaders.updateValue(
			Shader(name: "Basic Fragment Shader",
				functionName: "basic_fragment_shader",
				  library: library),
			forKey: .Basic)
	}
	func Vertex(_ vertexShaderType: VertexShaderTypes)-> MTLFunction{
		vertexShaders[vertexShaderType]!.function
	}
	func Fragment(_ fragmentShaderType: FragmentShaderTypes) -> MTLFunction{
		fragmentShaders[fragmentShaderType]!.function
	}
}

class Shader {
	var name: String
	var functionName: String
	var function: MTLFunction
	init(name: String, functionName: String, library: MTLLibrary!){
		self.name = name
		self.functionName = functionName
		self.function = library.makeFunction(name: functionName)!
	}
}


