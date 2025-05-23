import Foundation

class APIClient {
    static let shared = APIClient()
    private let session: URLSession

    private init() {
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration)
    }

    func performRequest<T: Decodable>(with endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}