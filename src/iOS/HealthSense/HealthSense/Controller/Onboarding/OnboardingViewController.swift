//
//  OnboardingViewController.swift
//  HealthSense
//
//  Created by Sensehack on 4/23/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource {
   
    
    lazy var viewControllerList: [UIViewController] = {
       
        let storyB = UIStoryboard(name: "Onboarding", bundle: nil)
//        let vc1 = storyB.instantiateViewController(withIdentifier: "FirstOnboardingVC")
        let vc1 = storyB.instantiateViewController(withIdentifier: HSOnboardViewController.kFirstVC.rawValue)
        let vc2 = storyB.instantiateViewController(withIdentifier: HSOnboardViewController.kSecondVC.rawValue)
        let vc3 = storyB.instantiateViewController(withIdentifier: HSOnboardViewController.kThirdVC.rawValue)
        
        return [vc1, vc2, vc3]
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.dataSource = self
        
        print("Yo viewDidLoad", viewControllerList)
        
        if let firstViewController = viewControllerList.first {
            print("firstViewController", firstViewController )
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
       }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {return nil}
        guard viewControllerList.count > previousIndex else {return nil}
        
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.firstIndex(of: viewController) else {return nil}
        
        let nextIndex = vcIndex + 1
        guard viewControllerList.count != nextIndex else {return nil}
        
        guard viewControllerList.count > nextIndex else {return nil}
        
        return viewControllerList[nextIndex]
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
