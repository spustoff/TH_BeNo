//
//  CakesView.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI

struct CakesView: View {
    
    @StateObject var viewModel = CakesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("My cakes")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {

                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }

                        }, label: {
                            
                            Text("New cake")
                                .foregroundColor(.red)
                                .font(.system(size: 15, weight: .medium))
                        })

                    }
                }
                .padding()
                
                if viewModel.cakes.isEmpty {
                    
                    VStack {
                        
                        Text("There are no cakes yet")
                            .foregroundColor(.gray.opacity(0.5))
                            .font(.system(size: 22, weight: .semibold))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("+ New cake")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    .frame(maxWidth: .infinity)
                    .background(Color("bg2"))
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.cakes, id: \.self) { index in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Image("v\(index.cVc ?? "")")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 70)
                                            
                                            Image("k\(index.cKc ?? "")")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 70)
                                            
                                            Image("p\(index.cPc ?? "")")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 70)
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 7) {
                                            
                                            Text(index.cName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .medium))
                                            
                                            Text("$ \(index.cPrice ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .medium))
                                        }
                                        .padding(.leading)
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading, spacing: 18) {
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedCake = index
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDelete = true
                                                }
                                                
                                            }, label: {
                                                
                                                Image(systemName: "xmark.circle")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 18, weight: .regular))
                                            })
                                            
                                            Button(action: {
                                                
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDetail.toggle()
                                                }
                                                
                                            }, label: {
                                                
                                                if viewModel.isDetail {
                                                    
                                                    Image(systemName: "chevron.up")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 18, weight: .regular))
                                                    
                                                } else {
                                                    
                                                    Image(systemName: "chevron.down")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 18, weight: .regular))
                                                }
                                            })
                                        }
                                    }
                                    
                                    if viewModel.isDetail {
                                        
                                        VStack(alignment: .leading, spacing: 18) {
                                            
                                            Text("Ingredients")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text(" - \(index.cIng ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                            }
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color("bg2"))
                    .ignoresSafeArea()

                }
            }
            
        }
        .onAppear {
            
            viewModel.fetchCakes()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            NewCake(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Delete this cake?")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("This action cannot be undone.")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .fill(.black.opacity(0.2))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteCake(withCIng: viewModel.selectedCake?.cIng ?? "", completion: {
                                
                                viewModel.fetchCakes()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    CakesView()
}
