//
//  BaseViewController.swift
//
//
//  Created by Wei Guang
//

#if os(iOS)
import UIKit
import SafariServices

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
    
    public func showShareSheet(items: [Any]) {
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityViewController, animated: true)
    }

    public func presentInAppSafari(url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        present(safariViewController, animated: true)
    }
}

extension BaseViewController: SFSafariViewControllerDelegate {
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
}
#endif

