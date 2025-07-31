//
//  DateConvert.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI

extension Date {
    
    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
}
