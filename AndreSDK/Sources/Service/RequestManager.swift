import Foundation

@available(iOS 13.0.0, *)
protocol RequestManagerType {
    func makeCall<T: Decodable>(using resource: Resource) async throws -> T
}

@available(iOS 13.0, *)
class RequestManager: ObservableObject, RequestManagerType {
    func makeCall<T: Decodable>(using resource: Resource) async throws -> T {
        let request = try resource.makeRequest()
        
        //run the request and retrieve both the data and the response of the call
        let (data, response) = try await URLSession.shared.data(for: request)
        
        //checks if there are errors regarding the HTTP status code and decodes using the passed struct
        let fetchedData = try JSONDecoder().decode(T.self, from: data)
        
        return fetchedData
    }
}
