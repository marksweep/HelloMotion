class AppDelegate
	def application(application, didFinishLaunchingWithOptions:launchOptions)
		# UIScreen descibes the dipla our app is running on
		@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
		@window.makeKeyAndVisible

		# @window.rootViewController = TapController.alloc.initWithNibName(nil, bundle: nil)
		controller = TapController.alloc.initWithNibName(nil, bundle: nil)
		@window.rootViewController = UINavigationController.alloc.initWithRootViewController(controller)

		true
	end
end
