
import UIKit
import Foundation
import AlamofireImage
class ViewController: UIViewController {
    var weather:[Weather]=[]
    let lat=[56.8, 55.75, 59.938, 51.508, 40.714, 41.014, 39.907, 35.689, -33.868, -15.779]
    let lng=[60.61, 37.616, 30.314, -0.126, -74.006, 28.95, 116.397, 139.6917, 151.207, -47.929]
    let town=["Екатеринбург","Москва","Санкт-Петербург","Лондон","Нью-Йорк","Стамбул","Пекин","Токио","Сидней","Бразилиа"]
    override func viewDidLoad() {
        super.viewDidLoad()
       setup()
    
        
    }

    func setup(){
        let backImageView=UIImageView()
        backImageView.image=UIImage(named: "back")
        backImageView.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(backImageView)
        NSLayoutConstraint(item: backImageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: backImageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: backImageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: backImageView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
        
        let adressbar=UISearchBar()
        adressbar.showsScopeBar = true
        adressbar.delegate = self
        view.addSubview(adressbar)
        adressbar.translatesAutoresizingMaskIntoConstraints=false
        NSLayoutConstraint(item: adressbar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: adressbar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: adressbar, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
        adressbar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints=false
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        
        NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: adressbar, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource=self
        tableView.delegate=self
        
       
    }
 
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var weatherCell:Weather?
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        WeatherLoader().loadWeather(lat:lat[indexPath.row] ,lng:lng[indexPath.row], completion: { [self]weather in
            weatherCell=weather
            cell.backgroundColor = .clear
            cell.nameLabel.text=town[indexPath.row]
            cell.tempLabel.text="\(Int((weatherCell?.fact?.temp ?? 0)))°"
            var URLString=""
            if let icon=weatherCell?.fact?.icon {
                URLString="https://yastatic.net/weather/i/icons/funky/dark/\(icon).svg"
            }
            if let imageURL = URL(string: URLString)
                   {
                        let requestObj = URLRequest(url: imageURL)
                cell.imageWeatherView.load(requestObj)
                   }
          
            })
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "TownVC") as? TownViewController {
            controller.lat=lat[indexPath.row]
            controller.lng=lng[indexPath.row]
            controller.town=town[indexPath.row]
                 self.present(controller, animated: true, completion: nil)

             }
    }
}
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        for i in 0...9 {
            if searchBar.text==town[i] {
                if let controller = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "TownVC") as? TownViewController {
                    controller.lat=lat[i]
                    controller.lng=lng[i]
                    controller.town=town[i]
                         self.present(controller, animated: true, completion: nil)

                     }
            }
        }
    }
}
