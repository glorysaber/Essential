//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Stephen Kac on 9/12/20.
//

import XCTest

class RemoteFeedLoader {
	
}

class HTTPClient {
	var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

	func test_init() {
		let client = HTTPClient()
		_ = RemoteFeedLoader()
		
		XCTAssertNil(client.requestedURL)
	}

}
