
import MetalKit

class GameTime {
    private static var _totalGameTime: Float = 0.0
    private static var _deltaTime: Float = 0.0
    public static func UpdateTime() {
//		let date = Date()
//		let calendar = Calendar.current
//
//		let nano = calendar.component(.second, from: date)
		_deltaTime = 1/60
		_totalGameTime += _deltaTime
	}
}

extension GameTime {
    public static var TotalGameTime: Float {
        return self._totalGameTime
    }
	    
    public static var DeltaTime: Float {
        return self._deltaTime
    }
}
