//
//  PersonViewController.swift
//  todoList
//
//  Created by Алдияр Женисулы on 18.11.2024.
//

import UIKit

class PersonViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    var person = Person(name: "", Surname: "", PhoneNumber: "")
    var index = 0

    var arrayPerson: [Person] = []
    override func viewDidLoad() {

        super.viewDidLoad()
        nameTextField.text = person.name
        surnameTextField.text = person.Surname
        phoneTextField.text = person.PhoneNumber

    }

    @IBAction func editContact(_ sender: Any) {
        let newPerson = Person(name: nameTextField.text!, Surname: surnameTextField.text!, PhoneNumber: phoneTextField.text!)
        
        arrayPerson[index] = newPerson
            
        do {
                let encodedata = try JSONEncoder().encode(arrayPerson)
            
                        UserDefaults.standard.set(encodedata, forKey: "Person")
                    }

                 catch {
                    print("unable to encode \(error)")
                }

        nameTextField.text = ""
        surnameTextField.text = ""
        phoneTextField.text = ""
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

