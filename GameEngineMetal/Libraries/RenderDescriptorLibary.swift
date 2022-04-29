import MetalKit

class RenderDescriptorLibrary{
	enum Types{
		case Basic
	}
	private let _library: ShaderLibrary
	private let _vertexDescriptor: VertexDescriptorLibrary
	private let _preferences: Preferences
	
	private var _descriptors: [Types: RenderPipelineDescriptor]=[:]
	
	
	func descriptor(_ renderDescriptorType: Types)-> MTLRenderPipelineDescriptor{
		_descriptors[renderDescriptorType]!.descriptor
	}
	init(library: ShaderLibrary, vertexDescriptorLibrary: VertexDescriptorLibrary, preferences: Preferences){
		self._library = library
		self._vertexDescriptor = vertexDescriptorLibrary
		self._preferences = preferences
		createDefaultDescriptors()
	}
	private func createDefaultDescriptors(){
		createDescriptor(
			name: "Basic Render Descriptor",
			pixelFormat: _preferences.mainPixelFormat,
			depthPixelFormat: _preferences.mainDepthPixelFormat,
			vertexFunction: ShaderLibrary.VertexShaderTypes.Basic,
			fragmentFunction: ShaderLibrary.FragmentShaderTypes.Basic,
			vertexDescriptorType: VertexDescriptorLibrary.Types.Basic,
			forKey: .Basic)
		
	}
	
	func createDescriptor(
		name: String,
		pixelFormat: MTLPixelFormat,
		depthPixelFormat: MTLPixelFormat,
		vertexFunction: ShaderLibrary.VertexShaderTypes,
		fragmentFunction: ShaderLibrary.FragmentShaderTypes,
		vertexDescriptorType: VertexDescriptorLibrary.Types,
		forKey: Types)	{
			let rpd = RenderPipelineDescriptor()
			rpd.name = name
			rpd.descriptor.colorAttachments[0].pixelFormat = pixelFormat
			rpd.descriptor.depthAttachmentPixelFormat = depthPixelFormat
			rpd.descriptor.vertexFunction = _library.Vertex(vertexFunction)
			rpd.descriptor.fragmentFunction = _library.Fragment(fragmentFunction)
			rpd.descriptor.vertexDescriptor = _vertexDescriptor.descriptor(vertexDescriptorType)
			_descriptors.updateValue(rpd, forKey: forKey)
	}
}

class RenderPipelineDescriptor{
	var name : String = "" 
	var descriptor: MTLRenderPipelineDescriptor! = MTLRenderPipelineDescriptor()
}
