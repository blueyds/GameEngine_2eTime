//
//  GameEngineMetalApp.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import SwiftUI

@main
struct GameEngineMetalApp: App {
	let preference: Preferences
	let engine: Engine
	let scenes: SceneManager
	init(){
		preference = Preferences.shared
		engine = Engine.shared
		scenes = SceneManager.shared
		scenes.setScene(preference.startingSceneType)
	}
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
