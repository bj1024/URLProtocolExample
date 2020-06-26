# URLProtocolExample

How to test [URLSession](https://developer.apple.com/documentation/foundation/urlsession)?

When call the some api , we use dataTask Method of URLSession class.
When testing api call, we want to mock the URLSession.


The major way of Mocking URLSession for unit testing is follows.
- Define the Protcol of  URLSession , URLSessionDataTask.
 Then create Mock class.

- In WWDC 2018, Apple introduced a way of unittesting using URLProtocol.


This is sample of unit test with URLProtocol.
 

# Reference 

## URLSession

 [URLSession \| Apple Developer Documentation](https://developer.apple.com/documentation/foundation/urlsession)

##  URLProtocol

> URLProtocol An abstract class that handles the loading of protocol-specific URL data.
> [URLProtocol | Apple Developer Documentation](https://developer.apple.com/documentation/foundation/urlprotocol)


## protocolClasses
protocolClasses | Apple Developer Documentation https://developer.apple.com/documentation/foundation/urlsessionconfiguration/1411050-protocolclasses

## WWDC 2018 Testing Tips & Tricks

> Testing Tips & Tricks Testing is an essential tool to consistently verify your code works correctly, but often your code has dependencies that are out of your control\. Discover techniques for making hard\-to\-test code testable on Apple platforms using XCTest\. Learn a variety of tips for writing higher\-quality tests that run fast and require less maintenance\. 
> [Testing Tips & Tricks - WWDC 2018 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2018/417) 
> [https://developer.apple.com/videos/play/wwdc2018/417](https://developer.apple.com/videos/play/wwdc2018/417s) 


## 

