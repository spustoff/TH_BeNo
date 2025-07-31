//
//  OB1.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI

struct OB1: View {
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("ob1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Add your own cakes and customize their appearance")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        OB2()
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
    OB1()
}
