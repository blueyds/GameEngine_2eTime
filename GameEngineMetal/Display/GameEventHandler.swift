//
//  GameEventHandler.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 4/29/22.
//

import SwiftUI
import simd

struct GameEventHandlingView: NSViewRepresentable {
	

	func makeNSView(context: Context) -> NSView {
		let view = GameEventNSView()
		DispatchQueue.main.async { // wait till next event cycle
			view.window?.makeFirstResponder(view)
		}
		return view
	}

	func updateNSView(_ nsView: NSView, context: Context) {
	}
}

class GameEventNSView: NSView {
	override var acceptsFirstResponder: Bool { true }
	
}
// Keyboard Events
extension GameEventNSView {
	override func keyDown(with event: NSEvent) {
		Keyboard.SetKeyPressed(event.keyCode, isOn: true)
	}
	override func keyUp(with event: NSEvent) {
		Keyboard.SetKeyPressed(event.keyCode, isOn: false)
	}
}
// Mouse button events
extension GameEventNSView{
	override func mouseDown(with event: NSEvent) {
		Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
	}
	override func mouseUp(with event: NSEvent) {
		Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
	}
	override func rightMouseDown(with event: NSEvent) {
		Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
	}
	override func rightMouseUp(with event: NSEvent) {
		Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
	}
	override func otherMouseDown(with event: NSEvent) {
		Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
	}
	override func otherMouseUp(with event: NSEvent) {
		Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
	}
}
// Mouse movement events
extension GameEventNSView {
	override func mouseMoved(with event: NSEvent) {
		setMousePositionChanged(event: event)
	}
	override func scrollWheel(with event: NSEvent) {
		Mouse.ScrollMouse(deltaY: Float(event.deltaY))
	}
	override func mouseDragged(with event: NSEvent) {
		setMousePositionChanged(event: event)
	}
	override func rightMouseDragged(with event: NSEvent) {
		setMousePositionChanged(event: event)
	}
	override func otherMouseDragged(with event: NSEvent) {
		setMousePositionChanged(event: event)
	}
	private func setMousePositionChanged(event: NSEvent){
		let overrallLocation = simd_float2(Float(event.locationInWindow.x),
										   Float(event.locationInWindow.y))
		let deltaChange = simd_float2(Float(event.deltaX),
									  Float(event.deltaY))
		Mouse.SetMousePositionChange(overallPosition: overrallLocation, deltaPosition: deltaChange)
	}
	override func updateTrackingAreas() {
		let area = NSTrackingArea(rect: self.bounds,
								  options: [NSTrackingArea.Options.activeAlways,
											NSTrackingArea.Options.mouseMoved,
											NSTrackingArea.Options.enabledDuringMouseDrag],
								  owner: self,
								  userInfo: nil)
		self.addTrackingArea(area)
	}
}
