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
                        .onTapGesture {
                            viewModel.sellectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("Appetizers")
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear { viewModel.getAppetizers() }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)

            if viewModel.isShowingDetail {
                AppetizerDetailView(
                    appetizer: viewModel.sellectedAppetizer,
                    isShowingDetail: $viewModel.isShowingDetail
                )
            }

            if viewModel.isLoading {
                LoadingView()
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
