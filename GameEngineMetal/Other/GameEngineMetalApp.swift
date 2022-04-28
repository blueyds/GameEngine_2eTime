//
//  GameEngineMetalApp.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import SwiftUI

@main
struct GameEngineMetalApp: App {
	let engine: Engine = Engine.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
