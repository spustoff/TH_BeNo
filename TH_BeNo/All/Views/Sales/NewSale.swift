//
//  NewSale.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI

struct NewSale: View {
    
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
                            
                            viewModel.saKc = viewModel.selectedCake?.cKc ?? ""
                            viewModel.saPc = viewModel.selectedCake?.cPc ?? ""
                            viewModel.saVc = viewModel.selectedCake?.cVc ?? ""
                            viewModel.saPrice = viewModel.selectedCake?.cPrice ?? ""
                            viewModel.saCName = viewModel.selectedCake?.cName ?? ""
                            
                            viewModel.addSale()
                            
                            viewModel.saNot = ""
                            viewModel.saClient = ""
                            
                            viewModel.fetchSales()
                            
                            viewModel.selCa = ""
                            
                            viewModel.earned += Int(viewModel.selectedCake?.cPrice ?? "") ?? 0
                            
                            withAnimation(.spring()) {
                                
                                down.wrappedValue.dismiss()
                                
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                        .opacity(viewModel.saClient.isEmpty || viewModel.selCa.isEmpty ? 0.3 : 1)
                        .disabled(viewModel.saClient.isEmpty || viewModel.selCa.isEmpty ? true : false)
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isChoose = true
                            }
                            
                        }, label: {
                            
                            if viewModel.selCa.isEmpty {
                                
                                Text("+ Choose a cake")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(7)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 6).fill(.black))
                                
                            } else {
                                
                                Text("Change the cake")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(7)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 6).fill(.black))
                            }
                        })
                        
                        if !viewModel.selCa.isEmpty {
                            
                            HStack {
                                
                                ZStack {
                                    
                                    Image("v\(viewModel.selectedCake?.cVc ?? "")")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 70)
                                    
                                    Image("k\(viewModel.selectedCake?.cKc ?? "")")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 70)
                                    
                                    Image("p\(viewModel.selectedCake?.cPc ?? "")")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 70)
                                }
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text(viewModel.selectedCake?.cName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .medium))
                                    
                                    Text("$ \(viewModel.selectedCake?.cPrice ?? "")")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .medium))
                                }
                                .padding(.leading)
                                
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 110)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Amount")
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.saAmo.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.saAmo)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Client")
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter client name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.saClient.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.saClient)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Notes")
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter notes")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.saNot.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.saNot)
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
                                
                                viewModel.isAddSale = false
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
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isChoose ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isChoose = false
                        }
                    }
                
                VStack(spacing: 15) {
                    
                    ZStack {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isChoose = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .regular))
                                
                            })
                            
                            Spacer()
                            
                        }
                        
                        Text("Cakes")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        if viewModel.cakes.isEmpty {
                            
                            Text("Empty, add cake in a first tab")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 16, weight: .semibold))
                            
                        } else {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.cakes, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedCake = index
                                        
                                        viewModel.selCa = viewModel.selectedCake?.cName ?? ""
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isChoose = false
                                        }
                                        
                                    }, label: {
                                        
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
                                                
                                            }
                                            
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                                    })
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .bottom)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .offset(y: viewModel.isChoose ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchCakes()
        }
        
    }
}

#Preview {
    NewSale(viewModel: CakesViewModel())
}
