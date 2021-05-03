
import UIKit

extension UIStoryboard {
    static var main: MainViewController {
        UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! MainViewController
    }
    
    static var first: FirstViewController {
        UIStoryboard(name: "First", bundle: nil).instantiateInitialViewController() as! FirstViewController
    }
    
    static var second: SecondViewController {
        UIStoryboard(name: "Second", bundle: nil).instantiateInitialViewController() as! SecondViewController
    }
    
    static var sub: SubViewController {
        UIStoryboard(name: "Sub", bundle: nil).instantiateInitialViewController() as! SubViewController
    }
    
    static var third: ThirdViewController {
        UIStoryboard(name: "Third", bundle: nil).instantiateInitialViewController() as! ThirdViewController
    }
}
