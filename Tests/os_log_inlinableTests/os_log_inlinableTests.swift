
import XCTest
import os_log_inlinable

@available(iOS 10.0, macOS 10.12, watchOS 3.0, tvOS 10.0, *)
final class os_log_inlinableTests: XCTestCase {

    ///
    /// Run the test calling the public log API.  The API is in a separate module `os_log_inlinable`.
    ///
    func testPublicLog() {
        logFirstLevel("Hello, World!")
    }
}
