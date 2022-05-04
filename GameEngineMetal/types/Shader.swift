import MetalKit


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
