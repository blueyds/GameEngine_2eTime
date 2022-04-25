import MetalKit

class RenderDescriptorLibrary{
	enum Types{
		case Basic
	}
	private let library: ShaderLibrary
	private let vertexDescriptor: VertexDescriptorLibrary
	private let preferences: Preferences
	
	private var _descriptors: [Types: RenderPipelineDescriptor]=[:]
	init(library: ShaderLibrary, vertexDescriptorLibrary: VertexDescriptorLibrary, preferences: Preferences){
		self.library = library
		self.vertexDescriptor = vertexDescriptorLibrary
		createDefaultDescriptors()
	}
	func createDefaultDescriptors(){
		createDescriptor(
			name: "Basic Render Descriptor",
			pixelFormat: .bg8unorm,
			vertexFunction: .Basic,
			fragmentFunction: .Basic,
			vertexDescriptor: .Basic,
			atKey: .Basic))
	}
	func createDescriptor(
		name: String
		pixelFormat: MTLPixelFormat, 
		vertexFunction: ShaderLibrary.VertexFunctionTypes,
		fragmentFunction: ShaderLibrary.FragmentFunctionTypes,
		vertexDescriptor: VertexDescriptorLibrary.VertexDescriptorTypes,
		atKey: Types)	{
		var rpd = RenderPipelineDescriptor()
		rpd.name = name
		rpd.colorAttachments[0].pixelFormat = pixelFormat
		rpd.vertexFunction = library.Vertex(vertexFunction)
		rpd.fragmentFunction = library.Fragment(fragmentFunction)
		rpd.vertexDescriptor = vertexDescriptor.descriptor(vertexDescriptor)
		_descriptors.updateValue(rpd, atKey: atKey)
	}
}

class RenderPipelineDescriptor{
	var name : String = "" 
	var descriptor = MTLRenderPipelineDescriptor()
}
