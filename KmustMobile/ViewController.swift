//
//  ViewController.swift
//  KmustMobile
//
//  Created by virus1993 on 16/8/28.
//  Copyright © 2016年 ASCP. All rights reserved.
//

import UIKit
import JavaScriptCore    //记得导入JavaScriptCore

extension String {
    func stringByRemovingAll(subStrings: [String]) -> String {
        var resultString = self
        subStrings.map { resultString = resultString.replacingOccurrences(of: $0, with: "") }
        return resultString
    }
}

class ViewController: UIViewController, UIWebViewDelegate {
    var viewState:String?
    let userAgent = "Mozilla%2F5.0+%28Macintosh%3B+Intel+Mac+OS+X+10_11_6%29+AppleWebKit%2F601.7.7+%28KHTML%2C+like+Gecko%29+Version%2F9.1.2+Safari%2F601.7.7undefined5.0+%28Macintosh%3B+Intel+Mac+OS+X+10_11_6%29+AppleWebKit%2F601.7.7+%28KHTML%2C+like+Gecko%29+Version%2F9.1.2+Safari%2F601.7.7+SN%3ANULL" as NSString
    let imageView:UIImageView = UIImageView()
    let imageViewSource:UIImageView = UIImageView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let validateCodeTextField = UITextField()
    let loginBtn = UIButton()
    let webView = UIWebView()
    let mysourceBtnNew = UIButton()
    var localAlert:UIAlertController?
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usernameTextField.frame = CGRect(x: 40, y: 40, width: 150, height: 40)
        usernameTextField.placeholder = "用户名"
        usernameTextField.text = "11111111111"
        passwordTextField.frame = CGRect(x: 40, y: 40 * 2 + 5, width: 150, height: 40)
        passwordTextField.placeholder = "密码"
        passwordTextField.text = "************"
        passwordTextField.isSecureTextEntry = true;
        validateCodeTextField.frame = CGRect(x: 40, y: 40 * 3 + 10, width: 100, height: 40)
        validateCodeTextField.placeholder = "验证码"
        imageView.frame = CGRect(x: 40, y: 40  * 4 + 15, width: 100, height: 40)
        loginBtn.frame = CGRect(x: 40, y: 40  * 5 + 20, width: 150, height: 50)
        mysourceBtnNew.frame = CGRect(x: self.view.frame.size.width - 130, y: 100, width: 100, height: 100)
        mysourceBtnNew.setTitle("获取成绩", for: .normal)
        mysourceBtnNew.setTitleColor(.white, for: .normal)
        webView.frame = CGRect(x: 0, y: 300, width: 320, height: 100)
        imageViewSource.frame = CGRect(x: 0, y: self.view.frame.size.height - 200, width: self.view.frame.size.width, height: 60)
        webView.delegate = self
        //不需要显示
        webView.isHidden = true
        
