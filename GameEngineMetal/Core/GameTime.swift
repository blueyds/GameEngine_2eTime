
import Foundation

class GameTime {
    private static var _totalGameTime: TimeInterval = 0.0
    private static var _deltaTime: TimeInterval = 0.0
    public static func UpdateTime() {
//		let date = Date()
//		let calendar = Calendar.current
//
//		let nano = calendar.component(.second, from: date)
		_deltaTime = TimeInterval(1/60)
		_totalGameTime += _deltaTime
	}
}

extension GameTime {
    public static var TotalGameTime: TimeInterval {
        return self._totalGameTime
    }

	    
    public static var DeltaTime: TimeInterval {
        return self._deltaTime
    }
}
