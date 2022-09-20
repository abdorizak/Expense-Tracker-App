//
//  EditProfileVC.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 4/19/22.
//
// UI DESING

import UIKit
import Photos
import PhotosUI

class EditProfileVC: UIViewController {
    
    // MARK: - Scroller View
    private let scrollView          = UIScrollView()
    private let contentView         = UIView()
    
    // MARK: - Image
    private let avaterImage       = AvatarImageView(frame: .zero)
    
    // MARK: - Labels
    private let fullnameLable       = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Full Name")
    private let emailLabel          = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Email")
    private let phoneLabel          = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Phone")
    private let usernameLabel       = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Username")
    private let MonthlyIncomeLabel  = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Monthly")
    private let genderLabel         = CustomLabel(textAlignment: .left, fontSize: 14, textWeight: .regular, text: "Gender")
    
    // MARK: - Views
    private let fullnameView            = UIView()
    private let emailView               = UIView()
    private let phoneView               = UIView()
    private let usernameView            = UIView()
    private let monthlyIncomeView       = UIView()
    private let genderView              = UIView()
    private var itemviews: [UIView]     = []
    
    
    // MARK: - Text
    private let fullnameTextfeild = CustomTextFields(holder: "Full Name", type: .name)
    private let emailTextfeild = CustomTextFields(holder: "Email", type: .emailAddress)
    private let phoneTextfeild = CustomTextFields(holder: "Phone", type: .telephoneNumber)
    private let usernameTextfeild = CustomTextFields(holder: "Username", type: .username)
    
    private let MonthlyIncome: [String] = ["$500 - $1500", "$1500 - $3000", "$3000 - $5000", "$5000 - $10k"]
    
    private let MonthlyIncomeTextfeild = CustomTextFields(placeholder: "Monthly Income")
    
    lazy var monthlyTypePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    private let genderType: [String] = ["Male", "Female"]
    
    private let genderTextfeild = CustomTextFields(placeholder: "Gender")
    
    lazy var genderTypePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    // MARK: - Buttons
    private let saveBtn  = GradientButton(frame: .zero)
    
