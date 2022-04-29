//
//  Preferences.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/23/22.
//

import MetalKit


class Preferences {
	public enum ClearColors{
		static let White: MTLClearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		static let Green: MTLClearColor = MTLClearColor(red: 0.22, green: 0.55, blue: 0.34, alpha: 1.0)
		static let Grey: MTLClearColor = MTLClearColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
		static let Black: MTLClearColor = MTLClearColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
	}
	
	static let shared: Preferences = Preferences()
	let clearColor: MTLClearColor = ClearColors.White
	let mainPixelFormat: MTLPixelFormat = MTLPixelFormat.bgra8Unorm
	let mainDepthPixelFormat: MTLPixelFormat = MTLPixelFormat.depth32Float
	let framesPerSEcond: Int = 60
	let startingSceneType: SceneManager.Types = .Sandbox
	private init(){
		
	}
}
