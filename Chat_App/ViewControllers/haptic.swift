//
//  haptic.swift
//  
//
//  Created by r85 on 21/08/23.
//

import UIKit

class HapticManager {
    static let shared = HapticManager()
    
    private init() {}
    
    public func selectionVbreate() {
        DispatchQueue.main.async {
            let selectorFeedbackGenerator = UISelectionFeedbackGenerator()
            selectorFeedbackGenerator.prepare()
            selectorFeedbackGenerator.selectionChanged()
        }
    }
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType){
        DispatchQueue.main.async {
            let notificationGenerator = UINotificationFeedbackGenerator()
            notificationGenerator.prepare()
            notificationGenerator.notificationOccurred(type)
        }
    }
}
