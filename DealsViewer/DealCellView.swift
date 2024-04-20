//
//  DealCellView.swift
//  DealsViewer
//
//  Created by Руслан  on 19.04.2024.
//

import SwiftUI

struct DealCellView: View {
    
    let deal: Deal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(deal.dateModifier.formatted(date: .numeric, time: .standard))
                .foregroundStyle(.secondary)
                .font(.caption)
            GeometryReader { geometry in
                HStack() {
                    Text(deal.instrumentName)
                        .frame(width: geometry.size.width / 4)
                                        
                    Text(deal.roundedPrice)
                        .frame(width: geometry.size.width / 4)
                                        
                    Text(deal.roundedAmount
                        .formatted(.number.grouping(.automatic))
                    )
                    .frame(width: geometry.size.width / 4)
                                        
                    Text(deal.side.rawValue)
                        .frame(width: geometry.size.width / 4)
                        .style(for: deal.side)
                }
                .lineLimit(0)
                .font(.caption)
            }
            Divider()
        }
    }
}

#Preview {
    DealCellView(deal: Deal.example[0])
}
