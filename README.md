
# GitHub Pofile Demo

This Project will display the implementation of GitHub Public API's using SOLID principles and Design patterns (MVVM+R) with Reactive Combine framework




## Supports


[![Language](https://img.shields.io/badge/Language-Swift%205.0%20--%205.7-orange)](https://www.swift.org/documentation/)

[![PlatForm](https://img.shields.io/badge/Platform-iOS%20--%20iPhone-green)](http://www.gnu.org/licenses/agpl-3.0)


## Implementation

- [Design Pattern MVVM + Repository (Using SOLID    Principles)](https://github.com/Hassandadkhanit/GitHubProfile/branch#mvvm--repository-implementation)
- [Combine Framework](https://github.com/Hassandadkhanit/GitHubProfile/tree/phase2#combine-implementation)
- [iOS Environments](https://github.com/Hassandadkhanit/GitHubProfile/tree/phase2#ios-environments)
- [Unit Test Cases](https://github.com/Hassandadkhanit/GitHubProfile/tree/phase2#unit-test-cases)
- [Api Implementation](https://github.com/Hassandadkhanit/GitHubProfile/tree/phase2#api-implementation)
- [IQKeyboard](https://github.com/Hassandadkhanit/GitHubProfile/tree/phase2#iqkeyboard)
- [Custom Fonts](https://github.com/Hassandadkhanit/GitHubProfile/tree/phase2#custom-fonts)
- [CI/CD Using FastLane (In Progress) ](https://github.com/Hassandadkhanit/GitHubProfile/tree/phase2#fastlane)

## GitHub API Reference



```http 
  GET https://api.github.com/users/{username}
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `username` | `string` | **Required**. Username Github Profile |




## MVVM + Repository Implementation

![example](https://raw.githubusercontent.com/Hassandadkhanit/GitHubProfile/main/mvvm-r.jpeg)


UIViewController only responsible for updating Views

ViewModel contain all the business logic

Model contain Codable Struct

Repository is responsible for data from (Database or WebSerice)


## Combine Implementation

![example](https://github.com/Hassandadkhanit/GitHubProfile/blob/main/combineExample.png?raw=true)

The Combine framework provides a declarative Swift API for processing values over time. These values can represent many kinds of asynchronous events. Combine declares publishers to expose values that can change over time, and subscribers to receive those values from the publishers

We were using completion handler to receive result after getting asynchronous response but combine is really flexiable and also provide to modify data using operator and thraed managment to update views.


## iOS environments


Every new Xcode project comes with two default configurations, Debug and Release.

![example](https://d33wubrfki0l68.cloudfront.net/904670edb1718a697d5637e457792527aaefccb2/2a32b/images/configurations-add-3.png)

When things get more complicated, these two configurations are no longer enough. If your app needs to communicate with an external service, you can't afford to develop and test your app in the same environment that your users use, where one mistake can harm your users. That's why we need multiple environments for our development (Assume your external service also has a separate environment for testing).

These configurations capture a build configuration that matches their intention. For example, Debug configuration set Optimization Level to None because we want to debug our code without the compiler interfering. In comparison, the Release configuration set this value to Fastest, Smallest to let the compiler optimize our code for performance and space.

 I Have created three environments
- Development 
- Staging
- Production

Creating multiple scheme with with difference configuration can reduce our workload and by changing scheme will be updated.

Difference Scheme have:
- Multiple Identifers
- Multiple Provision profiles
- Multiple App Icons
- Multiple App Names
- Multiple environment will have e.g (baseUrl,Auth Keys etc)

For details documentation Please [click here](https://sarunw.com/posts/how-to-set-up-ios-environments/#assign-current-configuration-to-info.plist)

## Unit Test cases

For functional automation testing. We have Model-View-ViewModel (MVVM) architecture, we separate the business logic and presentational logic from the view logic. The separation of concerns (SoC) makes writing unit tests easier than ever. Even though the idea of the MVVM is simple, writing unit tests for its various use cases is still worth mentioning

In short, I will cover two techniques:

- How to design a mock to simulate different network states.
- How to use stubs to test user interaction.


For detail documentation Please [click here](https://medium.com/@koromikoneo/applying-unit-tests-to-mvvm-with-swift-ba5a79df8a18)




## API Implementation

For all the network calls we have created the base call 

```

    class APIClientHandler {
    
    static var shared = APIClientHandler()
    private let session: URLSession
    private var cancellable = Set<AnyCancellable>()
    
    init(session: URLSession = URLSession(configuration: URLSessionConfiguration.default)) {
        self.session = session
    }
```

To send request using datapublisher

```
        func sendRequest(urlString: String, parameters: [String: Any?],method: HTTPMethods) -> AnyPublisher<Data, Error> {
        guard let request = self.makeRequest(urlString: urlString, parameters: parameters, method: method) else {
            return .fail(NetworkError.invalidRequest)
        }
        return session.dataTaskPublisher(for: request)
            .mapError { _ in NetworkError.invalidRequest }
            .flatMap { data, response -> AnyPublisher<Data, Error> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    if let httpResponse = response as? HTTPURLResponse {
                        self.showRequestDetailForFailure(responseObject: httpResponse, data: data)
                    }
                    return .fail(NetworkError.invalidURL)
                }
                
                guard 200..<300 ~= httpResponse.    statusCode else {
                    self.showRequestDetailForFailure(responseObject: httpResponse, data: data)
                    return .fail(NetworkError.invalidResponse)
                }
                self.showRequestDetailForSuccess(responseObject: httpResponse, data: data)
                return .just(data)
            }
            .eraseToAnyPublisher()
    }

```

## IQKeyboard

Implemented IQkeyboard Pod to handle keyboard

For detail documentation Please [click here](https://github.com/hackiftekhar/IQKeyboardManager)

## Custom Fonts 

Implemented Custom fonts 

For detail documentation Please [click here](https://github.com/hackiftekhar/IQKeyboardManager)

## FastLane

CI/CD Implementation (In Progress)

For detail documentation Please [click here](https://docs.fastlane.tools/getting-started/ios/setup/)




## Feedback

If you have any feedback, please reach out to us at hassandadkhanit@gmail.com


![Logo](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/th5xamgrr6se0x5ro4g6.png)

