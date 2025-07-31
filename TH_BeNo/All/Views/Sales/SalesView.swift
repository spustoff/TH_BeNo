//
//  SalesView.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI

struct SalesView: View {
    
    @StateObject var viewModel = CakesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Sales")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddSale = true
                            }
                            
                        }, label: {
                            
                            Text("New sale")
                                .foregroundColor(.red)
                                .font(.system(size: 15, weight: .medium))
                        })
                        
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 11) {
                        
                        Text("Earned")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("$\(viewModel.earned)")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .semibold))
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                    
                    if viewModel.sales.isEmpty {
                        
                        VStack {
                            
                            Text("There are no sales yet")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 22, weight: .semibold))
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddSale = true
                                }
                                
                            }, label: {
                                
                                Text("+ New sale")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                            })
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color("bg2"))
                        .padding(.top, 150)
                        
                    } else {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.sales, id: \.self) { index in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 7) {
                                            
                                            Text(index.saClient ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .medium))
                                            
                                            Text("$ \(index.saPrice ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .medium))
                                        }
                                        .padding(.leading)
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading, spacing: 18) {
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedSales = index
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDeleteSale = true
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
                                        
                                        HStack {
                                            
                                            ZStack {
                                                
                                                Image("v\(index.saVc ?? "")")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 40)
                                                
                                                Image("k\(index.saKc ?? "")")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 40)
                                                
                                                Image("p\(index.saPc ?? "")")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 40)
                                            }
                                            
                                            Text(index.saCName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 17, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Text(index.saAmo ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 17, weight: .medium))
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
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("bg2"))
                .ignoresSafeArea()

            }
        }
        .onAppear {
            
            viewModel.fetchSales()
        }
        .sheet(isPresented: $viewModel.isAddSale, content: {
            
            NewSale(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteSale ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteSale = false
                        }
                    }
                
                VStack(spacing: 15) {
                    
                    Text("Delete this sale?")
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
                            
                            viewModel.earned -= Int(viewModel.selectedSales?.saPrice ?? "") ?? 0
                            
                            CoreDataStack.shared.deleteSale(withSaClient: viewModel.selectedSales?.saClient ?? "", completion: {
                                
                                viewModel.fetchSales()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteSale = false
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
                                
                                viewModel.isDeleteSale = false
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
                .offset(y: viewModel.isDeleteSale ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SalesView()
}
