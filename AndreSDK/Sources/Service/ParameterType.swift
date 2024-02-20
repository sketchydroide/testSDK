import Foundation

protocol ParameterType {
    var key: String { get }
    var value: String { get }
}

extension ParameterType {
    var queryItem: URLQueryItem {
        return URLQueryItem(name: key, value: value)
    }
}
