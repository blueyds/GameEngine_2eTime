//
//  GameEngineMetalApp.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import SwiftUI

@main
struct GameEngineMetalApp: App {
	let preference: Preferences = Preferences.shared
	let engine: Engine = Engine.shared
	let scenes: SceneManager = SceneManager.shared
	init(){
		scenes.setScene(preference.startingSceneType)
	}
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
