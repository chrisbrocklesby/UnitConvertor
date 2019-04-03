import XCTest

class UnitConverterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func convertToCelsius(temp:Float, source:String) -> Float? {
        switch source {
        case "Celsius": return temp
        case "Fahrenheit": return (temp - 32) * 5 / 9
        case "Kelvin": return temp - 273.15
        default: return nil
        }
    }

    func testExample() {
        
        let expectedValue = Float(37.77778)
        let returnValue = convertToCelsius(temp: 100, source: "Fahrenheit")
        
        XCTAssertEqual(returnValue, expectedValue)
        
    }
}
