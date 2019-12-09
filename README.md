# Qreact app rate
QReact is an easy-to-use Survey Software for Customers, Employees and Research. You can redirect your users feedback to qreact and get detailed information about your app. For more information please see [the website](https://www.qreact.net)

# Usage

### Step 1. Add QreactRate to your pod file
```pod
target 'MyApp' do
  pod 'QreactRate'
end
```

Then run a ```pod pod install``` inside your terminal, or from CocoaPods.app.
Alternatively to give it a test run, run the command:

```pod
pod try QreactRate
```

### Step 3. Add Qreact rate to your view controller
Including the rate only in one view controller is enough.
```swift
      let rate = QRate()
      rate.show(view: self.view)
```

Default conditions of dialog as below:
1. App is launched more than n days later than installation. Default value is zero. Change via setDaysUntilPrompt().
2. App is launched more than n times. Default value is zero. Change via setLaunchesUntilPrompt().
3. App redirects to qreact if rate value smaller than and equal to target level value. Otherwise app redirects user to play store. Default value is zero. Change via setTargetLevel().
4. You should get token from [the website](https://www.qreact.net) to get qreact work. Then set via setToken().

### Step 4. Customize dialog
You can set your description and customize cancel, rate and never buttons.

```swift
  rate.setTitle(title: "My title")
  rate.setCancelTitle(cancelTitle: "Custom cancel")
  rate.setNeverTitle(neverTitle: "Custom never")
  rate.setQreactToken(token: "url token")
  rate.setDaysUntilPrompt(daysPrompt: 1)
  rate.setLaunchesUntilPrompt(launchesPrompt: 1)
```

# Licence
MIT License
