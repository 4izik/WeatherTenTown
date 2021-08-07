

import UIKit
import WebKit
class TableViewCell: UITableViewCell {
    
    var nameLabel=UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    var tempLabel=UILabel()
    var imageWeatherView=WKWebView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel.textAlignment = .left
        nameLabel.font=nameLabel.font.withSize(18)
        //imageWeatherView.backgroundColor = UIColor.black
        imageWeatherView.contentMode = .scaleAspectFit
        imageWeatherView.scalesLargeContentImage=true
        imageWeatherView.pageZoom=5
        imageWeatherView.backgroundColor = .clear
        self.addSubview(nameLabel)
        self.addSubview(tempLabel)
        self.addSubview(imageWeatherView)
        nameLabel.translatesAutoresizingMaskIntoConstraints=false
        nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive=true
        nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 200).isActive=true
        nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive=true
        nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10).isActive=true
        
        tempLabel.translatesAutoresizingMaskIntoConstraints=false
        let margins = contentView.layoutMarginsGuide
        tempLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
        tempLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive=true
        tempLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10).isActive=true
        
        imageWeatherView.translatesAutoresizingMaskIntoConstraints=false
        imageWeatherView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 30).isActive = true
        imageWeatherView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        imageWeatherView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageWeatherView.heightAnchor.constraint(equalToConstant: 30).isActive = true
       
        
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    
}
   

