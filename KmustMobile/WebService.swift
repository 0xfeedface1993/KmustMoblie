//
//  WebService.swift
//  KmustMobile
//
//  Created by virus1993 on 16/8/28.
//  Copyright © 2016年 ASCP. All rights reserved.
//

import Foundation

class WebService: NSObject {
//    func getLoginPara(_ username: String, password: String, validateCode: String) -> (__VIEWSTATE:String?, dsdsdsdsdxcxdfgfg: String?, fgfggfdgtyuuyyuuckjg: String?, pcInfo: String?, typeName: NSString?, sel_Type: String?, txt_asmcdefsddsd: String?,txt_pewerwedsdfsdff: String?, txt_sdertfgsadscxcadsads: String?, sbtState: String?) {
//        if let js = loadJSFile("md5") {
//            // 通过JSContext执行js代码
//            let context: JSContext = JSContext()
//            
//            // 定义js变量和函数
//            context.evaluateScript(js as String)
//            context.evaluateScript("function chkpwd(username,password) {var s=md5(username+md5(password).substring(0,30).toUpperCase()+'10674').substring(0,30).toUpperCase();return s;}")
//            context.evaluateScript("function chkyzm(obj) {var s=md5(md5(obj.toUpperCase()).substring(0,30).toUpperCase()+'10674').substring(0,30).toUpperCase();return s;}")
//            
//            // 通过下标来获取js方法并调用方法
//            var squareFunc = context.objectForKeyedSubscript("chkpwd")
//            let dsdsdsdsdxcxdfgfg = squareFunc?.call(withArguments: [username,password]).toString()
//            print("dsdsdsdsdxcxdfgfg:" + dsdsdsdsdxcxdfgfg!)  // 输出30
//            
//            squareFunc = context.objectForKeyedSubscript("chkyzm")
//            let fgfggfdgtyuuyyuuckjg = squareFunc?.call(withArguments: [validateCode]).toString()
//            print("fgfggfdgtyuuyyuuckjg:" + fgfggfdgtyuuyyuuckjg!)  // 输出30
//            
//            //+号编码出问题，手动转utf编码
////            viewState = viewState?.replacingOccurrences(of: "+", with: "%2b")
////            return (viewState, dsdsdsdsdxcxdfgfg, fgfggfdgtyuuyyuuckjg, userAgent as String, NSString(string: "学生"), "STU", username, "", "","")
//        }
//        return (nil, nil, nil, nil, nil, nil, nil, nil, nil,nil)
//    }
//    
//    func loadJSFile(_ fileName: String) -> NSString? {
//        if let filepath:NSString = Bundle.main.path(forResource: fileName, ofType: "js") as NSString? {
//            //print(filepath)
//            do {
//                let JSCode = try NSString(contentsOf: URL(fileURLWithPath: filepath as String), encoding: String.Encoding.utf8.rawValue)
//                return JSCode
//            } catch {
//                assertionFailure("can't get jscode!")
//            }
//        }
//        return nil
//    }
//    func loadMainFrame() -> Void {
//        webClient(refer: "http://kmustjwcxk2.kmust.edu.cn/jwweb/SYS/Main_banner.aspx", urlString: "http://kmustjwcxk2.kmust.edu.cn/jwweb/frame/menu.aspx", body: "", method: "GET", completionHandler: {
//            responseString, data in
//            DispatchQueue.main.async(execute: {
////                self.webView.loadHTMLString(responseString as! String, baseURL: nil)
////                self.webView.isHidden = false
////                self.logout()
//            })
//            
//        })
//    }
//    
//    func getLabelText(_ label: String, string: NSString) -> NSString? {
//        let startRange = string.range(of: "<" + label + ">")
//        let endRange = string.range(of: "</" + label + ">")
//        let subString = string.substring(with: NSRange(location: startRange.location, length: endRange.location - startRange.location + label.lengthOfBytes(using: String.Encoding.utf8) + 3))
//        return subString as NSString?
//    }
//    
//    func logout() -> Void {
//        
//    }
//    
//    //webservie
//    func webClient(refer: String, urlString: String, body: String, method: String, completionHandler: @escaping (NSString?, Data?) -> ()) -> Void {
//        // Create NSURL Ibject
//        let myUrl = URL(string: urlString);
//        
//        // Creaste URL Request
//        var request = URLRequest(url:myUrl!);
//        
//        // Set request HTTP method to GET. It could be POST as well
//        request.httpMethod = method
//        let msgLength = "\(body.characters.count)"
//        if method == "POST" {
//            request.httpBody = body.data(using: String.Encoding.utf8, allowLossyConversion: false)
//        }
//        
//        let acceptLanguage = "zh-cn"
//        let acceptEncoding = "gzip, deflate"
//        let accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
//        let host = "kmustjwcxk2.kmust.edu.cn"
//        
//        request.addValue(refer, forHTTPHeaderField: "Referer")
//        request.addValue(msgLength, forHTTPHeaderField: "Content-Length")
//        request.addValue(acceptLanguage, forHTTPHeaderField: "Accept-Language")
//        request.setValue(acceptEncoding, forHTTPHeaderField: "Accept-Encoding")
//        request.addValue(accept, forHTTPHeaderField: "Accept")
//        request.addValue(host, forHTTPHeaderField: "Host")
//        // Excute HTTP Request
//        
//        //提交试用
//        let task = URLSession.shared.dataTask(with: request , completionHandler: {
//            data, response, error in
//            
//            // Check for error
//            if error != nil
//            {
//                print("error=\(error)")
//                return
//            }
//            
//            // Print out response string
//            let responseString = NSString(data: data!, encoding:  CFStringConvertEncodingToNSStringEncoding(UInt32(CFStringEncodings.GB_18030_2000.rawValue)))
//            
//            completionHandler(responseString, data)
//        })
//        
//        task.resume()
//    }

}
