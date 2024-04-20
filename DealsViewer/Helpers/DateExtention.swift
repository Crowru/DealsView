//
//  DateExtention.swift
//  FriendFace
//
//  Created by Руслан  on 19.04.2024.
//

import Foundation

extension Date {
    func formattedDate(_ dateStyle: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        return dateFormatter.string(from: self)
    }
}
