//
//  AccountView.swift
//  Appetizers
//
//  Created by Michal Konkel on 01/10/2024.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewViewModel()
    @FocusState private var focusedTextField: FormTextField?

    private enum FormTextField {
        case firstName, lastName, email
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)

                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)

                    TextField("Emai", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocapitalization(/*@START_MENU_TOKEN@*/ .none/*@END_MENU_TOKEN@*/)
                        .disableAutocorrection(true)

                    DatePicker("Birthday",
                               selection: $viewModel.user.birthDate,
                               in: Date().oneHundretTenYearsAgo ... Date().eighteenYearsAgo,
                               displayedComponents: .date)

                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Feequent Refils", isOn: $viewModel.user.frequentRefils)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("Acconut")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        .onAppear {
            viewModel.retrieveUser()
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
    AccountView()
}
