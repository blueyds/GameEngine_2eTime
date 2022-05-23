//
//  CameraManager.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/29/22.
//

import Foundation
import GameplayKit

class CameraManager {
	private var _cameras: GKComponentSystem<CameraComponent>
	
	var currentCamera: Camera!
	
	func registerCamera(camera: Camera){
		self._cameras.updateValue(camera, forKey: camera.cameraType)
	}
	func setCamera(_ cameraType: CameraTypes){
		self.currentCamera = _cameras[cameraType]
	}
	internal func update(){
		for camera in _cameras.values {
			camera.update()
		}
	}
}
