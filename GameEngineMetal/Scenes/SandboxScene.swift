//
//  SandboxScene.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/28/22.
//



class SandboxScene: GameScene {
    
	var pointer = Node(name: "Pointer")
    var cruiser = Node(name: "Cruiser")
	var leftSun = Node(name: "Left Sun")
	var middleSun = Node(name: "Middle Sun")
	var rightSun = Node(name: "Right Sun")
	
	
	override func buildScene() {
		pointer.setPosition(x: 0, y: 0, z: 6)
		addCameraComponent(toChild: pointer, cameraType: .Debug, fov: 45, aspectRatio: 1, near: 0.1, far: 1000	)
		pointer.addComponent(DebugCameraInputComponent())
		addChild(pointer)
		
		
		leftSun.setPosition(x: -1, y: 1, z: 0)
		addMeshComponent(.Sphere, toChild: leftSun)
		if let mesh = leftSun.component(ofType: MeshComponent.self) {
			mesh.setMaterialIsLit(false)
			mesh.setMaterialColor(r: 1, g: 0, b: 0)
		}
		addLightComponent(toChild: leftSun)
		if let light =  leftSun.component(ofType: LightComponent.self){
			light.setLightColor(r: 1, g: 0, b: 0)
		}
		leftSun.setScale(0.2)
		leftSun.addComponent(SunInputComponent(toggleKey: .a))
		addChild(leftSun)
		
		middleSun.setPosition(x: 0, y: 1, z: 0)
		addMeshComponent(.Sphere, toChild: middleSun)
		if let mesh = middleSun.component(ofType: MeshComponent.self) {
			mesh.setMaterialIsLit(false)
			mesh.setMaterialColor(r: 1, g: 1, b: 1)
		}
		addLightComponent(toChild: middleSun)
		if let light =  middleSun.component(ofType: LightComponent.self){
			light.setLightColor(r: 1, g: 1, b: 1)
		}
		middleSun.setScale(0.2)
		middleSun.addComponent(SunInputComponent(toggleKey: .s))
		addChild(middleSun)
		
		rightSun.setPosition(x: 1, y: 1, z: 0)
		addMeshComponent(.Sphere, toChild: rightSun)
		if let mesh = rightSun.component(ofType: MeshComponent.self) {
			mesh.setMaterialIsLit(false)
			mesh.setMaterialColor(r: 0, g: 0, b: 1)
		}
		addLightComponent(toChild: rightSun)
		if let light =  rightSun.component(ofType: LightComponent.self){
			light.setLightColor(r: 0, g: 0, b: 1)
		}
		rightSun.setScale(0.2)
		
		rightSun.addComponent(SunInputComponent(toggleKey: .d))
		addChild(rightSun)
								
		addMeshComponent(.Cruiser, toChild: cruiser)
		if let mesh = cruiser.component(ofType: MeshComponent.self) {
			mesh.setTexture(.Cruiser)
//			mesh.setMaterialAmbient(0.01)
		}
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
