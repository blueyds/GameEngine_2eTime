//
//  Pointer.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 7/22/22.
//


import Foundation
import GameEngine

class Pointer: GameNode {
	

	init(x: Float = 0, y: Float = 0, z: Float = 0, parent: GameNode){
		super.init(name: "Pointer", parent: parent)
		setPosition(x: x, y: y, z: z)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	deinit {

	}
}
