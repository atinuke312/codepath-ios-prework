//
//  SettingsViewController.swift
//  Prework
//
//  Created by Atinuke Ayangade on 8/21/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! //!: force unwrap, because we are connecting it in storyboard
    @IBOutlet weak var mySwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    
    //captures everytime someone taps a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue uses previous cell as template for the new cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Dark Mode"
        
        //add toggle switch
        let mySwitch = UISwitch()
        mySwitch.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged) //so something happens when toggled
        cell.accessoryView = mySwitch
        
        
        return cell
    }
    
    @objc func didChangeSwitch(_ sender:UISwitch) {
        if sender.isOn {
            print("on")
            overrideUserInterfaceStyle = .dark
            let view = self.parent
            view?.overrideUserInterfaceStyle = .dark
            
        }
        else {
            overrideUserInterfaceStyle = .light
            let view = self.parent
            view?.overrideUserInterfaceStyle = .light
        }
    }
  
}
    

