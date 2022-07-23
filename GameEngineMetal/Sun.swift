//
//  Sun.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 7/22/22.
//


import Foundation
import GameEngine

class Sun: GameNode {
	private static let _mesh: ModelMesh = ModelMesh(modelName: "sphere")

	init(x: Float = 0, y: Float = 0, z: Float = 0, r: Float, g: Float, b: Float, parent: GameNode){
		super.init(name: "Sun", parent: parent)
		Scene?.addMeshComponent(Sun._mesh, toChild: self)
		setPosition(x: x, y: y, z: z)
		Mesh!.setMaterialIsLit(false)
		Mesh!.setMaterialColor(r: r, g: g, b: b)
		Scene?.addLightComponent(toChild: self)
		Light!.setLightColor(r: r, g: g, b: b)
		setScale(0.2)
		//addComponent(SunInputComponent(toggleKey: .d))
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
