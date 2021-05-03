
import UIKit

final class ThirdViewController: UIViewController {

    @IBOutlet weak private var slideView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(tapSlideView))
            slideView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak private var slideViewCenterY: NSLayoutConstraint!
    
    @IBOutlet weak private var mainViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // デフォルト位置
        setDefaultPosition()
    }
    
    @objc
    private func tapSlideView() {
        dismissMainView()
    }
    
    func showMainView() {
        // 画面中央に移動させる
        slideViewCenterY.constant = 0
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction private func nobinobiAction(_ sender: UIButton) {
        nobinobi()
    }
    
    @IBAction private func thigithigiAction(_ sender: UIButton) {
        thigithigi()
    }
    
    private func setDefaultPosition() {
        slideViewCenterY.constant = self.view.frame.height / 2
        mainViewHeight.constant = 300
        self.view.layoutIfNeeded()
    }
    
    private func dismissMainView() {
        // 画面中央に移動させる
        slideViewCenterY.constant = self.view.frame.height / 2
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
            
        } completion: { _ in
            Router.dismiss(from: self)
        }
    }
    
    private func nobinobi() {
        mainViewHeight.constant = self.view.frame.height * 0.8
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func thigithigi() {
        mainViewHeight.constant = 300
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
}
