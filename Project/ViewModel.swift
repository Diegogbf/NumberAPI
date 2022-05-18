//
//  ViewModel.swift
//  Project
//
//  Created by Diego Gomes on 17/05/22.
//

import Foundation

protocol ViewModelProtocol {
    var delegate: ViewControllerDelegate? { set get }

    func makeRequest(number: String?)
}

class ViewModel {

    private let repository: RepositoryProtocol
    weak var delegate: ViewControllerDelegate?

    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
    }
}

extension ViewModel: ViewModelProtocol {
    func makeRequest(number: String?) {
        guard let numberString = number, let number = Int(numberString) else {
            // handle error
            return
        }

        repository.makeRequest(number: "\(number)") { [weak self] result in
            switch result {
            case .success(let data):
                self?.delegate?.updateLabel(text: data)
            case .failure(let error):
                break
            }
        }
    }
}

protocol RepositoryProtocol {
    func makeRequest(number: String, completion: @escaping ((Result<String, Error>) -> Void))
}

class Repository: RepositoryProtocol {
    func makeRequest(number: String, completion: @escaping ((Result<String, Error>) -> Void)) {
        if let url = URL(string: "http://numbersapi.com/" + number) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            let session = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                } else if let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data {
                    let result = String(data: data, encoding: .ascii)
                    DispatchQueue.main.async {
                        completion(.success(result ?? ""))
                    }
                }
            }
            session.resume()
        }

    }
}


