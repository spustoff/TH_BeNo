//
//  OB2.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI

struct OB2: View {
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("ob2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Collect all your cakes in one place so you don't lose them")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        OB3()
                            .navigationBarBackButtonHidden()
                        
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
    OB2()
}
