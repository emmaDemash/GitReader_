//
//  OAuthManager.swift
//  GitReader
//
//  Created by Emma Khoroshko on 08.09.17.
//  Copyright © 2017 Emma Khoroshko. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class OAuthManager: BDBOAuth1SessionManager {
    
    
    static let sharedInstance = OAuthManager(baseURL: NSURL(string: "https://api.github.com")! as URL, consumerKey: "a9c4b5704f37b58c7336", consumerSecret: "e9a9fe91cc58e31ee66fbc982894342dca615245")
    
    var loginSucces: (()->())?
    var loginFailure: ((NSError)->())?
    
    
//    func login ( success: @escaping ()->(), failure: @escaping (NSError)->())
//{
//        loginFailure = failure
//        loginSucces =  success
//       deauthorize()
//    
//    fetchRequestToken(withPath:"https://api.github.com/authorizations", method: "GET", callbackURL: NSURL(string:"GitTest://oauth")! as URL, scope: nil, success: { (requestToken) in
//        
//        let url = NSURL( string: "https://github.com/login/oauth/access_token" + requestToken?.token)
//     UIApplication.shared.canOpenURL(url)
//    }){ (error) in
//        print( "no asses")
//    }
//    }

//    func chilkatTest() {
//        //  This example requires the Chilkat API to have been previously unlocked.
//        //  See Global Unlock Sample for sample code.
//        /
//        let oauth2 = BDBOAuth1SessionManager
//        var success: Bool
//        
//        //  This should be the port in the localhost callback URL for your app.
//        //  The callback URL would look like "http://localhost:3017/" if the port number is 3017.
//        oauth2.ListenPort = 3017
//        
//        oauth2.AuthorizationEndpoint = "https://github.com/login/oauth/authorize"
//        oauth2.TokenEndpoint = "https://github.com/login/oauth/access_token"
//        
//        //  Replace these with actual values.
//        oauth2.ClientId = "GITHUB-CLIENT-ID"
//        oauth2.ClientSecret = "GITHUB-CLIENT-SECRET"
//        
//        oauth2.CodeChallenge = true
//        oauth2.CodeChallengeMethod = "S256"
//        
//        //  Begin the OAuth2 three-legged flow.  This returns a URL that should be loaded in a browser.
//        var url: String? = oauth2.StartAuth()
//        if oauth2.LastMethodSuccess != true {
//            print("\(oauth2.LastErrorText)")
//            return
//        }
//        
//        //  At this point, your application should load the URL in a browser.
//        //  For example,
//        //  in C#:  System.Diagnostics.Process.Start(url);
//        //  in Java: Desktop.getDesktop().browse(new URI(url));
//        //  in VBScript: Set wsh=WScript.CreateObject("WScript.Shell")
//        //               wsh.Run url
//        //  The GitHub account owner would interactively accept or deny the authorization request.
//        
//        //  Add the code to load the url in a web browser here...
//        //  Add the code to load the url in a web browser here...
//        //  Add the code to load the url in a web browser here...
//        
//        //  Now wait for the authorization.
//        //  We'll wait for a max of 30 seconds.
//        var numMsWaited: Int = 0
//        while (numMsWaited < 30000) && (oauth2.AuthFlowState.integerValue < 3) {
//            oauth2.SleepMs(100)
//            numMsWaited = numMsWaited + 100
//        }
//        
//        //  If there was no response from the browser within 30 seconds, then
//        //  the AuthFlowState will be equal to 1 or 2.
//        //  1: Waiting for Redirect. The OAuth2 background thread is waiting to receive the redirect HTTP request from the browser.
//        //  2: Waiting for Final Response. The OAuth2 background thread is waiting for the final access token response.
//        //  In that case, cancel the background task started in the call to StartAuth.
//        if oauth2.AuthFlowState.integerValue < 3 {
//            oauth2.Cancel()
//            print("No response from the browser!")
//            return
//        }
//        
//        //  Check the AuthFlowState to see if authorization was granted, denied, or if some error occurred
//        //  The possible AuthFlowState values are:
//        //  3: Completed with Success. The OAuth2 flow has completed, the background thread exited, and the successful JSON response is available in AccessTokenResponse property.
//        //  4: Completed with Access Denied. The OAuth2 flow has completed, the background thread exited, and the error JSON is available in AccessTokenResponse property.
//        //  5: Failed Prior to Completion. The OAuth2 flow failed to complete, the background thread exited, and the error information is available in the FailureInfo property.
//        if oauth2.AuthFlowState.integerValue == 5 {
//            print("OAuth2 failed to complete.")
//            print("\(oauth2.FailureInfo)")
//            return
//        }
//        
//        if oauth2.AuthFlowState.integerValue == 4 {
//            print("OAuth2 authorization was denied.")
//            print("\(oauth2.AccessTokenResponse)")
//            return
//        }
//        
//        if oauth2.AuthFlowState.integerValue != 3 {
//            print("Unexpected AuthFlowState:\(oauth2.AuthFlowState.integerValue)")
//            return
//        }
//        
//        print("OAuth2 authorization granted!")
//        print("Access Token = \(oauth2.AccessToken)")
//        
//    }
//    
//    
//
    
}
