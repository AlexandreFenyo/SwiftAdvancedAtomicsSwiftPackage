// The Swift Programming Language
// https://docs.swift.org/swift-book

protocol AdvancedLock {
    static func initialize() throws
    static func deinitialize() throws
    func lock() throws
    func trylock() throws -> Bool
    func unlock() throws
}

