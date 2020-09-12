//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Stephen Kac on 9/12/20.
//

import Foundation

enum LoadFeedResult {
	case success([FeedItem])
	case error(Error)
}

protocol FeedLoader {
	func load(completion: @escaping (LoadFeedResult) -> Void)
}
