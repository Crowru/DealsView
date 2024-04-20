//
//  File.swift
//  DealsViewer
//
//  Created by Руслан  on 19.04.2024.
//

import SwiftUI

extension View {
    func style(for side: Deal.Side) -> some View {
        switch side {
        case .buy:
            self.foregroundStyle(Color(uiColor: .systemGreen))
        case .sell:
            self.foregroundStyle(Color(uiColor: .systemRed))
        }
    }
}
