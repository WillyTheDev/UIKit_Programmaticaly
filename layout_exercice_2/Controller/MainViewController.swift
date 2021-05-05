//
//  ViewController.swift
//  layout_exercice_2
//
//  Created by William on 12.01.21.
//

import UIKit
import SnapKit
import Charts

class MainViewController: UIViewController, ChartViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let notificationButton = UIButton()
    let titleLabel = UILabel()
    let balanceLabel = UILabel()
    let totalValueLabel = UILabel()
    let tableView = UITableView()
    let favoritesLabel: UILabel = {
        let label = UILabel()
        label.text = "Favorites"
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textColor = UIColor(red: 0.05, green: 0.07, blue: 0.15, alpha: 1.00)
        return label
    }()
    let investmentLabel: UILabel = {
        let label = UILabel()
        label.text = "All Investments"
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textColor = UIColor(red: 0.05, green: 0.07, blue: 0.15, alpha: 1.00)
        return label
    }()
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lineChartView)
        view.backgroundColor = UIColor(red: 0.05, green: 0.07, blue: 0.15, alpha: 1.00)
        view.addSubview(tableView)
        view.addSubview(titleLabel)
        view.addSubview(notificationButton)
        view.addSubview(balanceLabel)
        view.addSubview(totalValueLabel)
        
        loadChartView()
        setData()
        loadTableViewConstraint()
        loadHeaderLabels()
        // Do any additional setup after loading the view.
    }
    //MARK: - Header of the app
    func loadHeaderLabels(){
        titleLabel.text = "My Investments"
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        titleLabel.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(70)
        }
        
        notificationButton.backgroundColor = UIColor(red: 0.15, green: 0.17, blue: 0.24, alpha: 1.00)
        notificationButton.layer.cornerRadius = 15
        notificationButton.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        notificationButton.tintColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
        notificationButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-20)
            make.height.greaterThanOrEqualTo(40)
            make.width.greaterThanOrEqualTo(40)
        }
        
        balanceLabel.text = "Balance"
        balanceLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        balanceLabel.textColor = .lightGray
        balanceLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(120)
            make.left.equalToSuperview().offset(20)
        }
        
        totalValueLabel.text = "$ 50,674.87"
        totalValueLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        totalValueLabel.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
        totalValueLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(150)
            make.left.equalToSuperview().offset(20)
        }
    }
    
    // MARK: - TABLEVIEW Setting , DELEGATE & DataSource
    
    let compagnyArray: [Compagny] = [
        Compagny(name: "Apple", image: "apple-brands", value: 12731),
        Compagny(name: "Microsoft", image: "microsoft-brands", value: 36541),
        Compagny(name: "Facebook", image: "facebook-brands", value: 36541),
        Compagny(name: "Google", image: "google-brands", value: 36541),
        Compagny(name: "Amazon", image: "amazon-brands", value: 36541),
        Compagny(name: "Reddit", image: "reddit-brands", value: 36541),
        Compagny(name: "Waze", image: "waze-brands", value: 36541),
        
    ]
    
    func loadTableViewConstraint(){
        tableView.layer.cornerRadius = 20.0
        tableView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.subviews[0].snp.bottom)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.width.equalTo(view.snp.width)
            make.bottom.equalTo(view)
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        if section == 0 {
            header.addSubview(favoritesLabel)
            favoritesLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(20)
                make.left.equalToSuperview().offset(20)
                make.right.equalToSuperview().offset(10)
            }
        } else if section == 1 {
            header.addSubview(investmentLabel)
            investmentLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(20)
                make.left.equalToSuperview().offset(20)
                make.right.equalToSuperview().offset(10)
            }
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = compagnyArray[indexPath.row].name
        cell.textLabel?.textColor = .gray
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        cell.layer.cornerRadius = 25
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00).cgColor
        cell.layer.borderWidth = 10
        cell.textLabel?.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(80)
            make.top.equalToSuperview().offset(28)
        })
        let valueLabel = UILabel()
        valueLabel.text = "$ " + String(compagnyArray[indexPath.row].value)
        valueLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        let image = UIImageView(image: UIImage(named: compagnyArray[indexPath.row].image))
        for v in cell.subviews {
            if v is UIImageView || v is UILabel {
                v.removeFromSuperview()
            }
        }
        cell.addSubview(valueLabel)
        cell.addSubview(image)
        image.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.lessThanOrEqualTo(36)
            make.height.lessThanOrEqualTo(36)
        }
        valueLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-40)
            make.width.lessThanOrEqualTo(120)
            make.height.lessThanOrEqualTo(40)
        }
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("section \(section)")
        if section == 0 {
            return 2
        } else {
            return compagnyArray.count
        }
        
    }
    
    
    
    //MARK: - CHARTVIEW Setting & Data
    var mainDataChartsArray: [ChartDataEntry] = [
            ChartDataEntry(x: 1.0, y: 10.0),
            ChartDataEntry(x: 2.0, y: 5.0),
            ChartDataEntry(x: 3.0, y: 6.0),
            ChartDataEntry(x: 4.0, y: 9.0),
            ChartDataEntry(x: 5.0, y: 15.0),
            ChartDataEntry(x: 6.0, y: 12.0),
            ChartDataEntry(x: 7.0, y: 10.0)]
        
        lazy var lineChartView: LineChartView = {
            let chart = LineChartView()
            chart.leftAxis.drawAxisLineEnabled = false
            chart.leftAxis.drawGridLinesEnabled = false
            chart.leftAxis.enabled = false
            chart.rightAxis.enabled = false
            chart.xAxis.enabled = false
            chart.leftAxis.gridColor = NSUIColor.clear
            chart.xAxis.drawGridLinesEnabled = false
            chart.backgroundColor = .clear
            chart.translatesAutoresizingMaskIntoConstraints = false
            chart.isUserInteractionEnabled = false
            chart.animate(yAxisDuration: 1.5, easingOption: .easeOutCubic)
            chart.legend.enabled = false
            return chart
        }()
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setData(){
        let set1 = LineChartDataSet(entries: mainDataChartsArray, label: "")
        set1.colors = [NSUIColor.cyan]
        set1.mode = .cubicBezier
        set1.cubicIntensity = 0.3
        set1.fill = Fill.fillWithLinearGradient(getGradientFilling(), angle: 90.0)
        set1.drawFilledEnabled = true
        set1.circleHoleRadius = 0.0
        set1.circleRadius = 5.0
        set1.circleColors = [NSUIColor.cyan]
        set1.drawValuesEnabled = false
        let data = LineChartData(dataSet: set1)
        lineChartView.data = data
    }
    

    func loadChartView(){
        lineChartView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(190)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).offset(0)
            make.width.equalTo(view.snp.width)
            make.height.lessThanOrEqualTo(160)
        }
    }

    
    private func getGradientFilling() -> CGGradient {
        // Setting fill gradient color
        let coloTop = UIColor(red: 0.51, green: 1.00, blue: 0.92, alpha: 1.00).cgColor
        let colorBottom = UIColor(red: 0.51, green: 1.00, blue: 0.92, alpha: 0.00).cgColor
        // Colors of the gradient
        let gradientColors = [coloTop, colorBottom] as CFArray
        // Positioning of the gradient
        let colorLocations: [CGFloat] = [0.7, 0.0]
        // Gradient Object
        return CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)!
    }

}
