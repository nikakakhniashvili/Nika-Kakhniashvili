//
//  HotelsView.swift
//  Assignment 31
//
//  Created by Nika Kakhniashvili on 30.05.24.
//

import SwiftUI

struct HotelsView: View {
    @StateObject private var viewModel: HotelsViewModel
    let destination: Destination

    init(destination: Destination) {
        self.destination = destination
        self._viewModel = StateObject(wrappedValue: HotelsViewModel())
    }

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading hotels...")
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                List(viewModel.hotels) { hotel in
                    VStack(alignment: .leading) {
                        Text(hotel.name)
                            .font(.headline)
                        Text("\(hotel.city), \(hotel.country)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchHotels()
        }
    }
}

struct HotelsView_Previews: PreviewProvider {
    static var previews: some View {
        let destination = Destination(name: "London", country: "United Kingdom", imageName: "London", description: "A bustling city with rich history.")
        return HotelsView(destination: destination)
    }
}


