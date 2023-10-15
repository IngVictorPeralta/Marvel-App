public struct MyLibrary {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public func helloLibrary(){
        //MyLibrary % swift build
        print("Hello Library...")
    }
}
