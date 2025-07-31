//
//  SettingsView.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {

    ZStack {
        
        Color.black
            .ignoresSafeArea()
        
        VStack {
            
            Text("Settings")
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .medium))
                .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15) {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        Text("Rate the app")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium))
                            .padding(13)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("bg3")))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/96b869b6-b8db-4b67-ae5e-b2a2c3f16dfa") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium))
                            .padding(13)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("bg3")))
                    })
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("bg2"))
            .ignoresSafeArea()
        }
        }
    }
}

#Preview {
    SettingsView()
}
