import Foundation

enum ResourceError: Error {
    case unableToCreateRequest
}

enum Host: String {
    case `default` = "api.flickr.com"
}

enum Scheme: String {
    case secure = "https"
}

enum Path: String {
    case `default` = "/services/rest/"
}

protocol Resource {
    var path: String { get }
    var host: String { get }
    var scheme: String { get }
    var parameters: [URLQueryItem]? { get }
    func makeRequest() throws -> URLRequest
}

// MARK: - default values for properties
extension Resource {
    var host: String { return Host.default.rawValue }
    var path: String { return Path.default.rawValue }
    var scheme: String { return Scheme.secure.rawValue }
    var parameters: [URLQueryItem]? { return nil }
}

// MARK: - default implementation of makeRequest
extension Resource {
    func makeRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.path = path
        urlComponents.host = host
        urlComponents.queryItems = parameters
        guard let url = urlComponents.url else {
            throw ResourceError.unableToCreateRequest
        }
        return URLRequest(url: url)
    }
}
