
import Foundation

enum SpinLockError: Error {
    case initialization
    case operation
}

class SpinLock {
    var locked: Bool = false
    
    static func initialize() throws {
        let ret = pthread_locks_init()
        if ret < 0 { throw SpinLockError.initialization }
    }
}
