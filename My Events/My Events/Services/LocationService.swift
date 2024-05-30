import Foundation

// MARK: - сервис для работы с локациями ивентов

class LocationService {

    static let shared = LocationService()

    private init() { }

    var cityMap: [String: String] = [
        "spb": "Saint Petersburg",
        "msk": "Moscow",
        "nsk": "Novosibirsk",
        "ekb": "Ekaterinburg",
        "nnv": "Nizhniy Novgorod",
        "kzn": "Kazan",
        "vbg": "Vyborg",
        "smr": "Samara",
        "krd": "Krasnodar",
        "sochi": "Sochi",
        "ufa": "Ufa",
        "krasnoyarsk": "Krasnoyarsk",
        "kev": "Kyiv",
        "atlanta": "Atlanta",
        "london": "London",
        "newYork": "New York"
    ]

    func getFullCityName(bySlug: String) -> String {
        if let fullName = cityMap[bySlug.lowercased()] {
            return fullName
        } else {
            return bySlug
        }
    }
}
