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
	
	public enum Error: Swift.Error {
		case connectivity
		case invalidData
	}
	
	public typealias Result = Swift.Result<[FeedItem], Error>
	
	public init(url: URL = URL(string: "https://a-url.com")!, client: HTTPClient) {
		self.url = url
		self.client = client
	}
	
	public func load(completion: @escaping (Result) -> Void) {
		client.get(from: url) { result  in
			switch result {
			case let .success(data, response):
				completion(FeedItemsMapper.map(data, from: response))
			case .failure:
				completion(.failure(.connectivity))
			}
		}
	}
	
}
