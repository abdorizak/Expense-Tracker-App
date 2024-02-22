# ![Image](img.png)

## Overview 🫵

Expenses Tracker is designed to provide a seamless experience for managing your expenses and income. It offers user authentication, allowing you to securely access your financial data. The app utilizes programmatic UI, eliminating the need for storyboards. It also features a line chart that visualizes your daily expenses and income.

### Installation 🛠

- Clone / download this repository.
- change the bundle identifier in project settings.
- run the app.

## Screenshots 📸

![Image](Screenshots.png)

### Fetures 📌

- 100% Swift.
- MVC design pattern.
- programmatic UI.
- iPhone SE support.
- Native image caching using `NSCache`
- network request using URLSession async and await. with generic function.
- Custom alert view.
- User Authentication.
- Add Income and Expenses.
- Display Income and Expenses in line chart with table uisng UISegmentedControl.
- ImagePicker, Using Photos, and PhotosUI.
- FaceID Authentication. `LocalAuthentication` framework. _Currently Biometric isn't implemented may be in future update_

### Project Structure 📂

```bash
.
|____Resources
|____Extentions
|____Utilits
|____Models
|____Network Manager
|____Custom Views
| |____AlertsView
| |____Button
| |____Cell
| |____CustomTableView
| |____CustomPageControl
| |____TextField
| |____UIView
| |____ViewController
|____Controllers
| |____LoginAndRegister
| |____Onboarding
| |____Main
  | |____Home
  | |____AddIncomeAndExpenses
  | |____Transactions
  | |____Profile
| |____ProfileView
  | |____About
  | |____ChangePassword
  | |____EditProfile
  | |____UserStatement
```

## Author 📝

**©** **Abdorizak Abdalla** **2022**

### Credits 📚

- [Charts](https://github.com/abdorizak/Expensive-Tracker-App/blob/main/license.md) by Daniel Gindi
- [Expenses Manager API](https://github.com/zakiahmed2020/expense_managerBackEnd) by **[Zaki Ahmed](https://github.com/zakiahmed2020)** && **[Abdorizak Abdalla](https://github.com/abdorizak)**

### License 📜

```bash
MIT License

Copyright (c) 2022 Abdorizak Abdalla 🍎

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
