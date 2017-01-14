//
//  AppDelegate.swift
//  SegmentedMenu
//
//  Created by Mac Bellingrath on 1/14/17.
//  Copyright © 2017 Mac Bellingrath. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    setAppRootViewController()
    configureAppearance()
    return true
  }
 
  private func setAppRootViewController() {
    let _window             = window ?? UIWindow(frame: UIScreen.main.bounds)
    window                  = _window
    _window.backgroundColor = .white
    
    let nav                 = HomeNavigationController(rootViewController: ViewController())
    _window.rootViewController = nav
    _window.makeKeyAndVisible()
  }
  
  private func configureAppearance() {
    UINavigationBar.make { (appearance) in
      appearance.backgroundColor = .white
      appearance.isOpaque = true
      
      appearance.barTintColor    = .white
      appearance.backgroundColor = .white
      appearance.isTranslucent   = false
      appearance.isOpaque        = true
      
      let image                     = UIImage()
      appearance.setBackgroundImage(image, for: .default)
      appearance.shadowImage        = image
      
      appearance.titleTextAttributes = [
        NSFontAttributeName            : UIFont.boldSystemFont(ofSize: UIFont.systemFontSize),
        NSForegroundColorAttributeName : UIColor.darkGray
      ]
    }
    
    UIBarButtonItem.make { apperance in
      apperance.tintColor = .darkGray
    }
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    self.saveContext()
  }

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
      /*
       The persistent container for the application. This implementation
       creates and returns a container, having loaded the store for the
       application to it. This property is optional since there are legitimate
       error conditions that could cause the creation of the store to fail.
      */
      let container = NSPersistentContainer(name: "SegmentedMenu")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
              // Replace this implementation with code to handle the error appropriately.
              // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
               
              /*
               Typical reasons for an error here include:
               * The parent directory does not exist, cannot be created, or disallows writing.
               * The persistent store is not accessible, due to permissions or data protection when the device is locked.
               * The device is out of space.
               * The store could not be migrated to the current model version.
               Check the error message to determine what the actual problem was.
               */
              fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
      return container
  }()

  // MARK: - Core Data Saving support

  func saveContext () {
      let context = persistentContainer.viewContext
      if context.hasChanges {
          do {
              try context.save()
          } catch {
              // Replace this implementation with code to handle the error appropriately.
              // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
              let nserror = error as NSError
              fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
      }
  }
}

extension UIAppearance {
  static func make(closure: (_ appearance: Self) -> Void) {
    closure(appearance())
  }
}


