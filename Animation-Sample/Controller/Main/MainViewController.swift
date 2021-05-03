
import UIKit

 final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction private func showFirst(_ sender: UIButton) {
        Router.showFirst(from: self)
    }
    
    @IBAction private func showSecond(_ sender: UIButton) {
        Router.showSecond(from: self)
    }
    
    @IBAction private func showThird(_ sender: UIButton) {
        Router.showThird(from: self)
    }
    
    func showSub() {
        Router.showSub(from: self)
    }
 }

