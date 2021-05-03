
import UIKit

final class FirstViewController: UIViewController {

    @IBOutlet weak private var view1: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAnimation1))
            view1.addGestureRecognizer(gesture)
        }
    }
    
    @IBOutlet weak private var view2: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAnimation2))
            view2.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak private var view3: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAnimation3))
            view3.addGestureRecognizer(gesture)
        }
    }
    
    private var isRotated: Bool = false
    
    @IBOutlet weak private var backGroundView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(tapBackGroundView))
            backGroundView.addGestureRecognizer(gesture)
        }
    }
    private var isBgAnimated: Bool = false
    
    @IBOutlet weak private var redShowConst: NSLayoutConstraint!
    @IBOutlet weak private var redDismissConst: NSLayoutConstraint!
    @IBOutlet weak private var blueShowConst: NSLayoutConstraint!
    @IBOutlet weak private var blueDismissConst: NSLayoutConstraint!
    @IBOutlet weak private var yellowShowConst: NSLayoutConstraint!
    @IBOutlet weak private var yellowDismissConst: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc
    private func tapAnimation1() {
        // UIViewにはアニメーションを行うためのメソッドが用意されている
        
        // UIView.animate(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, options: <#T##UIView.AnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        // withDuration アニメーション時間
        // delay 開始までの遅延時間
        // options アニメーション中に使用するタイミング曲線の種類やアニメーションの逆再生などを指定できる
        // animations クロージャの中でアニメーションしたいUIViewクラスのプロパティの値を変更する
        // completion アニメーションが完了したタイミングで呼ばれるクロージャ
        
        UIView.animate(withDuration: 0.2) {
            // transformプロパティにCGAffineTransform任意のパラメータを代入することによって
            // 拡大・縮小・回転など様々なアニメーションを行ってくれる
            self.view1.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.view1.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                
            } completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    self.view1.transform = .identity
                    
                }, completion: nil)
            }
        }
    }
    
    @objc
    private func tapAnimation2() {
        let angle = isRotated ? 0.0 : CGFloat(90.0 / 180 * Double.pi)
        isRotated.toggle()
        
        UIView.animate(withDuration: 1) {
            self.view2.transform = CGAffineTransform(rotationAngle: angle)
        }
        
        if isRotated {
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
                self.view2.backgroundColor = .red
            }
            
        }else {
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
                self.view2.backgroundColor = .systemTeal
            }
        }

    }
    
    @objc
    private func tapAnimation3() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.view3.transform = CGAffineTransform(translationX: 200, y: 0)
            
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseIn) {
                self.view3.transform = .identity
                
            } completion: { _ in
                UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn) {
                    self.view1.transform = CGAffineTransform(translationX: 0, y: -100)
                    self.view2.transform = CGAffineTransform(translationX: 0, y: -50)
                    
                } completion: { _ in
                    UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn) {
                        self.view1.transform = .identity
                        self.view2.transform = .identity
                        self.view3.backgroundColor = .black
                        self.view3.alpha = 0.0
                        
                    }completion: { _ in
                        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn) {
                            self.view3.alpha = 100.0
                            self.view3.backgroundColor = .systemTeal
                        }
                    }
                }
            }
        }
    }
    
    @objc
    private func tapBackGroundView() {
        isBgAnimated.toggle()
        
        if isBgAnimated {
            // 制約はあくまでルールなので、オンオフを切り替えただけではViewは変化なし
            self.redDismissConst.isActive = false
            self.redShowConst.isActive = true
            
            UIView.animate(withDuration: 0.5) {
                // 即座に制約に基づいてViewを再描画する
                self.view.layoutIfNeeded()
                
            } completion: { _ in
                self.blueDismissConst.isActive = false
                self.blueShowConst.isActive = true
                
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                    
                } completion: { _ in
                    self.yellowDismissConst.isActive = false
                    self.yellowShowConst.isActive = true
                    
                    UIView.animate(withDuration: 0.5) {
                        self.view.layoutIfNeeded()
                        
                    }
                }
            }
            
        }else {
            self.redShowConst.isActive = false
            self.redDismissConst.isActive = true
            
            self.blueShowConst.isActive = false
            self.blueDismissConst.isActive = true
            
            self.yellowShowConst.isActive = false
            self.yellowDismissConst.isActive = true
            
            UIView.animate(withDuration: 0.5) {
                // 即座に制約に基づいてViewを再描画する
                self.view.layoutIfNeeded()
            }
        }
    }

}
