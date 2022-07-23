//
//  Cruuiser.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 7/22/22.
//

import Foundation
import GameEngine

class Cruiser: GameNode {
	private static let _mesh: ModelMesh = ModelMesh(modelName: "cruiser")
	private static let _texture: Texture = Texture(name: "cruiser", ext: "bmp")
	init(x: Float = 0, y: Float = 0, z: Float = 0, parent: GameNode){
		super.init(name: "Cruiser", parent: parent)
		self.Scene?.addMeshComponent(Cruiser._mesh, toChild: self)
		Mesh?.setTexture(Cruiser._texture)
		addComponent(CruiserInputComponent())
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

