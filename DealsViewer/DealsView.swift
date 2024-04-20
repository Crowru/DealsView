//
//  ContentView.swift
//  DealsViewer
//
//  Created by Руслан  on 19.04.2024.
//

import SwiftUI

struct DealsView: View {
    
    @StateObject private var viewModel = DealsViewViewModel()
        
    var body: some View {
        NavigationStack {
            headerView
                .padding(.horizontal, 40)
                .padding(.vertical, 5)
            
            Divider()
            
            ScrollView {
                LazyVStack {
                    ForEach(
                        Array(viewModel.paginationDeals.enumerated()),
                        id: \.offset
                    ) { _, deal in
                        DealCellView(deal: deal)
                            .padding(.vertical, 5)
                            .onAppear {
                                viewModel.paginationData(deal: deal)
                            }
                    }
                }
                .padding(.horizontal, 30)
            }
            
            .onChange(of: viewModel.typeOrder) {
                viewModel.sortedDeals()
            }
            .onChange(of: viewModel.sortOrder) {
                viewModel.sortedDeals()
            }
            
            .navigationTitle("Deals")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                Button("", systemImage: viewModel.sortOrder == .lessToMore ? "arrowtriangle.up" : "arrowtriangle.down") {
                    viewModel.toogleSortOrder()
                }
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $viewModel.typeOrder) {
                        Text("Дата изменения сделки")
                            .tag(TypesOrder.dateModifier)
                        Text("Имя инструмента")
                            .tag(TypesOrder.instrument)
                        Text("Цена сделки")
                            .tag(TypesOrder.price)
                        Text("Объем сделки")
                            .tag(TypesOrder.amount)
                        Text("Сторона сделки")
                            .tag(TypesOrder.side)
                    }
                }
            }
        }
    }
}

// MARK: - header view
private extension DealsView {
    
    var headerView: some View {
        HStack {
            Text("Instrument")
            Spacer()
            Text("Price")
            Spacer()
            Text("Amount")
            Spacer()
            Text("Side")
        }
        .font(.caption)
    }
}

#Preview {
    DealsView().headerView
}

#Preview {
    DealsView()
}
