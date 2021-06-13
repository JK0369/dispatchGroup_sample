//
//  ViewController.swift
//  DispatchGroupdSample
//
//  Created by 김종권 on 2021/06/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        let animationGroup = DispatchGroup()

        // enter
        animationGroup.enter()
        UIView.animate(withDuration: 1.5) {
            self.view1.backgroundColor = .blue
        } completion: { _ in

            // leave
            animationGroup.leave()
        }

        // enter
        animationGroup.enter()
        UIView.animate(withDuration: 3) {
            self.view2.backgroundColor = .green
        } completion: { _ in

            // leave
            animationGroup.leave()
        }

        // notify
        animationGroup.notify(queue: .main) {
            self.performSegue(withIdentifier: "nextSceneSegue", sender: nil)
        }
    }
}

