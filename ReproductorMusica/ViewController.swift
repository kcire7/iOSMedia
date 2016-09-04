//
//  ViewController.swift
//  ReproductorMusica
//
//  Created by Erick Rodríguez Ramos on 04/09/16.
//  Copyright © 2016 Erick Rodríguez Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let boton = sender as! UIButton
        let seleccion:String = (boton.titleLabel?.text)!
             let sigVista=segue.destinationViewController as! ViewMusica
     sigVista.text=seleccion
     
     }
}

