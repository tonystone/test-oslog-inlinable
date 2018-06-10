# os_log_inlinable

Small test program to determine `os_log`s behavior when used with Swift 4.2 `@inlinable` and `@usableFromInline`.  It was suggested that inlining could overcome `os_logs` limitation on capturing the immediate calling function's static context (file, line, func).  See [TraceLog issue #44](https://github.com/tonystone/tracelog/issues/44) for details.

Output of test run:

```console
> log show --predicate 'subsystem == "os_log_inlinable"' --style json --source  --last 1m
Filtering the log data using "subsystem == "os_log_inlinable""
Skipping info and debug messages, pass --info and/or --debug to include.
[{
  "traceID" : 78134079258628,
  "messageType" : "Default",
  "eventType" : "logEvent",
  "signpostID" : 0,
  "source" : {
    "symbol" : "$S16os_log_inlinable6LoggerV0B11SecondLevelyySSFZ",
    "line" : 24,
    "image" : "os_log_inlinablePackageTests",
    "file" : "os_log_inlinable.swift"
  },
  "activityIdentifier" : 0,
  "subsystem" : "os_log_inlinable",
  "category" : "test",
  "threadID" : 17657416,
  "timestamp" : "2018-06-10 08:47:50.829488-0700",
  "machTimestamp" : 1218436261547097,
  "eventMessage" : "Hello, World!",
  "processID" : 95957,
  "senderProgramCounter" : 7221,
  "parentActivityIdentifier" : 0,
  "timezoneName" : ""
}]
```
