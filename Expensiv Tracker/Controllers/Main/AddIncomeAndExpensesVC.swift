//
//  AddExpensesVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/3/22.
//
// UI DESING

import UIKit

class AddIncomeAndExpensesVC: UIViewController {
    
    // MARK: ScrollView
    private let scrollView          = UIScrollView()
    private let contentView         = UIView()
    
    // MARK: Label
    private let EIlabel = CustomLabel(textAlignment: .center, fontSize: 22, textWeight: .medium, text: "Add Income or Expenses")
    
    // MARK: UIView
    private let itemView1 = CustomView(frame: .zero)
    private let itemView2 = CustomView(frame: .zero)
    private let itemView3 = CustomView(frame: .zero)
    private let itemView4 = CustomView(frame: .zero)
    private let itemView5 = CustomView(frame: .zero)
    
    // MARK: DatePicker, TextField, Button
    private lazy var dateTimePicker: DateTimePicker = {
       let picker = DateTimePicker()
        picker.setup()
        picker.didSelectDates = { [weak self] date in
            let text = Date.buildTimeRangeString(date: date)
            self?.dateTextField.text = text
        }
        return picker
    }()
    
    private let expensesAndIncomeTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.borderStyle = .none
        textField.clearsOnBeginEditing = true
        textField.textAlignment = .center
        textField.text = "$0"
        textField.keyboardType = .numberPad
        textField.font = UIFont.systemFont(ofSize: 40)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let transactionType: [String] = ["Expense", "Income"]
    
