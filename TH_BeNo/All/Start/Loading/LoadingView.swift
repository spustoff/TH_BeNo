//
//  LoadingView.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
