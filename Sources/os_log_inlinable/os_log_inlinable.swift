
import Foundation
import os.log

///
/// First level public log call.
///
@available(iOS 10.0, macOS 10.12, watchOS 3.0, tvOS 10.0, *)
@inlinable
public func logFirstLevel(_ message: String) {
    Logger.logSecondLevel(message)
}

@available(iOS 10.0, macOS 10.12, watchOS 3.0, tvOS 10.0, *)
@usableFromInline
internal struct Logger {

    ///
    /// Second level internal log call which encapsulates the os_log call.
    ///
    @usableFromInline
    internal static func logSecondLevel(_ message: String) {
        os_log("%{public}@", log: log, type: OSLogType.default, message)
    }

    ///
    /// This makes it easy to search `log show` for the entry just produced.
    ///
    /// Use: `log show --predicate 'subsystem == "os_log_inlinable"' --style json --source  --last 1m`
    ///
    /// Adjust the `--last 1m` accourdingly (1m searches the last 1 minute of logs).
    ///
    static let log = OSLog(subsystem: "os_log_inlinable", category: "test")
}
