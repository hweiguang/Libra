//
//  UIViewController+Extension.swift
//  
//
//  Created by Wei Guang
//

#if os(iOS)
import UIKit
import SafariServices

public typealias AlertActionHandler = ((UIAlertAction) -> Void)?

public extension UIViewController {
    func showAlert(title: String?,
                   message: String?,
                   handler: AlertActionHandler = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: "OK"),
                                   style: .default,
                                   handler: handler)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
    
    func showConfirmationAlert(title: String?,
                               message: String?,
                               okHandler: AlertActionHandler = nil,
                               cancelHandler: AlertActionHandler = nil) {
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
    
    func showGenericErrorAlert() {
        let alertController = UIAlertController(title: NSLocalizedString("Oops", comment: "Oops"),
                                                message: NSLocalizedString("Something went wrong. Please try again.",
                                                                           comment: "Something went wrong. Please try again."),
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    func showShareSheet(items: [Any]) {
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityViewController, animated: true)
    }
}
#endif
