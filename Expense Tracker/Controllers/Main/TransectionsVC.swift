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
    
    private let chartView                       = UIView()
    private let transactionStateView            = UIView()
    private let messageLabel                    = AlertTitleLabel(textAlignment: .center, fontSize: 20)
    
    lazy var lineChart: LineChartView = {
        let linechart = LineChartView()
        linechart.translatesAutoresizingMaskIntoConstraints = false
        linechart.backgroundColor = .systemBackground
        linechart.rightAxis.enabled = false
        
        linechart.xAxis.labelPosition           = .bottom
        linechart.xAxis.labelFont               = .boldSystemFont(ofSize: 12)
        linechart.xAxis.setLabelCount(6, force: false)
        linechart.xAxis.labelTextColor          = .label
        linechart.xAxis.axisLineColor           = .systemBlue
        linechart.xAxis.drawGridLinesEnabled    = false
        
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
    
    private let transectionsLabel       = CustomLabel(textAlignment: .left, fontSize: 24, textWeight: .medium, text: "Transactions")
    
    private let tableView = CustomTableView(indicator: false, separtorStyle: .singleLine, TransectionTableViewCell.self, forCellReuseIdentifier: TransectionTableViewCell.identifier)
    
    var incomeTransactions       = [Transaction]()
    
    var expensesTransactions     = [Transaction]()
    
    lazy var rowTransectionIndex = incomeTransactions
    
    // Computed property that returns an array of Double values from userIncome
    private var incomeValues: [Double] = []
    
    private var expensesValues: [Double] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureScrollView()
        configTransectionsVC()
        configSegment()
        fetchIncomeData()
        fetchExpensesData()
        getTransaction()
        configTrasactionStateView()
        configTransactionLabel()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        switch segment.selectedSegmentIndex {
    //        case 0:
    //            rowTransectionIndex = incomeTransactions
    //            setIncome()
    //        case 1:
    //            rowTransectionIndex = expensesTransactions
    //            setExpenses()
    //        default: break
    //        }
    //    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        switch segment.selectedSegmentIndex {
        case 0:
            rowTransectionIndex = incomeTransactions
            setIncome()
        case 1:
            rowTransectionIndex = expensesTransactions
            setExpenses()
        default: break
        }
    }
    
    
    private func ConfigureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(to: view)
        contentView.pinToEdges(to: scrollView)
        contentView.addSubViews(segment, chartView,transectionsLabel, transactionStateView)
        
        let contentView_height = CGFloat(DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 600 : 800)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: contentView_height)
        ])
    }
    
    private func fetchIncomeData() {
        Task {
            do {
                let income = try await NetworkManager.shared.getUserIncome()
                self.incomeValues = income.userIncome
                configChartView()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchExpensesData() {
        Task {
            do {
                let expenses = try await NetworkManager.shared.getUserExpense()
                self.expensesValues = expenses.userExpense
                configChartView()
            } catch {
                print("DEBUG XX: \(error)")
            }
        }
    }
    
    private func getTransaction() {
        Task {
            do{
                let tran = try await NetworkManager.shared.getTransaction()
                // MARK: will filter the array of trasaction and store both income and expense
                self.incomeTransactions = tran.transaction.filter({
                    return $0.type == "Income"
                })
                self.expensesTransactions = tran.transaction.filter({
                    return $0.type == "Expense"
                })
                
                if !incomeTransactions.isEmpty || !expensesTransactions.isEmpty {
                    fetchExpensesData()
                    configTableView()
                    self.tableView.reloadDataOnMainThread()
                }else if incomeTransactions.isEmpty {
                    layoutLable("This user doesn't have any Transactions 😁, Go and make Transaction 📈.")
                } else if expensesTransactions.isEmpty {
                    layoutLable("This user doesn't have any Transactions 😁, Go and make Transaction 📈.")
                }
                
            } catch {
                print("DEBUG: \(error)")
            }
        }
    }
    
    private func configTransectionsVC() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Transactions"
        navigationItem.largeTitleDisplayMode  = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func siutDidChange(_ segmentController: UISegmentedControl) {
        switch segmentController.selectedSegmentIndex {
        case 0:
            rowTransectionIndex = incomeTransactions
            setIncome()
        case 1:
            rowTransectionIndex = expensesTransactions
            setExpenses()
        default: break
        }
        tableView.reloadDataOnMainThread()
    }
    
    private func configSegment() {
        NSLayoutConstraint.activate([
            segment.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            segment.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            segment.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            segment.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configTransactionLabel() {
        
        NSLayoutConstraint.activate([
            transectionsLabel.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 30),
            transectionsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            transectionsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            transectionsLabel.heightAnchor.constraint(equalToConstant: 26),
        ])
    }
    
    private func configTrasactionStateView() {
        transactionStateView.addSubViews(tableView, messageLabel)
        transactionStateView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            transactionStateView.topAnchor.constraint(equalTo: transectionsLabel.bottomAnchor, constant: 10),
            transactionStateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            transactionStateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            transactionStateView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func layoutLable(_ msg: String) {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        messageLabel.text = msg
        messageLabel.numberOfLines  = 4
        messageLabel.textColor      = .secondaryLabel
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: transactionStateView.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: transactionStateView.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: transactionStateView.trailingAnchor, constant: -40),
        ])
    }
    
    private func configTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: transactionStateView.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: transactionStateView.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: transactionStateView.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: transactionStateView.bottomAnchor)
        ])
    }
    
    private func configChartView() {
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.layer.cornerRadius = 15
        lineChart.delegate = self
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
    
    
    private func setIncome() {
        print("incomeValues: \(incomeValues)")
        setChartData(values: incomeValues, label: "Income", colors: [UIColor.systemOrange.cgColor, UIColor.systemPurple.cgColor, UIColor.systemTeal.cgColor] as CFArray)
    }
    
    private func setExpenses() {
        print("expensesValues: \(expensesValues)")
        setChartData(values: expensesValues, label: "Expenses", colors: [UIColor.systemRed.cgColor, UIColor.systemBlue.cgColor, UIColor.systemGreen.cgColor] as CFArray)
    }
    
    private func setChartData(values: [Double], label: String, colors: CFArray) {
        // DEBUG:
        print("Debug TT:\(values)")
        var entries: [ChartDataEntry] = []
        
        for (i, val) in values.enumerated() {
            entries.append(ChartDataEntry(x: Double(i), y: val))
        }
        
        let set = LineChartDataSet(entries: entries, label: label)
        set.mode = .cubicBezier
        set.lineCapType = .round
        set.drawCirclesEnabled = false
        set.lineWidth = 2
        set.setColor(.label)
        
        let colorLocations: [CGFloat] = [1.0, 0.1, 1.0]
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors, locations: colorLocations)
        set.fill = RadialGradientFill(gradient: gradient!)
        set.drawFilledEnabled = true
        set.highlightColor = .label
        
        let data = LineChartData(dataSet: set)
        data.setDrawValues(true)
        
        lineChart.data = data
        lineChart.animate(xAxisDuration: 2.5, yAxisDuration: 2.5)
    }
    
}
