
import XCTest
import CoreLocation

@testable import URLProtocolExample

class APILoaderTests: XCTestCase {
  var loader: APIRequestLoader<PointsOfInterestRequest>!

  override func setUp() {
    let request = PointsOfInterestRequest()
    let configuration = URLSessionConfiguration.ephemeral
    configuration.protocolClasses = [MockURLProtocol.self]
    let urlSession = URLSession(configuration: configuration)
    loader = APIRequestLoader(apiRequest: request, urlSession: urlSession)

  }

  override func tearDown() {

  }

  func testLoaderSuccess() {
    let inputCoordinate = CLLocationCoordinate2D(latitude: 37.3293, longitude: -121.8893)
    let mockJSONData = "[{\"name\":\"MyPointOfInterest\"}]".data(using: .utf8)!
    MockURLProtocol.requestHandler = { request in
      XCTAssertEqual(request.url?.query?.contains("lat=37.3293"), true)
      return (HTTPURLResponse(), mockJSONData)
    }
    let expectation = XCTestExpectation(description: "response")
    loader.loadAPIRequest(requestData: inputCoordinate) { pointsOfInterest, error in
      XCTAssertEqual(pointsOfInterest, [PointOfInterest(name: "MyPointOfInterest")])
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 1)
  }
}
