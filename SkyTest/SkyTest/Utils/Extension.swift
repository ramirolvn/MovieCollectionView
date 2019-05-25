//
//  Extension.swift
//  SkyTest
//
//  Created by Ramiro Neto on 24/05/2019.
//  Copyright © 2019 Ramiro Lima Vale Neto. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
