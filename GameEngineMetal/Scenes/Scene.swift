//
//  Scene.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import MetalKit
import GameplayKit

class GameScene: Node {
	
	var _meshManager = MeshManager()
	var _lightManager = LightManager()
	var _camera: CameraComponent?
	private var _sceneConstants = SceneConstants()
	// var camera = DebugCamera()
	init(){
		super.init(name: "Scene")
		buildScene()
		print(self)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func buildScene(){	}
	
	func updateSceneConstants(){
		if let camera = _camera {
			_sceneConstants.viewMatrix = camera.viewMatrix
			_sceneConstants.projectionMatrix = camera.projectionMatrix
		}
		_sceneConstants.totalGameTime = Float(GameTime.TotalGameTime)
	
	}
	
	func updateScene(deltaTime: TimeInterval) {
		updateSceneConstants()
		updateChildrenMatrix()
		updateAll(deltaTime: deltaTime)
		_meshManager.updateAll(deltaTime: deltaTime)
		
	}
	func updateAll(deltaTime: TimeInterval) {
		for node in children {
			node.update(deltaTime: deltaTime)
		}
	}
	
	func render(renderCommandEncoder: MTLRenderCommandEncoder) {
		
		renderCommandEncoder.setVertexBytes(&_sceneConstants, length: SceneConstants.stride, index: 1)
		_lightManager.setLightData(renderCommandEncoder)
		_meshManager.renderAll(rce: renderCommandEncoder)
	}
}
// mesh extensions for the scene
extension GameScene {
	func addMeshComponent(_ meshType: Entities.Types, toChild: Node){
		toChild.addMesh(meshType)
		_meshManager.addComponent(foundIn: toChild)
	}
	func addMeshComponent(_ meshType: Entities.Types, toChild: Node, instanceCount: Int){
		toChild.addMesh(meshType, count: instanceCount)
		_meshManager.addComponent(foundIn: toChild)
	}
	func removeMeshComponent(fromChild: Node){
		fromChild.removeMesh()
		_meshManager.removeComponent(foundIn: fromChild)
	}
}
// light extensions for the scene
extension GameScene {
	func addLightComponent(toChild: Node){
		toChild.addLight()
		_lightManager.addComponent(foundIn: toChild)
	}
	// MARK: todo may need to remove from the lightmanager
	func removeLightComponent(toChild: Node){
		toChild.removeLIght()
		_lightManager.removeComponent(foundIn: toChild)
	}
}

// camera extensions for the scene
extension GameScene {
	func addCameraComponent(toChild: Node,cameraType: CameraComponent.Types, zoom: Float, aspectRatio: Float, near: Float, far: Float){
		toChild.addCamera(cameraType, zoom: zoom, aspectRatio: aspectRatio, near: near, far: far)
		_camera = toChild.component(ofType: CameraComponent.self)
	}
	func removeCameraComponent(fromChild: Node) {
		fromChild.removeCamera()
		_camera = nil
	}
}


