//
//  DealsViewViewModel.swift
//  DealsViewer
//
//  Created by Руслан  on 19.04.2024.
//

import Foundation

final class DealsViewViewModel: ObservableObject {
    
    @Published var paginationDeals: [Deal]
    @Published var typeOrder: TypesOrder
    @Published var sortOrder: SortOrder
    
    private let server: Server
    private let paginationMaxCount: Int
    private var deals: [Deal]
    private var paginationDealsCount: Int
    
    init() {
        self.paginationDealsCount = .zero
        self.deals = []
        self.paginationDeals = []
        self.typeOrder = .dateModifier
        self.sortOrder = .lessToMore
        self.server = Server()
        self.paginationMaxCount = Server().dealsCountInPacket
        self.fetchData()
    }
    
    func toogleSortOrder() {
        if sortOrder == .lessToMore {
            sortOrder = .moreToLess
        } else {
            sortOrder = .lessToMore
        }
    }
    
    func paginationData(deal: Deal) {
        if deal == paginationDeals.last {
            (paginationDealsCount...paginationDealsCount + paginationMaxCount - 1).forEach {
                let value = deals[$0]
                paginationDeals.append(value)
            }
            paginationDeals = sortedDeals(deals: paginationDeals, typeOrder: typeOrder, sortOrder: sortOrder)
            paginationDealsCount += paginationMaxCount - 1
        }
    }
    
    func sortedDeals() {
        paginationDeals = sortedDeals(deals: paginationDeals, typeOrder: typeOrder, sortOrder: sortOrder)
    }
    
    private func sortedDeals(deals: [Deal], typeOrder: TypesOrder, sortOrder: SortOrder) -> [Deal] {
        var sortedDeals = deals
        
        switch (typeOrder, sortOrder) {
        case (.dateModifier, .lessToMore):
            sortedDeals.sort { $0 < $1 }
        case (.dateModifier, .moreToLess):
            sortedDeals.sort { $0 > $1 }
        case (.instrument, .lessToMore):
            sortedDeals.sort { $0.instrumentName < $1.instrumentName }
        case (.instrument, .moreToLess):
            sortedDeals.sort { $0.instrumentName > $1.instrumentName }
        case (.price, .lessToMore):
            sortedDeals.sort { $0.price < $1.price }
        case (.price, .moreToLess):
            sortedDeals.sort { $0.price > $1.price }
        case (.amount, .lessToMore):
            sortedDeals.sort { $0.amount < $1.amount }
        case (.amount, .moreToLess):
            sortedDeals.sort { $0.amount > $1.amount }
        case (.side, .lessToMore):
            sortedDeals.sort { $0.side < $1.side }
        case (.side, .moreToLess):
            sortedDeals.sort { $0.side > $1.side }
        }
        
        return sortedDeals
    }
    
    private func fetchData() {
        server.subscribeToDeals { deals in
            self.deals.append(contentsOf: deals)
            self.startData()
        }
    }
    
    private func startData() {
        if deals.count == paginationMaxCount {
            (0...9).forEach {
                paginationDeals.append(deals[$0])
            }
        }
    }
}
