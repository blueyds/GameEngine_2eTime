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
	// private component systems
	
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
			if let node = camera.entity as? Node {
				_sceneConstants.cameraPosition = node.getPosition()
			}
		}
		_sceneConstants.totalGameTime = Float(GameTime.TotalGameTime)
	
	}
	
	func updateScene(deltaTime: TimeInterval) {
		updateSceneConstants()
		updateChildrenMatrix()
		_meshManager.updateAll(deltaTime: deltaTime)
		_lightManager.updateAll(deltaTime: deltaTime)
		
		doUpdate(deltaTime: deltaTime)
		children.forEach(){ $0.update(deltaTime: deltaTime)	}
		_meshManager.updateAll(deltaTime: deltaTime)
	}
	// doUPdate can be overriden by  subclass to provide a hook to update special component systems before running mesh updater
	func doUpdate(deltaTime: TimeInterval){
		
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
		let component = MeshComponent(meshType: meshType)
		toChild.addComponent(component)
		_meshManager.addComponent(foundIn: toChild)
	}
	func addMeshComponent(_ meshType: Entities.Types, toChild: Node, instanceCount: Int){
		let component = MeshComponent(meshType: meshType, instanceCount: instanceCount)
		toChild.addComponent(component)
		_meshManager.addComponent(foundIn: toChild)
	}
	func removeMeshComponent(fromChild: Node){
		fromChild.removeComponent(ofType: MeshComponent.self)
		_meshManager.removeComponent(foundIn: fromChild)
	}
}
// light extensions for the scene
extension GameScene {
	func addLightComponent(toChild: Node){
		let component = LightComponent()
		toChild.addComponent(component)
		_lightManager.addComponent(foundIn: toChild)
	}
	// MARK: todo may need to remove from the lightmanager
	func removeLightComponent(fromChild: Node){
		fromChild.removeComponent(ofType: LightComponent.self)
		_lightManager.removeComponent(foundIn: fromChild)
	}
}

// camera extensions for the scene
extension GameScene {
	func addCameraComponent(toChild: Node,cameraType: CameraComponent.Types, zoom: Float, aspectRatio: Float, near: Float, far: Float){
		let component = CameraComponent(cameraType: cameraType, zoom: zoom, aspectRatio: aspectRatio, near: near, far: far)
		toChild.addComponent(component)
		if _camera != nil {
			if let node = _camera?.entity as? Node {
				removeCameraComponent(fromChild: node)
			}
		}
		_camera = toChild.component(ofType: CameraComponent.self)
	}
	func removeCameraComponent(fromChild: Node) {
		fromChild.removeComponent(ofType: CameraComponent.self)
		_camera = nil
	}
}


