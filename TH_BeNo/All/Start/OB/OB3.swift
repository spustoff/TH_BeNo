//
//  OB3.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI

struct OB3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("ob3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Monitor your earnings and note your customers")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                    
                    Spacer()
                    
                    Button(action: {
                        
                       status = true
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    .padding()
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 18).fill(Color("prim")))
                    .frame(maxWidth: .infinity, alignment: .trailing)

                }
                .padding(30)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 200)
                .background(Color("bg2"))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    OB3()
}
