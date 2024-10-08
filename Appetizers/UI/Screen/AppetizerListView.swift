//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Michal Konkel on 01/10/2024.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewVM()

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListItem(item: appetizer)
                }
                .navigationTitle("Appetizers")
                .onAppear {
                    viewModel.getAppetizers()
                }
                
                if viewModel.isLoading {
                    LoadingView()
                }
            }
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(
                title: alert.title,
                message: alert.message,
                dismissButton: alert.dismissButton
            )
        }
    }
}

#Preview {
    AppetizerListView()
}
