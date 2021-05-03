
import UIKit

final class SecondViewController: UIViewController {

    @IBOutlet weak private var dialogView: UIView! {
        didSet {
            dialogView.layer.cornerRadius = 20
            dialogView.layer.borderWidth = 0.3
            dialogView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    @IBOutlet weak private var dialogViewCenterY: NSLayoutConstraint!
    
    @IBOutlet weak private var dialogViewOkButton: UIButton! {
        didSet {
            dialogViewOkButton.layer.cornerRadius = 10
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // デフォルト位置
        setDefaultPosition()
    }
    
    @IBAction private func close(_ sender: UIButton) {
        dismissDialogView(isAnimation: true)
    }
    
    @IBAction private func ok(_ sender: UIButton) {
        Router.push(from: self)
    }
    
    func showDialogView(isAnimation: Bool = true) {
        dialogViewCenterY.constant = 0
        
        if isAnimation {
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
            
        }else {
            self.view.layoutIfNeeded()
        }
    }
    
    private func setDefaultPosition() {
        dialogViewCenterY.constant = self.view.frame.height
        self.view.layoutIfNeeded()
    }
    
    private func dismissDialogView(isAnimation: Bool = true) {
        dialogViewCenterY.constant = self.view.frame.height
        
        if isAnimation {
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
                
            }completion: { _ in
                Router.dismiss(from: self)
            }
            
        }else {
            self.view.layoutIfNeeded()
        }
    }
}
