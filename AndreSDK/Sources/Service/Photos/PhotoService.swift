import Foundation

protocol PhotosGeting {
    func getPhotos(at lat: Double, and long: Double) async throws -> String
}

struct PhotosService: PhotosGeting {
    let requestManager: RequestManagerType
    let apiKey: String

    init(apiKey: String, requestManager: RequestManagerType) {
        self.apiKey = apiKey
        self.requestManager = requestManager
    }
    
    func getPhotos(at lat: Double, and long: Double) async throws -> String {
        try await self.getPhotosResponse(at: lat, and: long).photos?.photo.last?.imageUrl ?? ""
    }
    
    private func getPhotosResponse(at lat: Double, and long: Double) async throws -> PhotoListResponseModel {
        let resource = PhotosResource(lat: lat, lon: long, apiKey: apiKey)
        return try await requestManager.makeCall(using: resource)
    }
}
