//
//  SandboxScene.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import GameEngine

class SandboxScene: GameScene {
    

	override func buildScene() {
		var pointer = Pointer(parent: self)
		var rightSun = Sun(x: -1, y: 1, z: 0, r: 1, g: 0, b: 0, parent: self)
		
		pointer.setPosition(x: 0, y: 0, z: 5)
		addCameraComponent(toChild: pointer, cameraType: .Debug, fov: 45, aspectRatio: 1, near: 0.1, far: 1000	)
		addChild(pointer)
		
		addChild(rightSun)

		addChild(Sun(x: 0, y: 1, z: 0, r: 1, g: 1, b: 1, parent: self))


		addChild(Sun(x: 1, y: 1, z: 0, r: 0, g: 0, b: 1, parent: self))

		addChild(Cruiser(parent: self))
    }
    
//
//	func doUpdate(_ deltaTime: Float) {
//
//		if Mouse.IsMouseButtonPressed(button: .left){
//			cruiser.rotateX(Mouse.GetDY() * deltaTime)
//			cruiser.rotateY(Mouse.GetDX() * deltaTime)
//		}
//
//    }

 }
