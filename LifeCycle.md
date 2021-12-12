UIViewLifeCycle
UIViewControllerLifeCYcle

AppLifeCycle
SceneBased
 UnAttached -> Foreground Active -> Foreground Inactive -> Background -> Suspended

 AppDelegate Based

 Not Running -> Inactive -> Active -> Suspended -> Background -> Inactive

 https://developer.apple.com/documentation/uikit/uiapplicationdelegate
https://medium.com/@neroxiao/ios-app-life-cycle-ec1b31cee9dc


App Delegate Methods

https://developer.apple.com/documentation/New-Technologies-WWDC21


application:willFinishLaunchingWithOptions:—This method is your app’s first chance to execute code at launch time.
application:didFinishLaunchingWithOptions:—This method allows you to perform any final initialization before your app is displayed to the user.
applicationDidBecomeActive:—Lets your app know that it is about to become the foreground app. Use this method for any last minute preparation.
applicationWillResignActive:—Lets you know that your app is transitioning away from being the foreground app. Use this method to put your app into a quiescent state.
applicationDidEnterBackground:—Lets you know that your app is now running in the background and may be suspended at any time.
applicationWillEnterForeground:—Lets you know that your app is moving out of the background and back into the foreground, but that it is not yet active.
applicationWillTerminate:—Lets you know that your app is being terminated. This method is not called if your app is suspended.

Scene methods

1. scene(_:willConnectTo:options:)
2. sceneDidDisconnect(_:)



3. sceneDidBecomeActive(_:)
4. sceneWillResignActive(_:)
5. sceneWillEnterForeground(_:)
6. sceneDidEnterBackground(_:)



