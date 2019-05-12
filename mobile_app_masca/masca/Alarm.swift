//
//  Alarm.swift
//  masca
//
//  Created by Jessica Liu on 4/21/19.
//  Copyright © 2019 Tomas Vega. All rights reserved.
//

import Foundation

struct Alarm:Codable{
    var time: Date
    var isEnabled: Bool
    
}

class AlarmsManager:NSObject{
    var alarms = [Alarm]()
    var timeSet = Set<Date>(); //check for time uniqueness for alarms
    //var alarms = [Date : Alarm]()
    static let shared = AlarmsManager();
    
    private override init(){
        super.init();
        
        let defaults = UserDefaults.standard;
        let decoder = JSONDecoder();
        
        let savedAlarms = defaults.object(forKey: "alarms") as? Data;
        let savedTimeSet = defaults.object(forKey: "timeSet") as? Data;
        
        if (savedAlarms != nil && savedTimeSet != nil){
            do{
                /*let loadedAlarms = try decoder.decode([Alarm].self, from: savedAlarms!)
                let loadedTimeSet = try decoder.decode(Set<Date>.self, from: savedTimeSet!);
                
                alarms = loadedAlarms;
                timeSet = loadedTimeSet;*/
            }
            catch{
                print("could not retrieve loaded alarms and timeset");
            }
        }        
    }
    
    func addAlarm(alarm: Alarm){
        if (!timeSet.contains(alarm.time)){
            print("do we get here???")
            print("is the alarm nil")
            print(alarm == nil)
            alarms.append(alarm);
            timeSet.insert(alarm.time);
        }
     
        /*let encoder = JSONEncoder()
        if let encodedAlarms = try? encoder.encode(alarms){
            let defaults = UserDefaults.standard
            defaults.set(encodedAlarms, forKey:"alarms");
        }
        
        if let encodedTimeSet = try? encoder.encode(timeSet){
            let defaults = UserDefaults.standard
            defaults.set(encodedTimeSet, forKey:"timeSet");
        }*/
        
        print("if we do, this is the state of alarms")
        print(alarms)
    }
     
    func deleteAlarm(index: Int){
        let deletedAlarm = alarms[index];
        timeSet.remove(deletedAlarm.time);
        alarms.remove(at:index);
    }

    /*func addAlarm(time: Date, isEnabled: Bool){
        let newAlarm = Alarm(time: time, isEnabled: isEnabled);
        
        if let a = alarms[time]{
            alarms[time] = a;
        }else{
            alarms[time] = newAlarm;
        }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(alarms){
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey:"alarms");
        }
    }

    func deleteAlarm(time: Date){
        alarms.removeValue(forKey: time);
    }*/
}
/*class Alarm{
    var time: Date = Date()
    var isEnabled: Bool = false
    
    init(time: Date, isEnabled: Bool){
        self.time = time;
        self.isEnabled = isEnabled;
    }
}*/

