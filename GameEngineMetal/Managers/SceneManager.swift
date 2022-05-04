//
//  SceneManager.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import Foundation
import Metal

class SceneManager {
	enum Types{
		case Sandbox
	}
	static var shared = SceneManager()
	private var _currentScene: GameScene!
	
	private init(){

	}
	
	func setScene(_ sceneType: Types){
		switch sceneType {
		case .Sandbox:
			_currentScene = SandboxScene()
		}
	}
	
	func updateScene(deltaTime: Float){
		//GameTime.UpdateTime(deltaTime)
		_currentScene.updateCameras()
		
		_currentScene.update()
	}
	
	func renderScene(renderCommandEncoder: MTLRenderCommandEncoder){
		_currentScene.render(renderCommandEncoder: renderCommandEncoder)
	}
	
}