    private let editView = UIView()
    private let editBtn = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        ConfigureScrollView()
        configImage()
        editViewButton()
        configForm()
        layoutViewsAndLabelsAndTextfeilds()
        genderTextfeild.inputView = genderTypePicker
        MonthlyIncomeTextfeild.inputView = monthlyTypePicker
        let tap  = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        configSavebtn()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configImage()
    }
    
    func ConfigureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(to: view)
        contentView.pinToEdges(to: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 900)
        ])
    }
    
    func configImage() {
        avaterImage.contentMode = .scaleAspectFill
        avaterImage.layer.cornerRadius = avaterImage.frame.width / 2
        avaterImage.layer.shadowColor = UIColor.black.cgColor
        avaterImage.layer.shadowOffset = .zero
        avaterImage.layer.shadowRadius = 12
        avaterImage.layer.shadowOpacity = 0.3
        
        contentView.addSubViews(avaterImage, editView)
        editView.addSubview(editBtn)
        NSLayoutConstraint.activate([
            avaterImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            avaterImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avaterImage.heightAnchor.constraint(equalToConstant: 120),
            avaterImage.widthAnchor.constraint(equalToConstant: 120),
            
            editView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 108),
            editView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 45),
            editView.heightAnchor.constraint(equalToConstant: 35),
            editView.widthAnchor.constraint(equalToConstant:  35),
            
            editBtn.centerXAnchor.constraint(equalTo: editView.centerXAnchor),
            editBtn.centerYAnchor.constraint(equalTo: editView.centerYAnchor),
            
        ])
    }
    
    func configForm(){
        contentView.addSubViews(fullnameLable, emailLabel, phoneLabel, usernameLabel, MonthlyIncomeLabel, genderLabel)
        [fullnameView, emailView, phoneView, usernameView, monthlyIncomeView, genderView].forEach { view in
            contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(hex: "f0f3fd")
            view.clipsToBounds = true
            view.layer.cornerRadius = 12
            view.layer.borderColor = UIColor(hex: "e9e9e9").cgColor
            view.layer.borderWidth = 1
        }
        
        
        fullnameView.addSubview(fullnameTextfeild)
        emailView.addSubview(emailTextfeild)
        phoneView.addSubview(phoneTextfeild)
        usernameView.addSubview(usernameTextfeild)
        monthlyIncomeView.addSubview(MonthlyIncomeTextfeild)
        genderView.addSubview(genderTextfeild)
    }
    
    private func editViewButton() {
        editView.translatesAutoresizingMaskIntoConstraints = false
        editView.backgroundColor = .systemBackground
        editView.layer.cornerRadius = 12

        var editBtnConfiguration = UIButton.Configuration.plain()
        editBtnConfiguration.image = UIImage(systemName: "square.and.pencil")
        editBtnConfiguration.imagePlacement = .leading
        editBtnConfiguration.imageColorTransformer = .preferredTint
        editBtn.configuration = editBtnConfiguration
        editBtn.addAction(UIAction(handler: { [unowned self] _ in
            self.choosePhotoAlert()
            print("Tap")
        }), for: .touchUpInside)
        editBtn.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func choosePhotoAlert() {
        let ac = UIAlertController(title: "Choose Photer By Tacking Camera or Photo", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [unowned self] _ in
            self.openCamera()
        }))
        ac.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { [unowned self] _ in
            self.openPhoto()
        }))
        ac.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        present(ac, animated: true)
    }
    
    private func openCamera() {
        print("Tapped Camera")
        // first will check Sourche Type
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            presentAlertOnMainThread(title: "Opps!", message: "You don't have camera", btnTitle: "Ok")
        }
    }
    
    private func openPhoto() {
        print("Tapped Photo")
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.filter = .images
        configuration.selection = .default
        configuration.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func layoutViewsAndLabelsAndTextfeilds() {
        
        NSLayoutConstraint.activate([
            
            //MARK: - View Constraints
            fullnameLable.topAnchor.constraint(equalTo: avaterImage.bottomAnchor, constant: 30),
            fullnameLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            fullnameLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            fullnameView.topAnchor.constraint(equalToSystemSpacingBelow: fullnameLable.bottomAnchor, multiplier: 1),
            fullnameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            fullnameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            fullnameView.heightAnchor.constraint(equalToConstant: 60),
            
            emailLabel.topAnchor.constraint(equalToSystemSpacingBelow: fullnameView.bottomAnchor, multiplier: 2),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            emailView.topAnchor.constraint(equalToSystemSpacingBelow: emailLabel.bottomAnchor, multiplier: 1),
            emailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            emailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            emailView.heightAnchor.constraint(equalToConstant: 60),
            
            phoneLabel.topAnchor.constraint(equalToSystemSpacingBelow: emailView.bottomAnchor, multiplier: 2),
            phoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            phoneView.topAnchor.constraint(equalToSystemSpacingBelow: phoneLabel.bottomAnchor, multiplier: 1),
            phoneView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            phoneView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            phoneView.heightAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.topAnchor.constraint(equalToSystemSpacingBelow: phoneView.bottomAnchor, multiplier: 2),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            usernameView.topAnchor.constraint(equalToSystemSpacingBelow: usernameLabel.bottomAnchor, multiplier: 1),
            usernameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            usernameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            usernameView.heightAnchor.constraint(equalToConstant: 60),
            
            MonthlyIncomeLabel.topAnchor.constraint(equalToSystemSpacingBelow: usernameView.bottomAnchor, multiplier: 2),
            MonthlyIncomeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            MonthlyIncomeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            monthlyIncomeView.topAnchor.constraint(equalToSystemSpacingBelow: MonthlyIncomeLabel.bottomAnchor, multiplier: 1),
            monthlyIncomeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            monthlyIncomeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            monthlyIncomeView.heightAnchor.constraint(equalToConstant: 60),
            
            genderLabel.topAnchor.constraint(equalToSystemSpacingBelow: monthlyIncomeView.bottomAnchor, multiplier: 2),
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            genderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            genderView.topAnchor.constraint(equalToSystemSpacingBelow: genderLabel.bottomAnchor, multiplier: 1),
            genderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            genderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            genderView.heightAnchor.constraint(equalToConstant: 60),
            
            // MARK: - Textfeidls
            fullnameTextfeild.topAnchor.constraint(equalTo: fullnameView.topAnchor, constant: 10),
            fullnameTextfeild.trailingAnchor.constraint(equalTo: fullnameView.trailingAnchor, constant: -10),
            fullnameTextfeild.leadingAnchor.constraint(equalTo: fullnameView.leadingAnchor, constant: 10),
            fullnameTextfeild.heightAnchor.constraint(equalToConstant: 40),
            
            emailTextfeild.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 10),
            emailTextfeild.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -10),
            emailTextfeild.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 10),
            emailTextfeild.heightAnchor.constraint(equalToConstant: 40),
            
            phoneTextfeild.topAnchor.constraint(equalTo: phoneView.topAnchor, constant: 10),
            phoneTextfeild.trailingAnchor.constraint(equalTo: phoneView.trailingAnchor, constant: -10),
            phoneTextfeild.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor, constant: 10),
            phoneTextfeild.heightAnchor.constraint(equalToConstant: 40),
            
            usernameTextfeild.topAnchor.constraint(equalTo: usernameView.topAnchor, constant: 10),
            usernameTextfeild.trailingAnchor.constraint(equalTo: usernameView.trailingAnchor, constant: -10),
            usernameTextfeild.leadingAnchor.constraint(equalTo: usernameView.leadingAnchor, constant: 10),
            usernameTextfeild.heightAnchor.constraint(equalToConstant: 40),
            
            MonthlyIncomeTextfeild.topAnchor.constraint(equalTo: monthlyIncomeView.topAnchor, constant: 10),
            MonthlyIncomeTextfeild.trailingAnchor.constraint(equalTo: monthlyIncomeView.trailingAnchor, constant: -10),
            MonthlyIncomeTextfeild.leadingAnchor.constraint(equalTo: monthlyIncomeView.leadingAnchor, constant: 10),
            MonthlyIncomeTextfeild.heightAnchor.constraint(equalToConstant: 40),
            
            genderTextfeild.topAnchor.constraint(equalTo: genderView.topAnchor, constant: 10),
            genderTextfeild.trailingAnchor.constraint(equalTo: genderView.trailingAnchor, constant: -10),
            genderTextfeild.leadingAnchor.constraint(equalTo: genderView.leadingAnchor, constant: 10),
            genderTextfeild.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }
    
    func configSavebtn() {
        saveBtn.setTitle("Save", for: .normal)
        contentView.addSubview(saveBtn)
        NSLayoutConstraint.activate([
            saveBtn.topAnchor.constraint(equalTo: genderView.bottomAnchor, constant: 20),
            saveBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            saveBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
            saveBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
}


extension EditProfileVC: UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // imageViewPic.contentMode = .scaleToFill
            avaterImage.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                guard let image = image as? UIImage, error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    self.avaterImage.image = image
                }
            }
        }
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == genderTypePicker {
            return genderType.count
        } else {
            return MonthlyIncome.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genderTypePicker {
            return genderType[row]
        }
        return MonthlyIncome[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == genderTypePicker {
            genderTextfeild.text = genderType[row]
            genderTextfeild.resignFirstResponder()
        } else {
            MonthlyIncomeTextfeild.text = MonthlyIncome[row]
            MonthlyIncomeTextfeild.resignFirstResponder()
        }
        
    }
}

