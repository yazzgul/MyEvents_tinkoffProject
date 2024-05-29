import Foundation

// MARK: - класс для работы с локациями ивентов (например для фильтрации)

class LocationManager {

    var cities = ["Санкт-Петербург",
                  "Москва",
                  "Новосибирск",
                  "Екатеринбург",
                  "Нижний Новгород",
                  "Казань",
                  "Выборг",
                  "Самара",
                  "Краснодар",
                  "Сочи",
                  "Уфа",
                  "Красноярск",
                  "Киев",
                  "Нью-Йорк"]

}
enum CitySlug: String {
    case spb = "Санкт-Петербург"
    case msk = "Москва"
    case nsk = "Новосибирск"
    case ekb = "Екатеринбург"
    case nnv = "Нижний Новгород"
    case kzn = "Казань"
    case vbg = "Выборг"
    case smr = "Самара"
    case krd = "Краснодар"
    case sochi = "Сочи"
    case ufa = "Уфа"
    case krasnoyarsk = "Красноярск"
    case kev = "Киев"
    case newYork = "Нью-Йорк"

// add london

    static func getFullCityNameFromSlug(slug: String) -> String {
        switch slug.lowercased() {
        case "spb": return CitySlug.spb.rawValue
        case "msk": return CitySlug.msk.rawValue
        case "nsk": return CitySlug.nsk.rawValue
        case "ekb": return CitySlug.ekb.rawValue
        case "nnv": return CitySlug.nnv.rawValue
        case "kzn": return CitySlug.kzn.rawValue
        case "vbg": return CitySlug.vbg.rawValue
        case "smr": return CitySlug.smr.rawValue
        case "krd": return CitySlug.krd.rawValue
        case "sochi": return CitySlug.sochi.rawValue
        case "ufa": return CitySlug.ufa.rawValue
        case "krasnoyarsk": return CitySlug.krasnoyarsk.rawValue
        case "kev": return CitySlug.kev.rawValue
        case "newYork": return CitySlug.newYork.rawValue
        default: return slug
        }
    }

}
