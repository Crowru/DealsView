//
//  Deal.swift
//  DealsViewer
//
//  Created by Руслан  on 19.04.2024.
//

import Foundation

struct Deal: Identifiable, Hashable, Comparable {
    
    enum Side: String, CaseIterable, Comparable {
        static func < (lhs: Deal.Side, rhs: Deal.Side) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
        
        case sell, buy
    }
    
    let id: Int64
    let dateModifier: Date
    let instrumentName: String
    let price: Double
    let amount: Double
    let side: Side
    
    var roundedPrice: String {
        String(format:"%.2f", price)
    }
    
    var roundedAmount: Double {
        Double(String(format:"%.0f", amount)) ?? 0
    }
    
    static func < (lhs: Deal, rhs: Deal) -> Bool {
        lhs.dateModifier < rhs.dateModifier
    }
    
    static func > (lhs: Deal, rhs: Deal) -> Bool {
        lhs.dateModifier > rhs.dateModifier
    }
}

extension Deal {
    static let example = [
        Deal(
            id: Int64.random(in: 0...1_000_000),
            dateModifier: .now,
            instrumentName: "RUBUSD",
            price: 65.340000,
            amount: 1_000_000.64350,
            side: .buy
        ),
        Deal(
            id: Int64.random(in: 0...1_000_000),
            dateModifier: .now,
            instrumentName: "USD",
            price: 64.340000,
            amount: 1_030_040.64350,
            side: .buy
        ),
        Deal(
            id: Int64.random(in: 0...1_000_000),
            dateModifier: .now,
            instrumentName: "USDRUB",
            price: 63.340000,
            amount: 1_040_000.64350,
            side: .buy
        ),
    ]
}
