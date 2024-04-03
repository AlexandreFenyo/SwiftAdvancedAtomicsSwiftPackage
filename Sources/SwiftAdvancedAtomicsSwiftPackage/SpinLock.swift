
import Foundation
import SwiftAdvancedAtomicsCPackage

enum SpinLockError: Error {
    case initialization
    case operation
}

class SpinLock: AdvancedLock {
    var locked: Bool = false
    
    static func initialize() throws {
        let ret = pthread_locks_init()
        if ret < 0 { throw SpinLockError.initialization }
    }

    static func deinitialize() throws {
        let ret = pthread_locks_deinit()
        if ret < 0 { throw SpinLockError.initialization }
    }

    func lock() throws {
        var must_retry = true
        repeat {
            var ret = pthread_locks_lock()
            if ret < 0 { throw SpinLockError.operation }
            
            if locked == false {
                must_retry = false
                locked = true
            }

            ret = pthread_locks_unlock()
            if ret < 0 { throw SpinLockError.operation }
        } while must_retry == true
    }
    
    // retval:
    // true: locked
    // false: should retry
    func trylock() throws -> Bool {
        var ret = pthread_locks_trylock()
        if ret < 0 { throw SpinLockError.operation }
        if ret == 1 { return false }
        if locked == true {
            ret = pthread_locks_unlock()
            if ret < 0 { throw SpinLockError.operation }
            return false
        }
        locked = true
        ret = pthread_locks_unlock()
        if ret < 0 { throw SpinLockError.operation }
        return true
    }
    
    func unlock() throws {
        var ret = pthread_locks_lock()
        if ret < 0 { throw SpinLockError.operation }
            
        locked = false

         ret = pthread_locks_unlock()
         if ret < 0 { throw SpinLockError.operation }
    }
}
