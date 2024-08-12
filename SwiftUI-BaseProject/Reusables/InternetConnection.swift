//
//  InternetConnection.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 22/07/22.
//

import SwiftUI
import Network

class InternetConnection:ObservableObject{
    
    @Published var isConnected = true
    
    
    init() {
        checkNetworkConnection()
    }
    
    func checkNetworkConnection(){
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkManager")
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
    
}
