import Foundation
import Alamofire

class WeatherLoader {
    
    func loadWeather(lat: Double, lng: Double,completion: @escaping (Weather) -> Void) {
        let headers: HTTPHeaders = [
            "X-Yandex-API-Key": "1ff28294-407a-459e-a9f8-a85dc523bcfa",
            //"Accept": "application/json"
        ]
        let request = AF.request("https://api.weather.yandex.ru/v2/forecast?lat=\(lat)&lon=\(lng)&limit=7", headers: headers).responseJSON { data in
                var weather:Weather?
                if let result = data.data {
                    do {
                    let decoder = JSONDecoder()
                        let jsonResults = try decoder.decode(Weather.self, from: result)
                        weather = jsonResults
                        } catch DecodingError.dataCorrupted(let context) {
                            let dataString = String.init(data: result, encoding: .utf8) ?? "Nil String"
                            let error = CustomDecodeError(description: context.debugDescription + " " + dataString)
                            print(error)
                        } catch DecodingError.keyNotFound(let key, let context) {
                            let error = CustomDecodeError(description: context.debugDescription + key.description)
                            print(error)
                        } catch DecodingError.typeMismatch(_, let context) {
                            let error = CustomDecodeError(description: context.debugDescription + (context.codingPath.last?.description ?? ""))
                            print(error)
                        } catch DecodingError.valueNotFound(_, let context) {
                            let error = CustomDecodeError(description: context.debugDescription + (context.codingPath.last?.description ?? ""))
                            print(error)
                        } catch let error {
                            let customError = CustomDecodeError(description: error.localizedDescription)
                            print(customError)
                        }
                }
                DispatchQueue.main.async {
                    completion(weather!)
                }
            }
        }
}

