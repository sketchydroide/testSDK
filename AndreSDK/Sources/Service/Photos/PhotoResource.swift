import Foundation

struct PhotosResource: Resource {
    private enum Parameter: ParameterType {
        case method
        case apiKey(String)
        case lat(String)
        case lon(String)
        case radius
        case hasGeo
        case perPage
        case page
        case format
        case nojsoncallback
        
        var key: String {
            switch self {
            case .method:
                return "method"
            case .apiKey:
                return "api_key"
            case .lat:
                return "lats"
            case .lon:
                return "lon"
            case .radius:
                return "radius"
            case .hasGeo:
                return "has_geo"
            case .perPage:
                return "per_page"
            case .page:
                return "page"
            case .format:
                return "format"
            case .nojsoncallback:
                return "nojsoncallback"
            }
        }
        
        var value: String {
            switch self {
            case .method:
                return "flickr.photos.search"
            case let .apiKey(apiKey):
                return apiKey
            case let .lat(lat):
                return lat
            case let .lon(lon):
                return lon
            case .radius:
                return "0.1"
            case .perPage:
                return "2"
            case .page:
                return "1"
            case .hasGeo:
                return "true"
            case .format:
                return "json"
            case .nojsoncallback:
                return "1"
            }
        }
    }
    
    private let lat: String
    private let lon: String
    private let apiKey: String
    
    var parameters: [URLQueryItem]? {
        return [Parameter.method.queryItem,
                Parameter.apiKey(apiKey).queryItem,
                Parameter.lat(lat).queryItem,
                Parameter.lon(lon).queryItem,
                Parameter.radius.queryItem,
                Parameter.hasGeo.queryItem,
                Parameter.page.queryItem,
                Parameter.perPage.queryItem,
                Parameter.format.queryItem,
                Parameter.nojsoncallback.queryItem]
    }
    
    init(lat: Double,
         lon: Double,
         apiKey: String) {
        self.lat = "\(lat)"
        self.lon = "\(lon)"
        self.apiKey = apiKey
    }
}
