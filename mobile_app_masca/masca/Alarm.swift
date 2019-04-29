//
//  Alarm.swift
//  masca
//
//  Created by Jessica Liu on 4/21/19.
//  Copyright © 2019 Tomas Vega. All rights reserved.
//

import Foundation

class Alarm{
    var time: Date = Date()
    var isEnabled: Bool = false
    
    init(time: Date, isEnabled: Bool){
        self.time = time;
        self.isEnabled = isEnabled;
    }
}


