//
//  User.swift
//  First
//
//  Created by beshbashbosh on 13/12/2018.
//  Copyright © 2018 beshbashbosh. All rights reserved.
//

import Foundation

struct User {
    static let upgradedNotification = Notification.Name("UserUpgraded")
    
    func upgrade() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1) // wait 1 second before posting notif from bg queue
            let center = NotificationCenter.default
            center.post(name: User.upgradedNotification, object: nil)
        }
    }
}
