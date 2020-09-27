//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Stephen Kac on 9/12/20.
//

import Foundation

public enum LoadFeedResult {
	case success([FeedItem])
	case failure(Error)
}

public protocol FeedLoader {
	func load(completion: @escaping (LoadFeedResult) -> Void)
}
