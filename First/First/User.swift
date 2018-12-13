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
    static let upgradedNotificationWithInfo = Notification.Name("UserMembershipChanged")
    
    func upgrade(using center: NotificationCenter = NotificationCenter.default) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1) // wait 1 second before posting notif from bg queue
            center.post(name: User.upgradedNotification,
                       object: nil,
                       userInfo: ["level": "gold"])
        }
    }
    
    func upgradeWithInfo() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            let center = NotificationCenter.default
            center.post(name: User.upgradedNotificationWithInfo,
                       object: nil,
                       userInfo: ["level": "gold"])
        }
    }
}
