//
//  Aid.swift
//  TangoMarathon
//
//  Created by 竹田智哉 on 2022/09/13.
//

import Foundation

struct Aid: Hashable, Codable, Identifiable {
    var id: Int
    var name: String

    var dist: Dist

    private var nextCheckPoint: NextCheckPoint
    private var lastMin: Int {
        let calendar = Calendar(identifier: .gregorian)
        let date = calendar.date(from: DateComponents(year: 2022, month: 9, day: 18))

        let checkPointTime = calendar.date(bySettingHour: nextCheckPoint.hour, minute: nextCheckPoint.min, second: 0, of: date!)
        let start = calendar.date(bySettingHour: 4, minute: 30, second: 0, of: date!)
        let diff = calendar.dateComponents([.minute], from: start!, to: checkPointTime!).minute!
        return diff
    }
    
    var toNextCP: ToNextCP {
        let hour = lastMin / 60
        let min = lastMin - hour * 60
        let minPace = Double(lastMin) / nextCheckPoint.dist
        let secPace = Int(minPace * 60 - floor(minPace) * 60)
        let pace = "キロ \(Int(minPace))分 \(secPace)秒"
        return ToNextCP(time: "\(hour)時間\(min)分", averagePace: pace, dist: "\(nextCheckPoint.dist) km")
    }


    private var drinks: Drinks
    var drink: String {
        var ans = ""
        
        if (drinks.sports) {
            ans += "スポドリ, "
        }
        if (drinks.sp) {
            ans += "SP, "
        }
        if (drinks.hot) {
            ans += "ホット, "
        }
        if (drinks.coke) {
            ans += "コーラ, "
        }

        ans.removeLast(2)

        return ans
    }
    
    private var foods: [String]
    private var hasPine: Bool
    
    var food: String {
        var ans = ""
        foods.forEach { ans += "\($0), " }

        if (hasPine) {
            ans += "🍍, "
        }
        ans += "🍌"
        
        return ans
    }

    struct Drinks: Hashable, Codable {
        var sports: Bool
        var sp: Bool
        var hot: Bool
        var coke: Bool
    }
    
    struct Dist: Hashable, Codable {
        var fromStart: Double
        var nextAid: Double
    }
    
    struct NextCheckPoint: Hashable, Codable {
        var dist: Double
        var hour: Int
        var min: Int
    }
    
    struct ToNextCP: Hashable, Codable {
        var time: String
        var averagePace: String
        var dist: String
    }
}
