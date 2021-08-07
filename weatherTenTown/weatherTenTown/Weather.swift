import Foundation

class Weather: Codable {
    let now:Int
    let now_dt:String
    let info:Info?
    let fact:Fact?
    let forecasts:[Forecasts]?
   
}
class Info: Codable {
    let lat:Double
    let lon:Double
    let tzinfo:Tzinfo?
    let def_pressure_mm:Double
    let def_pressure_pa:Double
    let url:String
}
class Fact: Codable{
    let temp:Double
    let feels_like:Double
    let icon:String
    let condition:String
    let wind_speed:Double
    let wind_gust:Double
    let wind_dir:String
    let pressure_mm:Double
    let pressure_pa:Double
    let humidity:Double
    let daytime:String
    let polar:Bool
    let season:String
    let obs_time:Double
    let is_thunder:Bool
    let prec_type:Int
    let prec_strength:Double
    let cloudness:Double
    //@objc dynamic var phenom_icon=""
    //@objc dynamic var phenom_condition=""
    
}
class Forecasts: Codable{
    let date:String
    let date_ts:Double
    let week:Int
    let sunrise:String
    let sunset:String
    let moon_code:Int
    let moon_text:String
    let parts:Parts?
    let night:Night?
    let day_short:Day_short?
    let hours:[Hours]?
   // @objc dynamic var hour=""
    //@objc dynamic var hour_ts=0
    
}
class Tzinfo: Codable {
    let offset:Int
    let name:String
    let abbr:String
    let dst:Bool

}
class Parts: Codable {
    let night:Night?
    let morning:Morning?
    let day:Day?
    let evening: Evening?
    let day_short:Day_short?
    let night_short:Night_short?

}
class Night: Codable{
    let temp_min:Double
    let temp_max:Double
    let temp_avg:Double
    let feels_like:Double
    let icon:String
    let condition:String
    let daytime:String
    let polar:Bool
    let wind_speed:Double
    let wind_gust:Double
    let wind_dir:String
    let pressure_mm:Double
    let pressure_pa:Double
    let humidity:Double
    let prec_mm:Double
    let prec_period:Double
    let prec_type:Int
    let prec_strength:Double
    let cloudness:Double
}
class Morning: Codable{
    let temp_min:Double
    let temp_max:Double
    let temp_avg:Double
    let feels_like:Double
    let icon:String
    let condition:String
    let daytime:String
    let polar:Bool
    let wind_speed:Double
    let wind_gust:Double
    let wind_dir:String
    let pressure_mm:Double
    let pressure_pa:Double
    let humidity:Double
    let prec_mm:Double
    let prec_period:Double
    let prec_type:Int
    let prec_strength:Double
    let cloudness:Double
}
class Day:Codable{
    let temp_min:Double
    let temp_max:Double
    let temp_avg:Double
    let feels_like:Double
    let icon:String
    let condition:String
    let daytime:String
    let polar:Bool
    let wind_speed:Double
    let wind_gust:Double
    let wind_dir:String
    let pressure_mm:Double
    let pressure_pa:Double
    let humidity:Double
    let prec_mm:Double
    let prec_period:Double
    let prec_type:Int
    let prec_strength:Double
    let cloudness:Double
}
class Evening: Codable{
    let temp_min:Double
    let temp_max:Double
    let temp_avg:Double
    let feels_like:Double
    let icon:String
    let condition:String
    let daytime:String
    let polar:Bool
    let wind_speed:Double
    let wind_gust:Double
    let wind_dir:String
    let pressure_mm:Double
    let pressure_pa:Double
    let humidity:Double
    let prec_mm:Double
    let prec_period:Double
    let prec_type:Int
    let prec_strength:Double
    let cloudness:Double
}
class Night_short: Codable{
    let temp:Double
    let feels_like:Double
    let icon:String
    let condition:String
    let daytime:String
    let polar:Bool
    let wind_speed:Double
    let wind_gust:Double
    let wind_dir:String
    let pressure_mm:Double
    let pressure_pa:Double
    let humidity:Double
    let prec_mm:Double
    let prec_period:Double
    let prec_type:Int
    let prec_strength:Double
    let cloudness:Double
}
class Day_short: Codable{
    let temp:Double
    let temp_min:Double
    let feels_like:Double
    let icon:String
    let wind_speed:Double
    let wind_gust:Double
    let wind_dir:String
    let pressure_mm:Double
    let pressure_pa:Double
    let humidity:Double
    let prec_type:Int
    let prec_strength:Double
    let cloudness:Double
}
class Hours: Codable{
    let hour:String
    let hour_ts:Int
    let temp:Double
    let feels_like:Double
    let icon:String
    let condition:String
    let wind_speed:Double
    let wind_gust:Double
    let wind_dir:String
    let pressure_mm:Double
    let pressure_pa:Double
    let humidity:Double
    let prec_mm:Double
    let prec_period:Double
    let prec_type:Int
    let prec_strength:Double
    let is_thunder:Bool
    let cloudness:Double
}
struct CustomDecodeError: Codable {

    let detail: String?
    init(description: String?) {
    detail = description
    }

}

