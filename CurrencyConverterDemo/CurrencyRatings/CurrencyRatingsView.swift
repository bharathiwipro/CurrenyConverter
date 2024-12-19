//
//  CurrencyRatingsView.swift
//  CurrencyConverterDemo
//
//  Created by BHARATHI K on 18/12/24.
//
import SwiftUI
// RatingsView displaying the rates fetched via the ViewModel
struct RatingsView: View {
    @ObservedObject var viewModel: CurrencyViewModel

    var body: some View {
        VStack {
            if viewModel.rates.isEmpty {
                Text("No data available")
                    .font(.title)
                    .padding()
            } else {
                List(viewModel.rates.keys.sorted(), id: \.self) { currency in
                    HStack {
                        Text(currency)
                        Spacer()
                        Text(String(format: "%.4f", viewModel.rates[currency]!))
                            .bold()
                    }
                    .padding()
                }
            }

            // Show error message if there is an error
            if let errorMessage = viewModel.error {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .onAppear {
            // Fetch rates when the view appears
            viewModel.fetchExchangeRates()
        }
        .navigationBarTitle("Currency Rates", displayMode: .inline)
    }
}

//struct RatingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Create mock data for preview purposes
//        let mockRates = ["USD": 1.1859, "EUR": 1.0, "GBP": 0.8646]
//        let mockResponse = FixerResponse(success: true, base: "EUR", date: "2024-12-18", rates: mockRates)
//        
//        let mockNetworkService = MockNetworkServiceForUITests()
//        mockNetworkService.mockResponse = .success(mockResponse)
//        
//        let viewModel = CurrencyViewModel(networkService: mockNetworkService)
//        
//        return NavigationView {
//            RatingsView(viewModel: viewModel)
//        }
//    }
//}
