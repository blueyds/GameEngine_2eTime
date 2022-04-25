import MetalKit

class RenderDescriptorLibrary{
	enum Types{
		case Basic
	}
	private let library: ShaderLibrary
	private let vertexDescriptor: VertexDescriptorLibrary
	private let preferences: Preferences
	
	private var _descriptors: [Types: RenderPipelineDescriptor]=[:]
	
	
	func descriptor(_ renderDescriptorType: Types)-> MTLRenderPipelineDescriptor{
		_descriptors[renderDescriptorType]!.descriptor
	}
	init(library: ShaderLibrary, vertexDescriptorLibrary: VertexDescriptorLibrary, preferences: Preferences){
		self.library = library
		self.vertexDescriptor = vertexDescriptorLibrary
		createDefaultDescriptors()
	}
	func createDefaultDescriptors(){
		createDescriptor(
			name: "Basic Render Descriptor",
			pixelFormat: preferences.mainPixelFormat,
			vertexFunction: ShaderLibrary.VertexShaderTypes.Basic,
			fragmentFunction: ShaderLibrary.FragmentShaderTypes.Basic,
			vertexDescriptorType: VertexDescriptorLibrary.Types.Basic,
			forKey: .Basic)
		
	}
	
	func createDescriptor(
		name: String,
		pixelFormat: MTLPixelFormat, 
		vertexFunction: ShaderLibrary.VertexShaderTypes,
		fragmentFunction: ShaderLibrary.FragmentShaderTypes,
		vertexDescriptorType: VertexDescriptorLibrary.Types,
		forKey: Types)	{
			let rpd = RenderPipelineDescriptor()
			rpd.name = name
			rpd.descriptor.colorAttachments[0].pixelFormat = pixelFormat
			rpd.descriptor.vertexFunction = library.Vertex(vertexFunction)
			rpd.descriptor.fragmentFunction = library.Fragment(fragmentFunction)
			rpd.descriptor.vertexDescriptor = vertexDescriptor.descriptor(vertexDescriptorType)
			_descriptors.updateValue(rpd, forKey: forKey)
	}
}

class RenderPipelineDescriptor{
	var name : String = "" 
	var descriptor = MTLRenderPipelineDescriptor()
}