    private let transectionTypeTextField: UITextField = {
        let category = UITextField(frame: .zero)
        category.borderStyle = .none
        category.clearsOnBeginEditing = true
        category.textAlignment = .center
        category.placeholder = "Category"
        
        category.font = UIFont.systemFont(ofSize: 20)
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()
    
    lazy var transectionTypePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    private let titleTextField: UITextField = {
        let title = UITextField(frame: .zero)
        title.borderStyle = .none
        title.clearsOnBeginEditing = true
        title.textAlignment = .center
        title.placeholder = "Title"
        title.font = UIFont.systemFont(ofSize: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let descriptionTextField: UITextField = {
        let description = UITextField(frame: .zero)
        description.borderStyle = .none
        description.clearsOnBeginEditing = true
        description.textAlignment = .center
        description.placeholder = "Description"
        description.font = UIFont.systemFont(ofSize: 20)
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let dateTextField: UITextField = {
        let date = UITextField(frame: .zero)
        date.borderStyle = .none
        date.clearsOnBeginEditing = true
        date.textAlignment = .center
        date.placeholder = "Date"
        date.adjustsFontSizeToFitWidth = true
        date.font = UIFont.systemFont(ofSize: 20)
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    private let SaveButton = GradientButton(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureScrollView()
        configureAddVC()
        expensesAndIncomeTextfields()
        configFrom()
        transectionTypeTextField.inputView = transectionTypePicker
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
    
    private func configureAddVC() {
        view.backgroundColor = .systemBackground
        dateTextField.inputView = dateTimePicker.inputView
        contentView.addSubViews(EIlabel, itemView1, itemView2, itemView3, itemView4, itemView5, SaveButton)
        let tap  = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    private func expensesAndIncomeTextfields() {
        EIlabel.textColor = .tertiaryLabel
        itemView1.addSubview(expensesAndIncomeTextField)
        
        NSLayoutConstraint.activate([
            EIlabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 40),
            EIlabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            EIlabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            EIlabel.heightAnchor.constraint(equalToConstant: 24),
            
            
            itemView1.topAnchor.constraint(equalTo: EIlabel.bottomAnchor, constant: 30),
            itemView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            itemView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            itemView1.heightAnchor.constraint(equalToConstant: 70),
            
            expensesAndIncomeTextField.topAnchor.constraint(equalTo: itemView1.topAnchor),
            expensesAndIncomeTextField.trailingAnchor.constraint(equalTo: itemView1.trailingAnchor),
            expensesAndIncomeTextField.leadingAnchor.constraint(equalTo: itemView1.leadingAnchor),
            expensesAndIncomeTextField.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    
    private func configFrom() {
        // MARK: CategoryTextFeild, TitleTExtField, DescriptionTextFeild, DateTextFeild, SaveButton
        // Overriding CornerRadius
        itemView2.layer.cornerRadius = 15
        itemView3.layer.cornerRadius = 15
        itemView4.layer.cornerRadius = 15
        itemView5.layer.cornerRadius = 15
        
        // Adding Views in TextFeilds
        itemView2.addSubview(transectionTypeTextField)
        itemView3.addSubview(titleTextField)
        itemView4.addSubview(descriptionTextField)
        itemView5.addSubview(dateTextField)
        
        // btn
        SaveButton.setTitle("Save", for: .normal)
        SaveButton.addTarget(self, action: #selector(postTransaction), for: .touchUpInside)
        let top_anchor = CGFloat(DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 30)
        
        NSLayoutConstraint.activate([
            itemView2.topAnchor.constraint(equalTo: itemView1.bottomAnchor, constant: 30),
            itemView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            itemView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            itemView2.heightAnchor.constraint(equalToConstant: 60),
            
            itemView3.topAnchor.constraint(equalTo: itemView2.bottomAnchor, constant: 30),
            itemView3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            itemView3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            itemView3.heightAnchor.constraint(equalToConstant: 60),
            
            itemView4.topAnchor.constraint(equalTo: itemView3.bottomAnchor, constant: 30),
            itemView4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            itemView4.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            itemView4.heightAnchor.constraint(equalToConstant: 60),
            
            itemView5.topAnchor.constraint(equalTo: itemView4.bottomAnchor, constant: 30),
            itemView5.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            itemView5.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            itemView5.heightAnchor.constraint(equalToConstant: 60),
            
            transectionTypeTextField.topAnchor.constraint(equalTo: itemView2.topAnchor),
            transectionTypeTextField.trailingAnchor.constraint(equalTo: itemView2.trailingAnchor),
            transectionTypeTextField.leadingAnchor.constraint(equalTo: itemView2.leadingAnchor),
            transectionTypeTextField.heightAnchor.constraint(equalToConstant: 60),
            
            titleTextField.topAnchor.constraint(equalTo: itemView3.topAnchor),
            titleTextField.trailingAnchor.constraint(equalTo: itemView3.trailingAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: itemView3.leadingAnchor),
            titleTextField.heightAnchor.constraint(equalToConstant: 60),
            
            descriptionTextField.topAnchor.constraint(equalTo: itemView4.topAnchor),
            descriptionTextField.trailingAnchor.constraint(equalTo: itemView4.trailingAnchor),
            descriptionTextField.leadingAnchor.constraint(equalTo: itemView4.leadingAnchor),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 60),
            
            dateTextField.topAnchor.constraint(equalTo: itemView5.topAnchor),
            dateTextField.trailingAnchor.constraint(equalTo: itemView5.trailingAnchor),
            dateTextField.leadingAnchor.constraint(equalTo: itemView5.leadingAnchor),
            dateTextField.heightAnchor.constraint(equalToConstant: 60),
            
            SaveButton.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: top_anchor),
            SaveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            SaveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
            SaveButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func postTransaction() {
        let validate = Validate(expensesAndIncomeTextField, transectionTypeTextField, titleTextField, descriptionTextField, dateTextField)
        switch validate {
        case .Valid:
            Task {
                do {
                    let result = try await NetworkManager.shared.makeTransaction(transectionTypeTextField.text!, titleTextField.text!, descriptionTextField.text!, Double(expensesAndIncomeTextField.text!)!)
                    presentAlertOnMainThread(title: "\(result.status == 200 ? "Success" : "Opss!")", message: result.message ?? "N/A", btnTitle: "Ok")
                } catch {
                    print(error)
                }
            }
        case .InValid(let err):
            presentAlertOnMainThread(title: "Opps!", message: "\(err)", btnTitle: "OK")
            dismissLoding()
        }

    }
}



extension AddIncomeAndExpensesVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        transactionType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        transactionType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        transectionTypeTextField.text = transactionType[row]
        transectionTypeTextField.resignFirstResponder()
    }
}
