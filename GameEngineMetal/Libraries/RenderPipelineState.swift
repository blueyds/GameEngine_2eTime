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
		_renderPipelineStates[renderStateType].state
	}
	
	func createDefaultStates(){
		createSimpleState("Basic Render State", rendorDescriptorType: .Basic, atKey: .Basic)
	}
	func createSimpleState(_ name: String,	
	renderDescriptorType: RendorDescriptorLibrary.RenderDescriptorType, 
		atKey: Types) {
		do{
			rps = try device.makeRenderPipelineState(
			descriptor: descriptor.descriptor(renderDescriptorType))
			var renderState = RenderPipelineState(name: name, state: rps)
			_renderPipelineStates.updateValue(renderState, atKey: atKey)
		}catch let error as NSError {
			print("ERROR Creating Render Pipeline State for \(name) error = \(error)")
		}
	}
}
class RenderPipelineState{
	var name: String = ""
	var state: MTLRenderPipelineState = MTLRenderPipelineState()
}