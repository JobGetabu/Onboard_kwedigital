//
//  StartQuizController.swift
//  onboard
//
//  Created by Job Getabu on 10/02/2020.
//  Copyright © 2020 Hacela. All rights reserved.
//

import UIKit

class StartQuizController: UIViewController {

    @IBOutlet weak var curveBody: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //curveBody.addTopCurve(curveSize: 70)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let navBar = navigationController?.navigationBar{
            navBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            navBar.backItem?.backBarButtonItem?.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let navBar = navigationController?.navigationBar{
                   navBar.barTintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                   navBar.backItem?.backBarButtonItem?.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                   
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

}
