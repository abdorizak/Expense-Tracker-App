//
//  TransectionsVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/3/22.
//

import UIKit
import Charts

class TransectionsVC: UIViewController, ChartViewDelegate {
    
    private let chartView = UIView()
    
    lazy var lineChart: LineChartView = {
        let linechart = LineChartView()
        linechart.translatesAutoresizingMaskIntoConstraints = false
        linechart.backgroundColor = .systemBackground
        linechart.rightAxis.enabled = false
        
        linechart.xAxis.labelPosition = .bottom
        linechart.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        linechart.xAxis.setLabelCount(6, force: false)
        linechart.xAxis.labelTextColor = .label
        linechart.xAxis.axisLineColor = .systemBlue
        linechart.xAxis.drawGridLinesEnabled = false
        
        linechart.drawGridBackgroundEnabled = false
        linechart.doubleTapToZoomEnabled = false

        
        let yAxis = linechart.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .label
        yAxis.axisLineColor = .label
        yAxis.labelPosition = .outsideChart
        yAxis.drawGridLinesEnabled = false
        
        
        return linechart
    }()
    
    let scrollView          = UIScrollView()
    let contentView         = UIView()
    
    lazy var segment: UISegmentedControl = {
        let items = ["Income", "Expenses"]
        let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 0
        let font = UIFont.systemFont(ofSize: 18)
        segment.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.backgroundColor  = .tertiarySystemBackground
        segment.addTarget(self, action: #selector(siutDidChange(_:)), for: .valueChanged)
        segment.layer.cornerRadius = 15
        return segment
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureScrollView()
        configTransectionsVC()
        configSegment()
        configChartView()
    }
    
    private func ConfigureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(to: view)
        contentView.pinToEdges(to: scrollView)
        
        let contentView_height = CGFloat(DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 800 : 650)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: contentView_height)
        ])
    }
    
    
    func configTransectionsVC() {
        lineChart.delegate = self
        view.backgroundColor = .systemBackground
        navigationItem.title = "Transections"
        navigationItem.largeTitleDisplayMode  = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        contentView.addSubViews(segment, chartView)
    }
    
    @objc func siutDidChange(_ segmentController: UISegmentedControl) {
        switch segmentController.selectedSegmentIndex {
        case 0:
            self.setIncome()
        case 1:
            self.setExpenses()
        default: break
        }
    }
    
    private func configSegment() {
        NSLayoutConstraint.activate([
            segment.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            segment.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            segment.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            segment.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
}

extension TransectionsVC {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lineChart.animate(xAxisDuration: 2.5, yAxisDuration: 2.5)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        switch segment.selectedSegmentIndex {
        case 0:
            setIncome()
        case 1:
            setExpenses()
        default:
            break
        }
    }
    
    private func setIncome() {
        let values: [Double] = [8, 104, 81, 93, 52, 44, 97, 101, 75, 28,
            76, 25, 20, 13, 52, 44, 57, 23, 45, 12,
            99, 14, 4, 48, 40, 71, 106, 41, 45, 61]
        
        var enteries:[ChartDataEntry] = []
        
        for (i, val) in values.enumerated() {
            enteries.append(ChartDataEntry(x: Double(i), y: val))
        }
        
        let set = LineChartDataSet(entries: enteries, label: "Income")
        set.mode = .cubicBezier
        set.lineCapType = .round
        set.drawCirclesEnabled = false
        set.lineWidth = 2
        set.setColor(.label)
        
        let g = [
            UIColor.systemOrange.cgColor,
            UIColor.systemPurple.cgColor,
            UIColor.systemTeal.cgColor,
        ] as CFArray
        let colorLocations:[CGFloat] = [1.0, 0.1, 1.0]
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: g, locations: colorLocations)
        set.fill = Fill.fillWithRadialGradient(gradient!)
        set.drawFilledEnabled = true
        set.highlightColor = .label
        
        let data = LineChartData(dataSet: set)
        data.setDrawValues(true)
        
        lineChart.data = data
    }
    
    private func setExpenses() {
        let values: [Double] = [8, 104, 81, 93, 52, 44, 97, 101, 75, 28,
                                76, 25, 20, 13, 52, 44, 57, 23, 45, 12]
        
        var enteries:[ChartDataEntry] = []
        
        for (i, val) in values.enumerated() {
            enteries.append(ChartDataEntry(x: Double(i), y: val))
        }
        
        let set = LineChartDataSet(entries: enteries, label: "Expenses")
        set.mode = .cubicBezier
        set.lineCapType = .round
        set.drawCirclesEnabled = false
        set.lineWidth = 2
        set.setColor(.label)
        
        let g = [
            UIColor.systemOrange.cgColor,
            UIColor.systemPurple.cgColor,
            UIColor.systemTeal.cgColor,
        ] as CFArray
        let colorLocations:[CGFloat] = [1.0, 0.1, 1.0]
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: g, locations: colorLocations)
        set.fill = Fill.fillWithRadialGradient(gradient!)
        set.drawFilledEnabled = true
        set.highlightColor = .label
        
        let data = LineChartData(dataSet: set)
        data.setDrawValues(true)
        
        lineChart.data = data
    }
    
    
    private func configChartView() {
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.layer.cornerRadius = 15
        chartView.addSubview(lineChart)
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 20),
            chartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            chartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            chartView.heightAnchor.constraint(equalToConstant: 300),
            
            lineChart.topAnchor.constraint(equalTo: chartView.topAnchor),
            lineChart.trailingAnchor.constraint(equalTo: chartView.trailingAnchor),
            lineChart.leadingAnchor.constraint(equalTo: chartView.leadingAnchor),
            lineChart.bottomAnchor.constraint(equalTo: chartView.bottomAnchor)
            
        ])
    }
    
}
