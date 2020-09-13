//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Stephen Kac on 9/13/20.
//

import Foundation

public final class RemoteFeedLoader {
	private let url: URL
	private let client: HTTPClient
	
	public init(url: URL = URL(string: "https://a-url.com")!, client: HTTPClient) {
		self.url = url
		self.client = client
	}
	
	public func load() {
		client.get(from: url)
	}
}

public protocol HTTPClient {
	func get(from url: URL)
}
