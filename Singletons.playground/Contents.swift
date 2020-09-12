import AppKit

//  Are Singletons and Global Instances Damaging your System Design and Testability?

// Single tons should only ahve one isntance, ensure no one else has access to the initializer, and control its only instance with a single point of access

// Subclassing or/and extensions should be allowed
//class ApiClientSingleton {
//    static let instance = ApiClientSingleton()
//
//    private init() {}
//}
//
//let client = ApiClientSingleton.instance


// Not a true Singleton as you can create multiple instances.
// This would be considered a singleton with lowercased s
//final class ApiClientShared {
//    static let shared = ApiClientShared()
//
//    init() {}
//}

// Using the Mutable global state -----------------
//
//class ApiClientSingleton {
//    static var instance = ApiClientSingleton()
//
//    private init() {}
//
//    func login(completion: (LoggedInUser) -> Void) {}
//}

// Standard way, too much hard dependencies

//struct LoggedInUser {}
//
//struct FeedItem {}
//
//class ApiClient {
//    static var instance = ApiClient()
//
//    private init() {}
//
//    func login(completion: (LoggedInUser) -> Void) {}
//    func loadFeed(completion: ([FeedItem]) -> Void) {}
//}
//
//class MockAPIClient: ApiClient {}
//
//class LoginViewController: UIViewController {
//    var api = ApiClientSingleton.instance
//
//    func didTapLoginButton() {
//        ApiClient.instance.login() { user in
//            // show next screen
//        }
//    }
//}
//
//class FeedViewController: UIIViewController {
//    var api = ApiClientSingleton.instance

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        api.loadFeed { loadedItems in
//            // update UI
//        }
//    }
//}

// Modules - still does not fix the issues ------------------ 1st Stage

// Api Module

//class ApiClient {
//    static var instance = ApiClient()
//
//    private init() {}
//
//
//}
//
//class MockAPIClient: ApiClient {}
//
//// Login Module
//
//
//struct LoggedInUser {}
//
//extension ApiClient {
//	func login(completion: (LoggedInUser) -> Void) {}
//}
//
//class LoginViewController: UIViewController {
//    var api = ApiClient.instance
//
//    func didTapLoginButton() {
//        ApiClient.instance.login() { user in
//            // show next screen
//        }
//    }
//}
//
//// Feed Module
//
//struct FeedItem {}
//
//extension ApiClient {
//	func loadFeed(completion: ([FeedItem]) -> Void) {}
//}
//
//class FeedViewController: UIIViewController {
//    var api = ApiClient.instance
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        api.loadFeed { loadedItems in
//            // update UI
//        }
//    }
//}

// Inversion of dependencies

// Main Module
extension ApiClient {
	func login(completion: (LoggedInUser) -> Void) {}
}

extension ApiClient {
	func loadFeed(completion: ([FeedItem]) -> Void) {}
}

class ApiClient {
    static var instance = ApiClient()

    private init() {}
	
}

class MockAPIClient: ApiClient {}

// Login Module


struct LoggedInUser {}


class LoginViewController: NSViewController {
	var login: (((LoggedInUser) -> Void) -> Void)?
    
    func didTapLoginButton() {
        login? { user in
            // show next screen
        }
    }
}

// Feed Module

struct FeedItem {}

class FeedViewController: NSViewController {
	var loadFeed: ((([FeedItem]) -> Void) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFeed? { loadedItems in
            // update UI
        }
    }
}
