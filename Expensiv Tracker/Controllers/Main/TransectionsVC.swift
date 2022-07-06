//
//  TransectionsVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/3/22.
//
// UI DESING

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
    
    private let scrollView          = UIScrollView()
    private let contentView         = UIView()
    
    lazy var segment: UISegmentedControl = {
        let items = ["Income", "Expense"]
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
    
    private let transectionsLabel       = CustomLabel(textAlignment: .left, fontSize: 24, textWeight: .medium, text: "Transections")
    
    private let tableView = CustomTableViewController(indicator: false, separtorStyle: .singleLine, TransectionTableViewCell.self, forCellReuseIdentifier: TransectionTableViewCell.identifier)
    
    
    let incomeTransection: [Transections] = [
        .init(title: "Hayaat Market", description: "Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat. Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat", type: "Income", ammount: 392.80),
        .init(title: "Gadasho Dhar", description: "Waxaan Maanta Soo ibsaday 2 Shaati 3 Surwaal iyo nigis", type: "Income", ammount: 56.0),
        .init(title: "Mishaar", description: "waxaa Helay Mishaar Kasocda Company X", type: "Income", ammount: 6829.00),
    ]
    
    let expenseTransection: [Transections] = [
        .init(title: "Hayaat Market", description: "Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat. Waxaa soo Gatay 3 Shaati Anigoo iska maraayo taleex aa arkay suuqa xayaat", type: "Expense", ammount: 542.80),
        .init(title: "Gadasho Dhar", description: "Waxaan Maanta Soo ibsaday 2 Shaati 3 Surwaal iyo nigis", type: "Expense", ammount: 536.0),
        .init(title: "Mishaar", description: "waxaa Helay Mishaar Kasocda Company X", type: "Expense", ammount: 8829.00),
    ]
    
    lazy var rowTransectionIndex = incomeTransection

    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureScrollView()
        configTransectionsVC()
        configSegment()
        configChartView()
        configTableView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func ConfigureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(to: view)
        contentView.pinToEdges(to: scrollView)
        
        let contentView_height = CGFloat(DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 600 : 800)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: contentView_height)
        ])
    }
    
    
    private func configTransectionsVC() {
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
            rowTransectionIndex = incomeTransection
            setIncome()
            lineChart.animate(xAxisDuration: 2.5, yAxisDuration: 2.5)
        case 1:
            rowTransectionIndex = expenseTransection
            setExpenses()
            lineChart.animate(xAxisDuration: 2.5, yAxisDuration: 2.5)
        default: break
        }
        tableView.reloadData()
    }
    
    private func configSegment() {
        NSLayoutConstraint.activate([
            segment.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            segment.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            segment.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            segment.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configTableView() {
        contentView.addSubViews(transectionsLabel, tableView)
        NSLayoutConstraint.activate([
            transectionsLabel.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 30),
            transectionsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            transectionsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            transectionsLabel.heightAnchor.constraint(equalToConstant: 26),
            
            tableView.topAnchor.constraint(equalTo: transectionsLabel.bottomAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
  
    }
    
    
}

extension TransectionsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rowTransectionIndex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransectionTableViewCell.identifier, for: indexPath) as! TransectionTableViewCell
        cell.selectionStyle = .none
        cell.display(rowTransectionIndex[indexPath.row])
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        switch segment.selectedSegmentIndex {
        case 0:
            rowTransectionIndex = incomeTransection
            setIncome()
            lineChart.animate(xAxisDuration: 2.5, yAxisDuration: 2.5)
        case 1:
            rowTransectionIndex = expenseTransection
            setExpenses()
            lineChart.animate(xAxisDuration: 2.5, yAxisDuration: 2.5)
        default: break
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        switch segment.selectedSegmentIndex {
        case 0:
            rowTransectionIndex = incomeTransection
            setIncome()
        case 1:
            rowTransectionIndex = expenseTransection
            setExpenses()
        default: break
        }
    }
    
    private func setIncome() {
        let values: [Double] = [
            4000,
            5000,
            5000,
            7000,
            1000,
            8700,
            5000,
            800,
            100,
            300,
            5200,
            1200,
            6500,
        ]
             
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
        let values: [Double] = [
            9200,
            8100,
            5400,
            1200,
            5400,
            4300,
            2300,
            6700,
            100,
            800,
            400,
            3400,
            3400
        ]
        
        var enteries:[ChartDataEntry] = []
        
        for (i, val) in values.enumerated() {
            enteries.append(ChartDataEntry(x: Double(i), y: val))
        }
        
        let set = LineChartDataSet(entries: enteries, label: "Expense")
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
