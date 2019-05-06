import Foundation
import UIKit

/*
 Provides delegate function defintions for UITableView, used to list and interact with alarms
 */
class alarmTableDelegate: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var alarmsManager = AlarmsManager.shared
    var alarmTableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableViewCell", for: indexPath) as! AlarmTableViewCell;
        
        func getDateString(alarm: Alarm) -> String{
            let alarmFormatter = DateFormatter();
            alarmFormatter.timeStyle = DateFormatter.Style.short
            let alarmString = alarmFormatter.string(from: alarm.time);
            return alarmString;
        }
        
        //lazy sorting to become alphabetical
        //unfortunately this "laziness" doesn't matter much because we can't bulk-create alarms:(
        alarmsManager.alarms = alarmsManager.alarms.sorted(by: { $0.time < $1.time })
        
        //cell.timeLabel?.text = getDateString()
        cell.timeLabel?.text = getDateString(alarm: alarmsManager.alarms[indexPath.row])
        cell.numAlarmLabel?.text = "Alarm \(indexPath.row+1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.alarmTableView == nil {
            self.alarmTableView = tableView
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false;
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return false;
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the row from the data source
            alarmsManager.deleteAlarm(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