        loginBtn.setTitle("获取验证码", for: UIControlState())
        loginBtn.setTitleColor(UIColor.white, for: UIControlState())
        loginBtn.backgroundColor = .green;
        loginBtn.layer.cornerRadius = 5;
        loginBtn.addTarget(self, action: #selector(loadValideCode), for: .touchUpInside)
        mysourceBtnNew.addTarget(self, action: #selector(newLoginBtnPress), for: .touchUpInside)
        mysourceBtnNew.layer.cornerRadius = 50
        mysourceBtnNew.backgroundColor = .red
        
        self.view.addSubview(imageView)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(validateCodeTextField)
        self.view.addSubview(loginBtn)
        self.view.addSubview(webView)
        self.view.addSubview(mysourceBtnNew)
        self.view.addSubview(imageViewSource)
        loginView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginView() -> Void {
        flag = 0
        let myUrl = URL(string: "http://kmustjwcxk2.kmust.edu.cn/jwweb/");
        
        // Creaste URL Request
        var request = URLRequest(url:myUrl!);
        
        // Set request HTTP method to GET. It could be POST as well
        request.httpMethod = "GET"
        let acceptLanguage = "zh-cn"
        let acceptEncoding = "gzip, deflate"
        let accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
        let host = "kmustjwcxk2.kmust.edu.cn"
        
        request.addValue("http://kmustjwcxk2.kmust.edu.cn/jwweb/default.aspx", forHTTPHeaderField: "Referer")
        request.addValue(acceptLanguage, forHTTPHeaderField: "Accept-Language")
        request.setValue(acceptEncoding, forHTTPHeaderField: "Accept-Encoding")
        request.addValue(accept, forHTTPHeaderField: "Accept")
        request.addValue(host, forHTTPHeaderField: "Host")
        self.webView.loadRequest(request)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if flag == 1 {
            var news = webView.stringByEvaluatingJavaScript(from: "var doc = frames[0].document;doc.getElementById('txt_asmcdefsddsd').value = '\(self.usernameTextField.text!)';doc.getElementById('txt_pewerwedsdfsdff').focus();doc.getElementById('txt_pewerwedsdfsdff').value = '\(self.passwordTextField.text!)';doc.getElementById('txt_sdertfgsadscxcadsads').focus();function getBase64Image(img) { var canvas = document.createElement(\"canvas\"); canvas.width = img.width; canvas.height = img.height; var ctx = canvas.getContext(\"2d\"); ctx.drawImage(img, 0, 0, img.width, img.height); var dataURL = canvas.toDataURL(\"image/png\"); return dataURL}getBase64Image(doc.getElementById('imgCode'));")
            let myStrings = ["\"", "data:image/png;base64,"]
            news = news?.stringByRemovingAll(subStrings: myStrings)
            let data = Data(base64Encoded: news!)
            let codeImg = UIImage(data: data!)
            self.imageView.image = codeImg
            flag += 1
        }    else if flag == 2 {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5, execute:{ Void in
                let _ = webView.stringByEvaluatingJavaScript(from: "frames['frmbody'].frames['frmMain'].document.location.href = 'xscj/Stu_MyScore.aspx';")
                print("打开学生成绩页面！")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute:{ Void in
                    let _ = webView.stringByEvaluatingJavaScript(from: "frames['frmbody'].frames['frmMain'].document.getElementsByName('form1')[0].submit();")
                    print("请求成绩数据！")
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute:{ Void in
                        var news = webView.stringByEvaluatingJavaScript(from: "function getBase64Image(img) { var canvas = document.createElement(\"canvas\"); canvas.width = img.width; canvas.height = img.height; var ctx = canvas.getContext(\"2d\"); ctx.drawImage(img, 0, 0, img.width, img.height); var dataURL = canvas.toDataURL(\"image/png\"); return dataURL}getBase64Image(frames['frmbody'].frames['frmMain'].frames['main'].document.getElementsByTagName('img')[0]);")
                        let myStrings = ["\"", "data:image/png;base64,"]
                        news = news?.stringByRemovingAll(subStrings: myStrings)
                        if news != "" {
                            let data = Data(base64Encoded: news!)
                            let codeImg = UIImage(data: data!)
                            self.imageViewSource.image = codeImg
                            print("收到成绩图像！")
                        }   else    {
                            print("未收到成绩图像！")
                        }
                        self.localAlert?.dismiss(animated: true, completion: nil)
                    })
                })
            })
            flag += 1
        }
    }
    
    func newLoginBtnPress() -> Void {
        self.view.endEditing(true)
        if usernameTextField.text != "", passwordTextField.text != "", validateCodeTextField.text != "" {
            localAlert = UIAlertController(title: "提示", message: "正在获取成绩...", preferredStyle: .alert)
            self.present(localAlert!, animated: true, completion: nil)
            webView.stringByEvaluatingJavaScript(from: "frames[0].document.getElementById('txt_sdertfgsadscxcadsads').onclick();frames[0].document.getElementById('txt_sdertfgsadscxcadsads').value = '\(self.validateCodeTextField.text!)';frames[0].document.getElementById('txt_sdertfgsadscxcadsads').onkeyup();frames['frmHomeShow'].document.getElementsByName('Logon')[0].submit();")
        }
    }
    
    func loadValideCode() -> Void {
        localAlert = UIAlertController(title: "提示", message: "正在获取验证码...", preferredStyle: .alert)
        self.present(localAlert!, animated: true, completion: nil)
        if flag == 0 {
            flag += 1
            webView.stringByEvaluatingJavaScript(from: "document.getElementById('m14').onclick()")
            localAlert?.dismiss(animated: true, completion: nil)
        }   else    {
            loginView()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
                self.flag += 1
                self.webView.stringByEvaluatingJavaScript(from: "document.getElementById('m14').onclick()")
                self.localAlert?.dismiss(animated: true, completion: nil)
            })
        }
        
    }
    
}

