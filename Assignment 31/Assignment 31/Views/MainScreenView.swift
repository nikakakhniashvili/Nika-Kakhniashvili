//
//  MainScreenView.swift
//  Assignment 31
//
//  Created by Nika Kakhniashvili on 30.05.24.
//

import SwiftUI

struct MainScreenView: View {
    @StateObject private var viewModel = DestinationViewModel()
    @StateObject private var travelTipsViewModel = TravelTipsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(0..<viewModel.destinations.count, id: \.self) { index in
                    NavigationLink(destination: DestinationDetailView(destination: viewModel.destinations[index])) {
                        Text(viewModel.destinations[index].name)
                    }
                }

                Button("Travel Tips") {
                    let tip = travelTipsViewModel.getRandomTip()
                    showAlert(tip: tip)
                }
                .padding()
            }
            .navigationTitle("Travel Destinations")
        }
    }
    
    private func showAlert(tip: String) {
        let alert = UIAlertController(title: "Travel Tip", message: tip, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
