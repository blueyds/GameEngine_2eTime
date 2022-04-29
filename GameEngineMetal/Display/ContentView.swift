//
//  ContentView.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		GameView().background(GameEventHandlingView())
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
	
    }
}
