
import CoreLocation
import Foundation

enum RequestError: Error {
  case invalidCoordinate
}

struct PointOfInterest: Decodable, Equatable {
  var name: String

  init(name: String) {
    self.name = name
  }
}

struct PointsOfInterestRequest: APIRequest {
  func makeRequest(from coordinate: CLLocationCoordinate2D) throws -> URLRequest {
    guard CLLocationCoordinate2DIsValid(coordinate) else {
      throw RequestError.invalidCoordinate
    }
    var components = URLComponents(string: "https://example.com/locations")!
    components.queryItems = [
      URLQueryItem(name: "lat", value: "\(coordinate.latitude)"),
      URLQueryItem(name: "long", value: "\(coordinate.longitude)")
    ]
    return URLRequest(url: components.url!)
  }

  func parseResponse(data: Data) throws -> [PointOfInterest] {
    return try JSONDecoder().decode([PointOfInterest].self, from: data)
  }
}
