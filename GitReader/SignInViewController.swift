//
//  SignInViewController.swift
//  GitReader
//
//  Created by Emma Khoroshko on 08.09.17.
//  Copyright © 2017 Emma Khoroshko. All rights reserved.
//

import UIKit
import Foundation



//import OAuth2Swift

class SignInViewController: UIViewController {
    
    

    @IBAction func signInAction(_ sender: UIButton) {
    performSegue(withIdentifier: "PresentReposVC", sender: loginTextFiield.text
        )
    
    }
    
    @IBAction func tapOutsidetoHideKey(_ sender: Any) {
        
        loginTextFiield.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    
    
    @IBOutlet weak var loginTextFiield: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    
    
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let repVC = segue.destination as! RepositoriesTableViewController
        repVC.str = loginTextFiield.text!
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   /*
    >>> # Credentials you get from registering a new application
    >>> client_id = '<the id you get from github>'
    >>> client_secret = '<the secret you get from github>'
    
    >>> # OAuth endpoints given in the GitHub API documentation
    >>> authorization_base_url = 'https://github.com/login/oauth/authorize'
    >>> token_url = 'https://github.com/login/oauth/access_token'
    
    >>> from requests_oauthlib import OAuth2Session
    >>> github = OAuth2Session(client_id)
    
    >>> # Redirect user to GitHub for authorization
    >>> authorization_url, state = github.authorization_url(authorization_base_url)
    >>> print 'Please go here and authorize,', authorization_url
    
    >>> # Get the authorization verifier code from the callback url
    >>> redirect_response = raw_input('Paste the full redirect URL here:')
    
    >>> # Fetch the access token
    >>> github.fetch_token(token_url, client_secret=client_secret,
    >>>         authorization_response=redirect_response)
    
    >>> # Fetch a protected resource, i.e. user profile
    >>> r = github.get('https://api.github.com/user')
    >>> print r.content
*/
}
