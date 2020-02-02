//
//  Reachability.swift
//  Books
//
//  Created by zee on 2/1/20.
//  Copyright © 2020 Jatola IT Services. All rights reserved.
//

import Foundation
import SystemConfiguration

class Reachability {
    static let checkReachable = Reachability()
    private let reachibility = SCNetworkReachabilityCreateWithName(nil, Constants.kPING_URL)
    
     func isConnectedToNetwork() -> Bool {
        var connected = false;
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(self.reachibility!, &flags)
        if(isNetworkReachable(with: flags)){
            print(flags)
            if(flags.contains(.isWWAN)){ connected = true} // Connected via Mobile
            connected = true // connected via Wifi
        }else if(!isNetworkReachable(with: flags)) {print(flags); connected = false}
        return connected
    }
    
    private func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool{
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
//        let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        
        return isReachable && (!needsConnection || canConnectAutomatically)
    }
     
}
