//
//  UIControl.swift
//  DaftTap Challenge
//
//  Created by Karol Struniawski on 06/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import UIKit

extension UIControl {

    func simulateTap() {
        sendActions(for: .touchDown)
        sendActions(for: .touchUpInside)
    }

}
