//
//  Alarm.swift
//  masca
//
//  Created by Jessica Liu on 4/21/19.
//  Copyright © 2019 Tomas Vega. All rights reserved.
//

import Foundation

class Alarm{
    var date: Date = Date()
    var isEnabled: Bool = false
    
    init(date: Date, enabled: Bool){
        self.date = date;
        self.isEnabled = enabled;
    }
}


