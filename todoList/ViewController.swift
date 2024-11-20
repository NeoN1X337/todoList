//
//  ViewController.swift
//  todoList
//
//  Created by Алдияр Женисулы on 07.11.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldSurname: UITextField!
    @IBOutlet weak var textFieldNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButton(_ sender: Any) {
        let firstName = textField.text!
        let surname = textFieldSurname.text!
        let number = textFieldNumber.text!
        
        let person = Person(name: firstName, Surname: surname, PhoneNumber: number)
        
        do {
                    if let data = UserDefaults.standard.data(forKey: "Person") {
                        
                        var array = try JSONDecoder().decode([Person].self, from: data)
                        
                        array.append(person)
                        
                        let encodedata = try JSONEncoder().encode(array)
                        
                        UserDefaults.standard.set(encodedata, forKey: "Person")
                    } else {
                        
                        let encodedata = try JSONEncoder().encode([person])
                        
                        UserDefaults.standard.set(encodedata, forKey: "Person")
                    }
                            
                            
                } catch {
                    print("unable to encode \(error)")
                }
        
//        if let taskArray = UserDefaults.standard.array(forKey: "taskArray") as? [String] {
//            var array = taskArray
//
//            array.append(task)
//
//            UserDefaults.standard.setValue(array, forKey: "taskArray")
//
//        }   else{
//            UserDefaults.standard.set([task], forKey: "taskArray")
//        }
        
        textField.text = ""
        textFieldSurname.text = ""
        textFieldNumber.text = ""
    }
    
}

