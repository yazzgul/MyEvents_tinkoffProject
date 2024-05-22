import UIKit

class NetworkRequest {
    static let shared = NetworkRequest()

    private init() {}

    func getData(url: URL, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(url) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    completionHandler(.failure(.invalidURL))
                } else {
                    guard let data else { return }
                    print("data: ", data)
                    completionHandler(.success(data))
                }
            }

        }
    }
    func downloadImage(by urlString: String) async throws -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }

        let imageResponse = try await URLSession.shared.data(from: url)

        return UIImage(data: imageResponse.0)
    }
}
