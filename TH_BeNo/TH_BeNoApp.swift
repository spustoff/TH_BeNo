//
//  TH_BeNoApp.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI
import OneSignalFramework
import AppTrackingTransparency
import AppsFlyerLib

@main
struct TH_BeNoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
                
            })
            .onAppear {
                requestTrackingAuthorization()
            }
        }
    }
    
    private func requestTrackingAuthorization() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { _ in
                // Трекеры активируются в AppDelegate
            }
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let oneSignalAppId = "cb2f302b-4c41-4f19-9d43-291f907eaddd"
    let appsFlyerDevKey = "SQN5mU6EXA37zzwXPqXsSo"
    let appleAppID = "6749167895"
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        // OneSignal setup (v5+)
        OneSignal.initialize(oneSignalAppId) // <-- замени на свой ID
        
        // Запрос разрешения на пуши
        OneSignal.Notifications.requestPermission({ accepted in
            print("User accepted notifications: \(accepted)")
        }, fallbackToSettings: true)
        
        // AppsFlyer setup
        AppsFlyerLib.shared().appsFlyerDevKey = appsFlyerDevKey
        AppsFlyerLib.shared().appleAppID = appleAppID
        AppsFlyerLib.shared().delegate = self
        AppsFlyerLib.shared().isDebug = true
        AppsFlyerLib.shared().start()
        
        return true
    }
    
    // Deep Link и атрибуция
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        AppsFlyerLib.shared().handleOpen(url, options: options)
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        AppsFlyerLib.shared().continue(userActivity, restorationHandler: nil)
        return true
    }
}

// MARK: - AppsFlyerLibDelegate
extension AppDelegate: AppsFlyerLibDelegate {
    func onConversionDataSuccess(_ data: [AnyHashable : Any]) {
        print("AppsFlyer conversion data: \(data)")
    }
    
    func onConversionDataFail(_ error: Error) {
        print("AppsFlyer conversion error: \(error)")
    }
}
