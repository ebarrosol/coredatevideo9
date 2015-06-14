//
//  Principal.swift
//  CoreData
//
//  Created by Efren Alejandro Barroso Llanes on 13/06/15.
//  Copyright (c) 2015 EBL. All rights reserved.
//

import UIKit
import CoreData

class Principal: UIViewController
{

    @IBOutlet var txtusuario: UITextField!
    @IBOutlet var txtcontra: UITextField! 
    
    @IBAction func cargar()
    {
        var appdel : AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        var context : NSManagedObjectContext = appdel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Usuarios")
        request.returnsObjectsAsFaults = false;
        request.predicate = NSPredicate(format: " usuario = %@ ", "\(txtusuario.text)")
        //request.predicate(
        
        var results : NSArray = context.executeFetchRequest(request, error: nil)!
        if(results.count > 0)
        {
            var result = results[0] as! NSManagedObject
            txtusuario.text = result.valueForKey("usuario") as! String
            txtcontra.text = result.valueForKey("contrasena") as! String
        }
        else
        {
            println("0 resultados, posiblemente ocurrio un error")
        }
         
    }
    
    @IBAction func salvar()
    {
        var appdel : AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        var context : NSManagedObjectContext = appdel.managedObjectContext!
        
        var nvousuario = NSEntityDescription.insertNewObjectForEntityForName("Usuarios", inManagedObjectContext: context) as! NSManagedObject
        nvousuario.setValue("\(txtusuario.text)", forKey: "usuario")
        nvousuario.setValue("\(txtcontra.text)", forKey: "contrasena")
        
        context.save(nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
