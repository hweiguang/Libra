//
//  BaseViewController.swift
//
//  Copyright © 2021 Wei Guang. All rights reserved.
//

import UIKit
#if !os(tvOS)
import SafariServices
#endif

open class BaseViewController: UIViewController {
    public func showAlert(title: String?,
                          message: String?,
                          handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: "OK"),
                                   style: .default,
                                   handler: handler)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
    
    public func showConfirmationAlert(title: String?,
                                      message: String?,
                                      okHandler: ((UIAlertAction) -> Void)? = nil,
                                      cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: "OK"),
                                     style: .default,
                                     handler: okHandler)
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel"),
                                         style: .cancel,
                                         handler: cancelHandler)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    public func showGenericErrorAlert() {
        let alertController = UIAlertController(title: NSLocalizedString("Oops", comment: "Oops"),
                                                message: NSLocalizedString("Something went wrong. Please try again.",
                                                                           comment: "Something went wrong. Please try again."),
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    public func presentInAppSafari(url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        present(safariViewController, animated: true)
    }
}

#if !os(tvOS)
extension BaseViewController: SFSafariViewControllerDelegate {
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
}
#endif
