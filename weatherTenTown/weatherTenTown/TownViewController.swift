import UIKit
import Alamofire

class TownViewController: UIViewController {
    var weatherTown:Weather?
    var lat=0.0
    var lng=0.0
    var town=""
    init?(lat:Double,lng:Double, town:String)
    {
        super.init(nibName: nil, bundle: nil)
        self.lat=lat
        self.lng=lng
        self.town=town
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherLoader().loadWeather(lat:lat ,lng:lng, completion: { [self] weather in
            self.weatherTown=weather
            self.setup()
            })
    }
    
    func setup() {
            let scrollView=UIScrollView()
            scrollView.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1500)
            view.addSubview(scrollView)
            scrollView.translatesAutoresizingMaskIntoConstraints=false
        NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
        
            let backImageView=UIImageView()
           
            backImageView.image=UIImage(named: "back")
            view.addSubview(backImageView)
        backImageView.translatesAutoresizingMaskIntoConstraints=false
        backImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive=true
        backImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive=true
        backImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive=true
        backImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive=true
        
        
            let nameTownLabel=UILabel()
            nameTownLabel.font=nameTownLabel.font.withSize(20)
            nameTownLabel.textColor=UIColor.white
            nameTownLabel.text=town
            nameTownLabel.textAlignment = .center
            nameTownLabel.font = UIFont.boldSystemFont(ofSize: nameTownLabel.font.pointSize)
            view.addSubview(nameTownLabel)
        
        nameTownLabel.translatesAutoresizingMaskIntoConstraints=false
        nameTownLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100).isActive=true
        nameTownLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        nameTownLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
            
            let tempCurrentLabel=UILabel()
            tempCurrentLabel.font=tempCurrentLabel.font.withSize(55)
            tempCurrentLabel.textColor=UIColor.white
            tempCurrentLabel.text="\(Int(weatherTown?.fact?.temp ?? 0))°"
            tempCurrentLabel.textAlignment = .center
            tempCurrentLabel.font = UIFont.boldSystemFont(ofSize: tempCurrentLabel.font.pointSize)
            view.addSubview(tempCurrentLabel)
        tempCurrentLabel.translatesAutoresizingMaskIntoConstraints=false
        tempCurrentLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 150).isActive=true
        tempCurrentLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        tempCurrentLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
            let mainLabel=UILabel()
            mainLabel.font=tempCurrentLabel.font.withSize(18)
            mainLabel.textColor=UIColor.white
        switch weatherTown?.fact?.condition {
        case "clear":
            mainLabel.text="ясно"
        case "partly-cloudy":
            mainLabel.text="малооблачно"
        case "cloudy":
            mainLabel.text="облачно с прояснениями"
        case "overcast":
            mainLabel.text="пасмурно"
        case "drizzle":
            mainLabel.text="морось"
        case "light-rain":
            mainLabel.text="небольшой дождь"
        case "rain":
            mainLabel.text="дождь"
        case "moderate-rain":
            mainLabel.text="умеренно сильный дождь"
        case "heavy-rain":
            mainLabel.text="сильный дождь"
        case "continuous-heavy-rain":
            mainLabel.text="длительный сильный дождь"
        case "showers":
            mainLabel.text="ливень"
        case "wet-snow":
            mainLabel.text="дождь со снегом"
        case "light-snow":
            mainLabel.text="небольшой снег"
        case "snow":
            mainLabel.text="снег"
        default:
            break
        }
        
            mainLabel.textAlignment = .center
            mainLabel.font = UIFont.boldSystemFont(ofSize: mainLabel.font.pointSize)
            scrollView.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints=false
        mainLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 220).isActive=true
        mainLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        mainLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
            
            let maxMinTempLabel=UILabel()
            maxMinTempLabel.font=tempCurrentLabel.font.withSize(15)
            maxMinTempLabel.textColor=UIColor.white
        maxMinTempLabel.text="Макс \(Int((weatherTown?.forecasts![0].parts?.day?.temp_max)!))°," + " мин \(Int((weatherTown?.forecasts![0].parts?.day?.temp_min)!))°"
            maxMinTempLabel.textAlignment = .center
            view.addSubview(maxMinTempLabel)
        maxMinTempLabel.translatesAutoresizingMaskIntoConstraints=false
        maxMinTempLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 240).isActive=true
        maxMinTempLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        maxMinTempLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
            

       
           let tableViewDaily=UITableView()
        tableViewDaily.backgroundColor = .clear
        tableViewDaily.delegate=self
        tableViewDaily.dataSource=self
        tableViewDaily.register(DailyCell.self, forCellReuseIdentifier: "DailyCell")
        tableViewDaily.tableFooterView = UIView()
        view.addSubview(tableViewDaily)
        tableViewDaily.translatesAutoresizingMaskIntoConstraints=false
        tableViewDaily.tableFooterView = UIView()
        NSLayoutConstraint(item: tableViewDaily, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: tableViewDaily, attribute: .trailing, relatedBy: .equal, toItem: scrollView, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: tableViewDaily, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1.0, constant: 300.0).isActive = true
        NSLayoutConstraint(item: tableViewDaily, attribute: .bottom, relatedBy: .equal, toItem: scrollView, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
            
        }

   

}


extension TownViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyCell", for: indexPath) as! DailyCell
        let epochTime = weatherTown?.forecasts?[indexPath.row].date_ts
        let newTime = Date(timeIntervalSince1970: TimeInterval(epochTime!))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
        let dateObj = dateFormatter.date(from: "\(newTime)")
        dateFormatter.dateFormat = "dd.MM"
        cell.dataLabel.text="\(dateFormatter.string(from: dateObj!))"
        cell.backgroundColor = .clear
        var URLString=""
        if let icon=weatherTown?.forecasts?[indexPath.row].parts?.day?.icon {
            URLString="https://yastatic.net/weather/i/icons/funky/dark/\(icon).svg"
        }
        if let imageURL = URL(string: URLString)
               {
                let requestObj = URLRequest(url: imageURL)
            cell.mainImageView.load(requestObj)
               }
        cell.dayTempLabel.text="\(Int((weatherTown?.forecasts?[indexPath.row].parts?.day?.temp_avg)!))"
        cell.nightTempLabel.text="\(Int((weatherTown?.forecasts?[indexPath.row].parts?.night?.temp_avg)!))"
        if weatherTown?.forecasts?[indexPath.row].parts?.day?.humidity==0 {cell.popLabel.text=""}
        else {
            cell.popLabel.text="\(Int(weatherTown?.forecasts?[indexPath.row].parts?.day?.humidity ?? 0))%"
        }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}





