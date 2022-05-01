//
//  Scene.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit

class GameScene: Node {
	var cameraManager = CameraManager()
	var sceneConstants = SceneConstants()
	// var camera = DebugCamera()
	init(){
		super.init(name: "Scene")
		buildScene()
	}
	
	func buildScene(){	}
	
	func addCamera(_ camera: Camera, _ isCurrentCamera: Bool = true){
		cameraManager.registerCamera(camera: camera)
		if(isCurrentCamera){
			cameraManager.setCamera(camera.cameraType)
		}
	}
	
	func updateSceneConstants(){
		sceneConstants.viewMatrix = cameraManager.currentCamera.viewMatrix
		sceneConstants.projectionMatrix = cameraManager.currentCamera.projectionMatrix
	}
	func updateCameras(deltaTime: Float){
		cameraManager.update(deltaTime: deltaTime)
	}
	override func update(deltaTime: Float) {
		
		
		updateSceneConstants()
		super.update(deltaTime: deltaTime)
	}
	
	override func render(renderCommandEncoder: MTLRenderCommandEncoder) {
		renderCommandEncoder.setVertexBytes(&sceneConstants, length: SceneConstants.stride, index: 1)
		super.render(renderCommandEncoder: renderCommandEncoder)
	}
}
