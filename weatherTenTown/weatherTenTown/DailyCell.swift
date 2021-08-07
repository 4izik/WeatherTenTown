import UIKit
import WebKit
class DailyCell: UITableViewCell {
    static var identifier: String = "DailyCell"
    let dataLabel=UILabel()
    let mainImageView=WKWebView(frame: CGRect(x: UIScreen.main.bounds.width/2-25, y: 0, width: 50, height: 50))
    let dayTempLabel=UILabel(frame: CGRect(x: UIScreen.main.bounds.width-70, y: 15, width: 20, height: 20))
    let nightTempLabel=UILabel(frame: CGRect(x: UIScreen.main.bounds.width-40, y: 15, width: 20, height: 20))
    let popLabel=UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2+40, y: 15, width: 50, height: 20))
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "DailyCell")
        dataLabel.font = dataLabel.font.withSize(16)
        dataLabel.textColor=UIColor.black
        contentView.addSubview(dataLabel)
        dataLabel.translatesAutoresizingMaskIntoConstraints=false
        dataLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive=true
        dataLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 200).isActive=true
        dataLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive=true
        dataLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10).isActive=true
        
        
        mainImageView.pageZoom=5
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.scalesLargeContentImage=true
        mainImageView.layer.backgroundColor = .none
        mainImageView.backgroundColor = .clear
        contentView.addSubview(mainImageView)
        mainImageView.translatesAutoresizingMaskIntoConstraints=false
        mainImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        dayTempLabel.font=dayTempLabel.font.withSize(16)
        dayTempLabel.textColor=UIColor.black
        contentView.addSubview(dayTempLabel)
        
        dayTempLabel.translatesAutoresizingMaskIntoConstraints=false
        let margins = contentView.layoutMarginsGuide
        dayTempLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -30).isActive = true
        dayTempLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive=true
        dayTempLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10).isActive=true
        
        nightTempLabel.font=nightTempLabel.font.withSize(16)
        nightTempLabel.textColor = UIColor.lightGray
        contentView.addSubview(nightTempLabel)
        nightTempLabel.translatesAutoresizingMaskIntoConstraints=false
        nightTempLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        nightTempLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive=true
        nightTempLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10).isActive=true
        
        popLabel.font=popLabel.font.withSize(13)
        popLabel.textColor=UIColor.white
        contentView.addSubview(popLabel)
        popLabel.translatesAutoresizingMaskIntoConstraints=false
        popLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 40).isActive = true
        popLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive=true
        popLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10).isActive=true
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }

    func reset() {
        // @TOOD: reset things here
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

