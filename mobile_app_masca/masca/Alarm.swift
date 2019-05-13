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
    var rehearseAlarms = [Alarm]()
    var rehearseTimeSet = Set<Date>(); //check for time uniqueness for alarms
    var learningAlarms = [Alarm]()
    var learningTimeSet = Set<Date>();
    
    static let shared = AlarmsManager();
    
    private override init(){
        super.init();
        
        let defaults = UserDefaults.standard;
        let decoder = JSONDecoder();
        
        /*let savedRehearseAlarms = defaults.object(forKey: "rehearseAlarms") as? Data;
        let savedRehearseTimeSet = defaults.object(forKey: "rehearseTimeSet") as? Data;
        let savedLearningAlarms = defaults.object(forKey: "learningAlarms") as? Data;
        let savedLearningTimeSet = defaults.object(forKey: "learningTimeSet") as? Data;*/
        
        /*if (savedRehearseAlarms != nil && savedRehearseTimeSet != nil){
            do{
                let loadedRehearseAlarms = try decoder.decode([Alarm].self, from: savedRehearseAlarms!);
                let loadedRehearseTimeSet = try decoder.decode(Set<Date>.self, from: savedRehearseTimeSet!);
                
                rehearseAlarms = loadedRehearseAlarms;
                rehearseTimeSet = loadedRehearseTimeSet;
            }
            catch{
                print("could not load rehearse alarms and timeset");
            }
        }
        
        if (savedLearningAlarms != nil && savedLearningTimeSet != nil){
            do{
                let loadedLearningAlarms = try decoder.decode([Alarm].self, from: savedLearningAlarms!);
                let loadedLearningTimeSet = try decoder.decode(Set<Date>.self, from: savedLearningTimeSet!);
                
                learningAlarms = loadedLearningAlarms;
                learningTimeSet = loadedLearningTimeSet;
            }
            catch{
                print("could not load learning alarms and timeset");
            }
        }*/
        /*if (savedAlarms != nil && savedTimeSet != nil){
            do{
                let loadedAlarms = try decoder.decode([Alarm].self, from: savedAlarms!)
                let loadedTimeSet = try decoder.decode(Set<Date>.self, from: savedTimeSet!);
                
                alarms = loadedAlarms;
                timeSet = loadedTimeSet;
            }
            catch{
                print("could not retrieve loaded alarms and timeset");
            }
        }*/
    }
    
    
    func addAlarm(alarm: Alarm, alarms: inout [Alarm], timeSet: inout Set<Date>){
        //var alarms = alarms;
        //var timeSet = timeSet;
        
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
    
    func encodeAlarms(alarms: [Alarm], timeSet: Set<Date>, alarmKey: String, timeSetKey: String){
        let encoder = JSONEncoder()
        if let encodedAlarms = try? encoder.encode(alarms){
            let defaults = UserDefaults.standard
            defaults.set(encodedAlarms, forKey:alarmKey);
        }
         
        if let encodedTimeSet = try? encoder.encode(timeSet){
            let defaults = UserDefaults.standard
            defaults.set(encodedTimeSet, forKey:timeSetKey);
        }
    }
    
    func addRehearseAlarm(alarm: Alarm){
        addAlarm(alarm: alarm, alarms: &rehearseAlarms, timeSet: &rehearseTimeSet)
        encodeAlarms(alarms: rehearseAlarms, timeSet: rehearseTimeSet, alarmKey: "rehearseAlarms", timeSetKey: "rehearseTimeSet")
    }
    
    func addLearningAlarm(alarm: Alarm){
        addAlarm(alarm: alarm, alarms: &learningAlarms, timeSet: &learningTimeSet)
        encodeAlarms(alarms: learningAlarms, timeSet: learningTimeSet, alarmKey: "learningAlarms", timeSetKey: "learningTimeSet")
    }
     
    /*func deleteAlarm(index: Int){
        let deletedAlarm = alarms[index];
        timeSet.remove(deletedAlarm.time);
        alarms.remove(at:index);
    }*/
}
