class AppDelegate
	# def application(application, didFinishLaunchingWithOptions:launchOptions)
	# 	# UIScreen descibes the dipla our app is running on
	# 	@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
	# 	@window.makeKeyAndVisible

	# 	# @window.rootViewController = TapController.alloc.initWithNibName(nil, bundle: nil)
	# 	controller = TapController.alloc.initWithNibName(nil, bundle: nil)
	# 	nav_controller = UINavigationController.alloc.initWithRootViewController(controller)

	# 	alphabet_controller = AlphabetController.alloc.initWithNibName(nil, bundle:nil)

	# 	tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle:nil)
	# 	tab_controller.viewControllers = [alphabet_controller, nav_controller]

	# 	@window.rootViewController = tab_controller

	# 	true
	# end

	def application(application, didFinishLaunchingWithOptions:launchOptions)
		@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
		@window.makeKeyAndVisible

		# the points we're going to animate to
		@points = [[0,0], [50,0], [0,50], [50,50]]
		@current_index = 0

		# usual method of adding views to our window
		@view = UIView.alloc.initWithFrame [@points[@current_index], [100, 100]]
		@view.backgroundColor = UIColor.blueColor
		@window.addSubview(@view)

		animate_to_next_point

		true
	end

	def animate_to_next_point
		@current_index += 1
		@current_index = @current_index % @points.count

		UIView.animateWithDuration(2,
			delay: 1,
			options: UIViewAnimationOptionCurveLinear,
			animations:
			lambda {
				@view.frame = [@points[@current_index], [100, 100]]
			},
			completion: lambda { |finished|
				self.animate_to_next_point
			}
		)
	end

end
