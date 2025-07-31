//
//  NewCake.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI

struct NewCake: View {
    
    @StateObject var viewModel: CakesViewModel
    @Environment(\.presentationMode) var down
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New cake")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {

                                viewModel.isBack = true
                                
                            }

                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.cVc = viewModel.curVcol
                            viewModel.cKc = viewModel.curKcol
                            viewModel.cPc = viewModel.curPcol
                            
                            viewModel.addCake()
                            
                            viewModel.cName = ""
                            viewModel.cIng = ""
                            viewModel.cPrice = ""
                            
                            viewModel.fetchCakes()
                            
                            withAnimation(.spring()) {
                                
                                down.wrappedValue.dismiss()
                                
                            }

                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                        .opacity(viewModel.cName.isEmpty || viewModel.cIng.isEmpty || viewModel.cPrice.isEmpty ? 0.3 : 1)
                        .disabled(viewModel.cName.isEmpty || viewModel.cIng.isEmpty || viewModel.cPrice.isEmpty ? true : false)
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        ZStack {
                            
                            Image("v\(viewModel.curVcol)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                            
                            Image("k\(viewModel.curKcol)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                            
                            Image("p\(viewModel.curPcol)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 110)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        HStack {
                            
                            Image("v\(viewModel.curVcol)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                            
                            Spacer()
                            
                            ForEach(viewModel.colors, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curVcol = index
                                    
                                }, label: {
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .fill(Color(index))
                                            .frame(width: 15)
                                        
                                        Circle()
                                            .stroke(Color(index), lineWidth: 2)
                                            .frame(width: 20)
                                            .opacity(viewModel.curVcol == index ? 1 : 0)
                                    }
                                })
                            }
                        }
                        
                        HStack {
                            
                            Image("k\(viewModel.curKcol)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                            
                            Spacer()
                            
                            ForEach(viewModel.colors, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curKcol = index
                                    
                                }, label: {
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .fill(Color(index))
                                            .frame(width: 15)
                                        
                                        Circle()
                                            .stroke(Color(index), lineWidth: 2)
                                            .frame(width: 20)
                                            .opacity(viewModel.curKcol == index ? 1 : 0)
                                    }
                                })
                            }
                        }
                        
                        HStack {
                            
                            Image("p\(viewModel.curPcol)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                            
                            Spacer()
                            
                            ForEach(viewModel.colors, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curPcol = index
                                    
                                }, label: {
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .fill(Color(index))
                                            .frame(width: 15)
                                        
                                        Circle()
                                            .stroke(Color(index), lineWidth: 2)
                                            .frame(width: 20)
                                            .opacity(viewModel.curPcol == index ? 1 : 0)
                                    }
                                })
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Cake name")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("Enter cake name")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.cName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.cName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })

                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Ingredients")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("Enter ingredients")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.cIng.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.cIng)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })

                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Price")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("0")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.cPrice.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.cPrice)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })

                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isBack ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isBack = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Unsaved changes")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    Text("Are you sure you want to close? All changes will be lost.")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)

                    Rectangle()
                        .fill(Color("bg2"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 7)
                    
                    HStack {
                        
                        Button(action: {

                            withAnimation(.spring()) {
                                
                                viewModel.isBack = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isBack = false

                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(.red)
                                .font(.system(size: 17, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isBack ? 0 : UIScreen.main.bounds.height)
            }
        )

    }
}

#Preview {
    NewCake(viewModel: CakesViewModel())
}
