import XCTest
@testable import SwiftAdvancedAtomicsSwiftPackage

class Foo {
    var bar = 0
}

final class SwiftAdvancedAtomicsSwiftPackageTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try SpinLock.initialize()
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try SpinLock.deinitialize()
    }
    
    /*
     func testExample() throws {
     // This is an example of a functional test case.
     // Use XCTAssert and related functions to verify your tests produce the correct results.
     // Any test you write for XCTest can be annotated as throws and async.
     // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
     // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
     }
     
     func testPerformanceExample() throws {
     // This is an example of a performance test case.
     measure {
     // Put the code you want to measure the time of here.
     }
     }
     */
    
    func testBasic() throws {
        let at_foo = AdvancedAtomic(Foo())
        
        // Increment foo.bar
        try at_foo.tryAtomic { foo in
            foo.bar += 1
        }
        
        // Get a copy of foo.bar
        let bar = try at_foo.atomic { $0.bar }
        
        XCTAssert(bar == 1)
    }
    
    func testBasicException() throws {
        let at_foo = AdvancedAtomic(Foo())
        
        // Increment foo.bar
        try at_foo.tryAtomicEx { foo in
            foo.bar += 1
        }
        
        // Get a copy of foo.bar
        let bar = try at_foo.tryAtomicEx { $0.bar }
        
        XCTAssert(bar == 1)
    }
    
    func testSpinLock() throws {
        let lock = SpinLock()
        try lock.lock()

        var ret = try lock.trylock()
        XCTAssert(ret == false)

        try lock.unlock()
        ret = try lock.trylock()
        XCTAssert(ret == true)

        try lock.unlock()
    }
}
