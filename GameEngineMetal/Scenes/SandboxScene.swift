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
	var leftSun = Node()
	var middleSun = Node()
	var rightSun = Node()
	
	
	override func buildScene() {
		pointer.setPosition(simd_float3(0,0,6))
		addCameraComponent(toChild: pointer, cameraType: .Debug, zoom: 45, aspectRatio: 1, near: 0.1, far: 1000	)
		pointer.addComponent(DebugCameraInputComponent())
		addChild(pointer)
		
		
		leftSun.setPosition(simd_float3(-2,3,1))
		addMeshComponent(.Sphere, toChild: leftSun)
		if let mesh = leftSun.component(ofType: MeshComponent.self) {
			mesh.setMaterialIsLit(false)
			mesh.setMaterialColor(simd_float4(1,0,0,1))
		}
		addLightComponent(toChild: leftSun)
		if let light =  leftSun.component(ofType: LightComponent.self){
			light.setLightColor(simd_float3(1,0,0))
		}
		leftSun.setName("Left Sun")
		leftSun.setScale(0.5)
		leftSun.addComponent(SunInputComponent(toggleKey: .a))
		addChild(leftSun)
		
		middleSun.setPosition(simd_float3(0,3,0))
		addMeshComponent(.Sphere, toChild: middleSun)
		if let mesh = middleSun.component(ofType: MeshComponent.self) {
			mesh.setMaterialIsLit(false)
			mesh.setMaterialColor(simd_float4(1,1,1,1))
		}
		addLightComponent(toChild: middleSun)
		if let light =  middleSun.component(ofType: LightComponent.self){
			light.setLightColor(simd_float3(1,1,1))
		}
		middleSun.setName("Middle Sun")
		middleSun.setScale(0.8)
		middleSun.addComponent(SunInputComponent(toggleKey: .s))
		addChild(middleSun)
		
		rightSun.setPosition(simd_float3(2,3,-1))
		addMeshComponent(.Sphere, toChild: rightSun)
		if let mesh = rightSun.component(ofType: MeshComponent.self) {
			mesh.setMaterialIsLit(false)
			mesh.setMaterialColor(simd_float4(0,0,1,1))
		}
		addLightComponent(toChild: rightSun)
		if let light =  rightSun.component(ofType: LightComponent.self){
			light.setLightColor(simd_float3(0,0,1))
		}
		rightSun.setName("Right Sun")
		rightSun.setScale(0.5)
		
		rightSun.addComponent(SunInputComponent(toggleKey: .d))
		addChild(rightSun)
								
		addMeshComponent(.Cruiser, toChild: cruiser)
		if let mesh = cruiser.component(ofType: MeshComponent.self) {
			mesh.setTexture(.Cruiser)
//			mesh.setMaterialAmbient(0.01)
		}
		cruiser.setName("Cruiser")
		cruiser.addComponent(CruiserInputComponent())
		addChild(cruiser)
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
