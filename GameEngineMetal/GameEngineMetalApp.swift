//
//  GameEngineMetalApp.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import SwiftUI
import GameEngine
@main
struct GameEngineMetalApp: App {
	let preference: Preferences = Preferences.shared
	let engine: Engine = Engine.shared
	//let scenes: SceneManager
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
