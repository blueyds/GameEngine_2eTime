import MetalKit

class RenderPipelineLibrary {
	enum Types{
		case Basic
	}
	private let device: MTLDevice!
	private let descriptor: RenderDescriptorLibrary
	
	private var _renderPipelineStates: [Types: RenderPipelineState] = [:]
	
	init(device: MTLDevice!, descriptorLibrary: RenderDescriptorLibrary){
		self.device = device
		self.descriptor = descriptorLibrary
		createDefaultStates()
	}
	func renderState(_ renderStateType: Types)-> MTLRenderPipelineState{
		_renderPipelineStates[renderStateType]!.state
	}
	
	func createDefaultStates(){
		createSimpleState("Basic Render State", renderDescriptorType: RenderDescriptorLibrary.Types.Basic, forKey: Types.Basic)
	}
	func createSimpleState(_ name: String,	
						   renderDescriptorType: RenderDescriptorLibrary.Types,
						   forKey: Types) {
		do{
			let rps = try device.makeRenderPipelineState(
			descriptor: descriptor.descriptor(renderDescriptorType))
			let renderState = RenderPipelineState(name: name, state: rps)
			_renderPipelineStates.updateValue(renderState, forKey: forKey)
		}catch let error as NSError {
			print("ERROR Creating Render Pipeline State for \(name) error = \(error)")
		}
	}
}
class RenderPipelineState{
	var name: String
	var state: MTLRenderPipelineState
	init (name: String, state: MTLRenderPipelineState){
		self.name = name
		self.state = state
	}
}
