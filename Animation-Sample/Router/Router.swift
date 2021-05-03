
import UIKit

final class Router {
    static func showRoot(window: UIWindow) {
        let mainVC = UIStoryboard.main
        let navMainVC = UINavigationController(rootViewController: mainVC)
        window.rootViewController = navMainVC
        window.makeKeyAndVisible()
    }
    
    static func showFirst(from: UIViewController) {
        let firstVC = UIStoryboard.first
        from.navigationController?.pushViewController(firstVC, animated: true)
    }
    
    static func showSecond(from: UIViewController) {
        let secondVC = UIStoryboard.second
        secondVC.modalTransitionStyle = .crossDissolve
        secondVC.modalPresentationStyle = .overCurrentContext
        
        from.present(secondVC, animated: false) {
            secondVC.showDialogView(isAnimation: true)
        }
    }
    
    static func showSub(from: UIViewController) {
        let subVC = UIStoryboard.sub
        from.navigationController?.pushViewController(subVC, animated: true)
    }
    
    static func push(from: UIViewController) {
        let mainVC = UIStoryboard.main
        let navMainVC = UINavigationController(rootViewController: mainVC)
        navMainVC.modalPresentationStyle = .fullScreen
        
        from.present(navMainVC, animated: false) {
            mainVC.showSub()
        }
    }
    
    static func dismiss(from: UIViewController) {
        from.dismiss(animated: true, completion: nil)
    }
    
    static func showThird(from: UIViewController) {
        let thirdVC = UIStoryboard.third
        thirdVC.modalTransitionStyle = .crossDissolve
        thirdVC.modalPresentationStyle = .overCurrentContext
        
        from.present(thirdVC, animated: false) {
            thirdVC.showMainView()
        }
    }
}

