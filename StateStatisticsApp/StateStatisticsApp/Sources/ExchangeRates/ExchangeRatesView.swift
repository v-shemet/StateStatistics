//
//  ExchangeRatesView.swift
//  StateStatisticsApp
//
//  Created by Vladimir Shemet on 28.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import SwiftUI

struct ExchangeRatesView: View {
  @ObservedObject
  var viewModel: ExchangeRatesViewModel
  
  var body: some View {
    contentBody
      .onAppear { viewModel.loadData() }
  }
  
  @ViewBuilder
  var contentBody: some View {
    switch viewModel.contentState {
    case .idle:
      Color.red
    case .loading:
      loadingView
    case .data(let items):
      List {
        Section("How much is UAH today") {
          ForEach(items) { item in
            HStack {
              Text(item.text)
                .fontWeight(item.isHighlighted ? .bold : .regular)
              Spacer()
              Text(item.value)
                .fontWeight(item.isHighlighted ? .bold : .regular)
            }
          }
        }
          .headerProminence(.increased)
      }
    case .error(let message):
      errorView(with: message)
    }
  }
  
  @ViewBuilder
  var loadingView: some View {
    ProgressView()
    Spacer()
  }
  
  func errorView(with message: String) -> some View {
    VStack {
      Text(message)
      Spacer()
    }
  }
}
