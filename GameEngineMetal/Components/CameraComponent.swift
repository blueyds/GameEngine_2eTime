//
//  CameraComponent.swift
//  GameEngineMetal
//
//  Created by Craig Nunemaker on 5/21/22.
//
import MetalKit
import GameplayKit

class CameraComponent: GKComponent {
	enum Types {
		case Debug
	}
	var cameraType: Types!
	
	var viewMatrix: matrix_float4x4 {
		var viewMatrix = matrix_identity_float4x4
		
		if let node = entity as? Node {
			viewMatrix.rotate(angle: node.getRotationX(), axis: .x)
			viewMatrix.rotate(angle: node.getRotationY(), axis: .y)
			viewMatrix.rotate(angle: node.getRotationZ(), axis: .z)
			viewMatrix.translate(direction: -node.getPosition())
		}
		else {fatalError("error in camera component. it is not a node")}
		
		return viewMatrix
	}
	
	private var _zoom: Float = 45.0
	private var _aspectRation: Float = Renderer.AspectRatio
	private var _near: Float = 0.1
	private var _far: Float = 1000

	
	var projectionMatrix: matrix_float4x4 {
		return matrix_float4x4.perspective(degreesFov: _zoom,
										   aspectRatio: _aspectRation,
										   near: _near,
										   far: _far)
	}
	
	init(cameraType: Types){
		self.cameraType = cameraType
		super.init()
	}
	init(cameraType: Types, zoom: Float, aspectRatio: Float, near: Float, far: Float){
		self.cameraType = cameraType
		self._zoom = zoom
		self._aspectRation = aspectRatio
		self._near = near
		self._far = far
		super.init()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setZoom(level: Float){
		_zoom = level
	}
	func setAspectRation(_ ratio: Float){
		_aspectRation = ratio
	}
	func setNear(_ near: Float){
		_near = near
	}
	func setFar(_ far: Float){
		_far = far
	}
	
	
}
