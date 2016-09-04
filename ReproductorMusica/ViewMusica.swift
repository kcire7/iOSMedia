//
//  ViewMusica.swift
//  ReproductorMusica
//
//  Created by Erick Rodríguez Ramos on 04/09/16.
//  Copyright © 2016 Erick Rodríguez Ramos. All rights reserved.
//

import UIKit
import AVFoundation

class ViewMusica: UIViewController {
    var text:String=""
    var reproductor:AVAudioPlayer!
    var listado:[String] = ["Can't Feel My Face", "How Deep Is Your Love", "Its Strange", "Middle", "Sugar", "Sun Goes Down"]
    
    @IBOutlet weak var volume: UISlider!
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var album: UIImageView!
    override func viewWillAppear(animated: Bool) {
        if text == "Shuffle" {
            let randomNumber = Int(arc4random_uniform(7))
            text=listado[randomNumber]
            nombre.text=text
        album.image=UIImage(named:text+".jpg")
        }else{
        nombre.text=text
        album.image=UIImage(named:text+".jpg")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if text == "Shuffle" {
            let randomNumber = Int(arc4random_uniform(6))
            text=listado[randomNumber]
        let sonidoURL=NSBundle.mainBundle().URLForResource(text, withExtension: "mp3")
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            
        }catch{
            print("Error")
        }
        }else{
            let sonidoURL=NSBundle.mainBundle().URLForResource(text, withExtension: "mp3")
            do {
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                
            }catch{
                print("Error")
            }

        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play() {
        if !reproductor.playing{
            reproductor.play()
            reproductor.volume=5
        }
    }

    @IBAction func pause() {
        if reproductor.playing{
            reproductor.pause()
        }
    }
    @IBAction func stop() {
        if reproductor.playing{
            reproductor.stop()
            reproductor.currentTime=0.0
            reproductor.volume=5
        }
    }
    
    @IBAction func vol() {
        reproductor.volume=volume.value
    }
}
