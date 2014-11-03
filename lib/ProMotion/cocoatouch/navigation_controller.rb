module ProMotion
  class NavigationController < UINavigationController

    def popViewControllerAnimated(animated)
      super
      self.viewControllers.last.send(:on_back) if self.viewControllers.last.respond_to?(:on_back)
    end

    def shouldAutorotate
      visibleViewController.shouldAutorotate if visibleViewController
    end

    def supportedInterfaceOrientations
      visibleViewController.supportedInterfaceOrientations if visibleViewController
    end

    def preferredInterfaceOrientationForPresentation
      visibleViewController.preferredInterfaceOrientationForPresentation if visibleViewController
    end

  end
end
