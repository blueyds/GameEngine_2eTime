//
//  SandboxScene.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//

import Foundation
import simd
class SandboxScene: GameScene {
    
    var pointer = Node()
    var cruiser = Node()
	var sun = Node()
	var triangle = Node()
	
	override func buildScene() {
		addMeshComponent(.Sphere, toChild: sun)
		if let mesh = sun.Mesh {
			mesh.setColor(simd_float4(0.5,0.5,0,1))
		}
		sun.setName("sun")
		sun.setPosition(simd_float3(1,1,1))
		sun.setScale(0.1)
		addChild(sun)
		addCameraComponent(toChild: pointer, cameraType: .Debug, zoom: 45, aspectRatio: 1, near: 0.1, far: 1000	)
		addChild(pointer)
		pointer.addComponent(DebugCameraInputComponent())
		
		addMeshComponent(.Cruiser, toChild: cruiser)
		
		if let mesh = cruiser.Mesh {
			mesh.setTexture(.Cruiser)
		}
		cruiser.addComponent(CruiserInputComponent())
		addChild(cruiser)
		addMeshComponent(.Triangle_Custom, toChild: triangle, instanceCount: 2)
		triangle.setName("Triangle")
		triangle.children[0].moveX(-1)
		triangle.children[1].moveX(1)
		print("children under triangle \(triangle.children.count)")
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
