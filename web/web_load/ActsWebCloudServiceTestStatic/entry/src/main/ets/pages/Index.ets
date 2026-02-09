import { Entry, Web, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent,
  OnProgressChangeEvent, WebResourceResponse, WebResourceRequest, SslErrorHandler,
  JsResult, HttpAuthHandler, DataResubmissionHandler, ConsoleMessage, ClientAuthenticationHandler,
  OnLoadInterceptEvent, OnPageBeginEvent, OnPageEndEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import webView from '@ohos.web.webview';
import { Utils } from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@ohos.UiTest';
import { RecordData } from '@ohos.base';

class TestObj {
  constructor() {
  }

  test(str: string): ArrayBuffer {
    let buf = new ArrayBuffer(str.length);
    let buff = new Uint8Array(buf);

    for (let i = 0; i < str.length; i++) {
      buff[i] = str.charCodeAt(i);
    }
    return buf;
  }
}

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  message: string = 'var';
  changeValue() {
    this.stateVar+='~'
  }

  webviewController: webView.WebviewController = new webView.WebviewController(undefined);
  @State progress: string = ""
  @State pageBegin: string = ""
  @State pageEnd: string = ""
  @State loadIntercept: string = ""
  @State loadedUrl: string = ""
  @State clickEvent: string = ""
  @State testObjtest: TestObj = new TestObj()

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', "aboutToAppear");
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10
    }
    emitter.on(valueChangeEvent, (eventData: emitter.EventData) => {
      hilog.info(0x0000, 'testTag', "web page valueChangeCallBack");
      if (eventData != null) {
        hilog.info(0x0000, 'testTag', "valueChangeCallBack=" + JSON.stringify(eventData));
        const data = eventData.data as Record<string, RecordData>;
        if (data != null && data['ACTION'] != null) {
          try {
            this.clickEvent = String(data['ACTION']);
            hilog.info(0x0000, 'testTag', "valueChangeCallBack clickEvent=" + this.clickEvent);
            this.webviewController.loadUrl('resource://rawfile/first.html');
          } catch (error) {
            hilog.info(0x0000, 'testTag', 'ErrorCode: error');
          }
        }
      }
    })
  }

  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button("WebAttributeTestButton")
        .key('WebAttributeTestButton')
        .focusable(true)
        .onFocus(() => {
          hilog.info(0x0000, 'testTag', "onFocus==>")
        })
        .onBlur(() => {
          hilog.info(0x0000, 'testTag', "onBlur==>")
        })
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', "key==>" + this.clickEvent);
          switch (this.clickEvent) {
            case "OnPageBegin": {
              try {
                this.webviewController.loadUrl("resource://rawfile/first.html")
                Utils.emitEvent(this.pageBegin, 100);
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "OnPageEnd": {
              try {
                this.webviewController.loadUrl("resource://rawfile/first.html")
                setTimeout(() => {
                  Utils.emitEvent(this.pageEnd, 101);
                }, 1000)
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "OnProgressChange": {
              try {
                this.webviewController.loadUrl("resource://rawfile/second.html")
                setTimeout(() => {
                  Utils.emitEvent(this.progress, 102);
                }, 2000)
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "OnLoadIntercept": {
              try {
                this.loadIntercept = '';
                this.webviewController.loadUrl("resource://rawfile/second.html");
                setTimeout(() => {
                  Utils.emitEvent(this.loadIntercept, 104);
                }, 2000)
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
          }
        })

      Button("WebviewContrllerTestButton")
        .key('WebviewContrllerTestButton')
        .focusable(true)
        .onFocus(() => {
          hilog.info(0x0000, 'testTag', "onFocus==>")
        })
        .onBlur(() => {
          hilog.info(0x0000, 'testTag', "onBlur==>")
        })
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', "key==>" + this.clickEvent);
          switch(this.clickEvent) {
            case "Refresh": {
              try {
                this.pageBegin = ''
                this.webviewController.refresh();
                setTimeout(() => {
                  Utils.emitEvent(this.pageBegin, 105);
                }, 2000)
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "Stop": {
              try {
                this.webviewController.stop();
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "PostUrl": {
              try {
                let postData = this.testObjtest.test("Name=test&Password=test");
                this.webviewController.postUrl('resource://rawfile/second.html', postData);
                let url: string = this.webviewController.getUrl();
                Utils.emitEvent(url, 106);
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "LoadData": {
              try {
                this.webviewController.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                setTimeout(() => {
                  let title: string = this.webviewController.getTitle();
                  Utils.emitEvent(title, 107);
                }, 2000)
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "OriginalUrl": {
              try {
                this.webviewController.loadUrl("resource://rawfile/second.html");
                Utils.msSleep(2000);
                let url = this.webviewController.getUrl();
                let originUrl = this.webviewController.getOriginalUrl();
                let result = url + "*" + originUrl;
                Utils.emitEvent(result, 111);
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "GetLastJavascriptProxyCallingFrameUrl": {
              try {
                let url = this.webviewController.getLastJavascriptProxyCallingFrameUrl();
                if (url == "") {
                  Utils.emitEvent("true", 112);
                }
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "BackwardAndForward": {
              try {
                let result: string = "";
                this.webviewController.loadUrl("resource://rawfile/second.html");
                setTimeout(() => {
                  result = this.webviewController.accessBackward() ? "true" : "false";
                  this.webviewController.backward();
                  setTimeout(() => {
                    result += "*";
                    result += this.webviewController.getUrl();
                    result += "*";
                    result += this.webviewController.accessForward() ? "true" : "false";
                    this.webviewController.forward();
                    setTimeout(() => {
                      result += "*";
                      result += this.webviewController.getUrl();
                      Utils.emitEvent(result, 117);
                    }, 1000)
                  }, 1000)
                }, 1000)
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "ClearWebSchemeHandler": {
              try {
                webView.WebviewController.initializeWebEngine();
                this.webviewController.clearWebSchemeHandler();
                Utils.emitEvent("done", 118)
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "WebSchemeHandlerResponse": {
              try {
                let response = new webView.WebSchemeHandlerResponse();
                response.setUrl("https://www.example.com");
                let url = response.getUrl();
                Utils.emitEvent(url, 120);
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "WebDownloadItem": {
              try {
                let delegate: webView.WebDownloadDelegate = new webView.WebDownloadDelegate();
                delegate.onBeforeDownload((webDownloadItem: webView.WebDownloadItem) => {
                  let url = webDownloadItem.getUrl();
                  Utils.emitEvent(url, 121);
                  hilog.info(0x0000, 'testTag', 'will start a download, url=' + webDownloadItem.getUrl());
                })
                this.webviewController.setDownloadDelegate(delegate);
                Utils.msSleep(2000);
                this.webviewController.startDownload('https://www.example.com');
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
            case "Constructor": {
              try {
                // WebResourceResponse
                let webResourceResponse = new WebResourceResponse();
                // WebResourceRequest
                let webResourceRequest = new WebResourceRequest();
                // SslErrorHandler
                let sslErrorHandler = new SslErrorHandler();
                // JsResult
                let jsResult = new JsResult();
                // HttpAuthHandler
                let httpAuthHandler = new HttpAuthHandler();
                // DataResubmissionHandler
                let dataResubmissionHandler = new DataResubmissionHandler();
                // ConsoleMessage
                let consoleMessage = new ConsoleMessage();
                // ClientAuthenticationHandler
                let client = new ClientAuthenticationHandler();
                Utils.emitEvent("done", 130);
              } catch (error) {
                hilog.info(0x0000, 'testTag', 'ErrorCode: error');
              }
              break;
            }
          }
        })

      Web({ src: "resource://rawfile/first.html", controller: this.webviewController })
        .key('webView')
        .width('100%')
        .databaseAccess(true)
        .onLoadIntercept((event: OnLoadInterceptEvent): boolean => {
          this.loadIntercept = "onLoadIntercept";
          hilog.info(0x0000, 'testTag', 'onLoadIntercept==>');
          return false;
        })
        .onPageBegin((event: OnPageBeginEvent): void => {
          if (event) {
            this.pageBegin = event.url;
            hilog.info(0x0000, 'testTag', 'onPageBegin==> event.url:' + event.url);
          }
        })
        .onProgressChange((event: OnProgressChangeEvent): void => {
          if (event) {
            this.progress = "onProgressChange";
            hilog.info(0x0000, 'testTag', 'onProgressChange==> event.progress:' + event.newProgress);
          }
        })
        .onPageEnd((event: OnPageEndEvent): void => {
          if (event) {
            this.pageEnd = event.url;
            hilog.info(0x0000, 'testTag', 'onPageEnd==> event.url:' + event.url);
          }
        })

    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize(50)
  }
}
