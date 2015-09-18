//
//  ViewController.swift
//  FileOpenInApp
//
//  Created by DAVY UONG on 9/10/15.
//  Copyright © 2015 DAVY UONG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let htmlString:String! = "<br /><h2> No url to be load! Please go to another app like Mail or DropBox and open a file then choose Open-In to open that file in this app. </h2>"
        webView.loadHTMLString(htmlString, baseURL: nil)
        
        //Receive the notification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleOpenInUrlFromNotification:", name: NotificationNameOpenInUrl, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //This func will load the file in the NSURL of the notification.userInfo into the UIWebView
    func handleOpenInUrlFromNotification(notification: NSNotification) {
        if let info = notification.userInfo as? Dictionary<String,NSURL> {
            let url = info[urlInDictionary]
            webView.loadRequest(NSURLRequest(URL: url!))
        }
        else {
            print("\nFailed to load the url")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

