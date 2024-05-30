//
//  DestinationDetailView.swift
//  Assignment 31
//
//  Created by Nika Kakhniashvili on 30.05.24.
//

import SwiftUI

struct DestinationDetailView: View {
    let destination: Destination
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                // Destination Image
                Image(destination.imageName)
                    .resizable()
//                    .scaledToFit()
                    .frame(maxHeight: 200)
                    .frame(maxWidth: 350)
                    .cornerRadius(20) // Increased corner radius for rounded corners
//                    .clipShape(RoundedRectangle(cornerRadius: 20)) // Ensure image gets rounded corners
//                    .padding(.horizontal) // Added horizontal padding
                
                // Destination Name
                Text(destination.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                // Destination Description
                Text(destination.description)
                    .font(.body)
                    .padding(.horizontal)
                    .padding(.bottom, 20) // Added bottom padding
                
                // Add Buttons
                HStack {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination: HotelsView(destination: destination)) {
                            Text("Hotels")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: MustSeeView(destination: destination)) {
                            Text("Must See")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: TransportView(destination: destination)) {
                            Text("Transportation")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            .navigationTitle(destination.name)
        }
    }
}


struct DestinationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationDetailView(destination: Destination(name: "London", country: "United Kingdom", imageName: "London", description: "A bustling city with rich history."))
    }
}
