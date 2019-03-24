//
//  ContactViewController.swift
//  SimpleRestaurant
//
//  Created by Amin Abromand on 23.03.19.
//  Copyright © 2019 Amin Abromand. All rights reserved.
//

import UIKit
import WebKit

class ContactViewController: UIViewController, UIWebViewDelegate {//}, WKUIDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        let height = self.view.frame.height - 60
        
        let embedForm = "<div id=\"wufoo-m1ky4laj1y7wl25\">Fill out my <a href=\"https://aminator.wufoo.com/forms/m1ky4laj1y7wl25\">online form</a>.</div><script type=\"text/javascript\">var m1ky4laj1y7wl25;(function(d, t) {var s = d.createElement(t), options = {'userName':'aminator','formHash':'m1ky4laj1y7wl25','autoResize':true,'height':'\(height)','async':true,'host':'wufoo.com','header':'show','ssl':true};s.src = ('https:' == d.location.protocol ? 'https://' : 'https://') + 'secure.wufoo.com/scripts/embed/form.js';s.onload = s.onreadystatechange = function() {var rs = this.readyState; if (rs) if (rs != 'complete') if (rs != 'loaded') return;try { m1ky4laj1y7wl25 = new WufooForm();m1ky4laj1y7wl25.initialize(options);m1ky4laj1y7wl25.display(); } catch (e) {}};var scr = d.getElementsByTagName(t)[0], par = scr.parentNode; par.insertBefore(s, scr);})(document, 'script');</script>"
        
        let embedCode = "<html><head></head><body>\(embedForm)</body></html>"
        //let embedCode = "\(embedForm)"
        
        //        let preferences = WKPreferences()
        //        preferences.javaScriptEnabled = true
        //        let configuration = WKWebViewConfiguration()
        //        configuration.preferences = preferences
        //
        //        let webView = WKWebView(frame: view.bounds, configuration: configuration)
        //        //let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), configuration: configuration)
        //        webView.loadHTMLString(embedCode, baseURL: nil)
        //        webView.backgroundColor = .black
        //        webView.uiDelegate = self
        
        //let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), configuration: configuration)
        
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        webView.loadHTMLString(embedCode, baseURL: nil)
        webView.backgroundColor = .black
        webView.scrollView.isScrollEnabled = true
        webView.scrollView.bounces = false
        webView.delegate = self
        
        self.view.addSubview(webView)
    }
    
    
    //let embedForm = "<!DOCTYPE html><html><body><h2>My First JavaScript</h2><button type=\"button\" onclick=\"document.getElementById('demo').innerHTML = Date()\">Click me to display Date and Time.</button><p id=\"demo\"></p></body></html>"
    
    //let embedForm = "<html><head></head><body><div id=\"wufoo-m1ky4laj1y7wl25\">Fill out my <a href=\"https://aminator.wufoo.com/forms/m1ky4laj1y7wl25\">online form</a>.</div><div id=\"wuf-adv\" style=\"font-family:inherit;font-size: small;color:#a7a7a7;text-align:center;display:block;\">The easy to use <a href=\"http://www.wufoo.com/form-builder/\">Wufoo form builder</a> helps you make forms easy, fast, and fun.</div><script type=\"text/javascript\">var m1ky4laj1y7wl25;(function(d, t) {var s = d.createElement(t), options = {'userName':'aminator','formHash':'m1ky4laj1y7wl25','autoResize':true,'height':'635','async':true,'host':'wufoo.com','header':'show','ssl':true};s.src = ('https:' == d.location.protocol ? 'https://' : 'http://') + 'secure.wufoo.com/scripts/embed/form.js';s.onload = s.onreadystatechange = function() {var rs = this.readyState; if (rs) if (rs != 'complete') if (rs != 'loaded') return;try { m1ky4laj1y7wl25 = new WufooForm();m1ky4laj1y7wl25.initialize(options);m1ky4laj1y7wl25.display(); } catch (e) {}};var scr = d.getElementsByTagName(t)[0], par = scr.parentNode; par.insertBefore(s, scr);})(document, 'script');</script></body></html>"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
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
