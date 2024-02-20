import Foundation

protocol ImageUrlHaving {
    var imageUrl: String { get }
}

struct PhotoListResponseModel: Decodable {
    let photos: PhotosModel?
    let stat: String?
    let code: String?
    let message: String?
}

struct PhotosModel: Decodable {
    let photo: [PhotoModel]
}

struct PhotoModel: Decodable {
    struct Format {
        static let imageUrlFormat = "https://farm%d.staticflickr.com/%@/%@_%@.png"
    }

    enum CodingKeys: String, CodingKey {
        case photoId = "id"
        case secret
        case server
        case farm
    }

    let photoId: String
    let secret: String
    let server: String
    let farm: Int
}

extension PhotoModel: ImageUrlHaving {
    var imageUrl: String {
        return String(format: Format.imageUrlFormat, self.farm, self.server, self.photoId, self.secret)
    }
}
