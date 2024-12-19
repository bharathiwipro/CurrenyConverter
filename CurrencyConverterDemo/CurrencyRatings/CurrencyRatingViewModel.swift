//
//  CurrencyRatingViewModel.swift
//  CurrencyConverterDemo
//
//  Created by BHARATHI K on 18/12/24.
//

import Foundation

//class CurrencyViewModel: ObservableObject {
//    @Published var rates: [String: Double] = [:]
//    @Published var error: String? = nil
//    @Published var isLoading = true
//    
//    private var networkService: NetworkService
//    
//    // Inject NetworkService for reusability
//    init(networkService: NetworkService = NetworkService()) {
//        self.networkService = networkService
//        fetchExchangeRates()
//    }
//    
//    func fetchExchangeRates() {
//        // URL to fetch exchange rates (replace with your actual access key)
//        let apiKey = "3b3ab8ea94a30610eb812f13f0a520b4" // Replace with actual access key
//        let apiUrl = "http://data.fixer.io/api/latest?access_key=\(apiKey)"
//        
//        networkService.fetchData(from: apiUrl) { [weak self] result in
//            switch result {
//            case .success(let response):
//                if response.success {
//                    self?.rates = response.rates
//                } else {
//                    self?.error = "Failed to fetch exchange rates."
//                }
//                self?.isLoading = false
//            case .failure(let error):
//                self?.error = "Failed to load data: \(error.localizedDescription)"
//                self?.isLoading = false
//            }
//        }
//    }
//}

// CurrencyViewModel.swift
import Foundation

class CurrencyViewModel: ObservableObject {
    private let networkService: NetworkService

    @Published var rates: [String: Double] = [:]
    @Published var error: String?

    init(networkService: NetworkService) {
        self.networkService = networkService
        fetchExchangeRates()
    }

    func fetchExchangeRates() {
        let apiKey = "3b3ab8ea94a30610eb812f13f0a520b4" // Replace with actual access key
        //        let apiUrl = "http://data.fixer.io/api/latest?access_key=\(apiKey)"
        let url = "http://data.fixer.io/api/latest?access_key=\(apiKey)"
        
        networkService.fetchData(from: url) { result in
            switch result {
                        case .success(let response):
                            if response.success {
                                self.rates = response.rates
                            } else {
                                self.error = "Failed to fetch exchange rates."
                            }
                        case .failure(let error):
                            self.error = "Failed to load data: \(error.localizedDescription)"
                        }
        }
    }
}
