//
//  Scene.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit

class GameScene: Node {
	private var _cameraManager = CameraManager()
	private var _lightManager = LightManager()
	private var _sceneConstants = SceneConstants()
	// var camera = DebugCamera()
	init(){
		super.init(name: "Scene")
		buildScene()
	}
	
	func buildScene(){	}
	
	func addCamera(_ camera: Camera, _ isCurrentCamera: Bool = true){
		_cameraManager.registerCamera(camera: camera)
		if(isCurrentCamera){
			_cameraManager.setCamera(camera.cameraType)
		}
	}
	
	func addLight(_ lightObject: LightObject) {
		addChild(lightObject)
		_lightManager.addLightObject(lightObject)
	}
	
	func updateSceneConstants(){
		_sceneConstants.viewMatrix = _cameraManager.currentCamera.viewMatrix
		_sceneConstants.projectionMatrix = _cameraManager.currentCamera.projectionMatrix
		_sceneConstants.totalGameTime = GameTime.TotalGameTime 
	}
	func updateCameras(){
		_cameraManager.update()
	}
	override func update() {
		updateSceneConstants()
		super.update()
	}
	
	override func render(renderCommandEncoder: MTLRenderCommandEncoder) {
		renderCommandEncoder.setVertexBytes(&_sceneConstants, length: SceneConstants.stride, index: 1)
		_lightManager.setLightData(renderCommandEncoder)
		super.render(renderCommandEncoder: renderCommandEncoder)
	}
}
