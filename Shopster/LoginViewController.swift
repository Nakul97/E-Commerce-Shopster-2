//
//  LoginViewController.swift
//  Shopster
//
//  Created by Nakul on 12/03/17.
//  Copyright © 2017 GetThisDone. All rights reserved.
//

import UIKit
import SJFluidSegmentedControl


class LoginViewController: UIViewController ,SJFluidSegmentedControlDataSource,SJFluidSegmentedControlDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate,UIImagePickerControllerDelegate, PickImage, LoginDone,SignUpDone{
    
    @IBOutlet weak var LabelTemp: UILabel!
    @IBOutlet weak var ChangeConstraint2: NSLayoutConstraint!
    @IBOutlet weak var ChangeConstraint: NSLayoutConstraint!
    let imagePicker = UIImagePickerController()
    var TempImage = #imageLiteral(resourceName: "plus-4-48.png")
    @IBOutlet weak var LoginOrSignup: SJFluidSegmentedControl!
    @IBOutlet weak var EnterDetails: UICollectionView!
    
    var keyboardHeight:CGFloat = 0.0
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imagePicker.delegate = self
        EnterDetails.register(UINib(nibName: "LoginCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Login")
        EnterDetails.register(UINib(nibName: "SignUpCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SignUp")
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func numberOfSegmentsInSegmentedControl(_ segmentedControl: SJFluidSegmentedControl) -> Int {
        return 2
    }

    func segmentedControl(_ segmentedControl: SJFluidSegmentedControl, titleForSegmentAtIndex index: Int) -> String? {
        if(index == 0)
        {
            return "Login"
        }
        else{
            return "Sign Up"
        }
    }
    
    func segmentedControl(_ segmentedControl: SJFluidSegmentedControl, didScrollWithXOffset offset: CGFloat) {
        EnterDetails.contentOffset.x = EnterDetails.frame.width * 2 * offset/LoginOrSignup.frame.width
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.row == 0)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Login", for: indexPath) as! LoginCollectionViewCell
            cell.Login = self
            cell.layer.cornerRadius = 8
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SignUp", for: indexPath) as! SignUpCollectionViewCell
            cell.UserImage.isUserInteractionEnabled = true
            //cell.UserImage.addGestureRecognizer(tapGestureRecognizer)
            cell.UserPicksImage = self
            cell.SignUp1 = self
            cell.layer.cornerRadius = 8
            return cell
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        TempImage = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
        EnterDetails.reloadData()
        self.dismiss(animated: true, completion: { () -> Void in })
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.EnterDetails.bounds.size.width - 20, height: EnterDetails.frame.height);
    }

    func pickImage(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    func dismissNow(){
        
       dismiss(animated: true, completion: nil)
       // self.performSegue(withIdentifier: "temp", sender: self)
    }
    
    func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            if(ChangeConstraint2.constant  == 122){
                let keyboardRectangle = keyboardFrame.cgRectValue
                keyboardHeight = (keyboardRectangle.height)
                ChangeConstraint.constant = 200
                ChangeConstraint2.constant =  200
                self.view.layoutSubviews()
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if(ChangeConstraint2.constant  != 122){
                keyboardHeight = keyboardSize.height
                keyboardHeight = (keyboardSize.height)
                ChangeConstraint.constant = 122
                ChangeConstraint2.constant = 122
                self.view.layoutSubviews()
            }
        }
    }
    
}
