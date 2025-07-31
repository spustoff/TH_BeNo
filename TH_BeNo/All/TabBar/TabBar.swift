//
//  TabBar.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Rectangle()
                            .fill(.gray.opacity(0.13))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray.opacity(0.5))
                            .frame(width: 15, height: 15)

                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray.opacity(0.5))
                            .font(.system(size: 13, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 25)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color.black))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Cakes = "My cakes"
    
    case Sales = "Sales"
    
    case Settings = "Settings"

}
