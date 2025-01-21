/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import cert from '@ohos.security.cert';

function Uint8ArrayToString(dataArray: Uint8Array) {
  let dataString = ''
  for (let i = 0; i < dataArray.length; i++) {
    dataString += String.fromCharCode(dataArray[i])
  }
  return dataString
}

function ParseX509CertInfo(x509CertArray: Array<cert.X509Cert>) {
  let res: string = 'getCertificate success: len = ' + x509CertArray.length;
  for (let i = 0; i < x509CertArray.length; i++) {
    res += ', index = ' + i + ', issuer name = '
    + Uint8ArrayToString(x509CertArray[i].getIssuerName().data) + ', subject name = '
    + Uint8ArrayToString(x509CertArray[i].getSubjectName().data) + ', valid start = '
    + x509CertArray[i].getNotBeforeTime()
    + ', valid end = ' + x509CertArray[i].getNotAfterTime()
  }
  return res
}

@Entry
@Component
struct WebAttributeTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State initialScale: number = 100
  @State newScale: number = 0
  @State oldScale: number = 0
  @State geolocationAccess: boolean = true
  @State blockNetwork: boolean = false
  @State progress: string = ""
  @State geoShow: boolean = false
  @State pageBegin: string = ""
  @State pageEnd: string = ""
  @State alert: string = ""
  @State confirm: string = ""
  @State prompt: string = ""
  @State errorReceive: string = ""
  @State isHttpErrorReceive: boolean = false
  @State isLargeThan: boolean = false
  @State httpErrorReceive: number = 0
  @State isDownloadStart: boolean = false
  @State newUrl: string = ""
  @State isRefreshed: boolean = false
  @State loadedUrl: string = ""
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State searchResultCount: number = -1
  @State onInterceptKeyEventCode: number = 0;
  @State onFaviconReceivedCalled: boolean = false
  @State outputStr: string = ''
  @State handleCancel: boolean = false;
  @State title: string = ''
  @State onRequestSelectedCalled: boolean = false
  @State testConsole: boolean = false

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        try {
          this.controller.loadUrl("resource://rawfile/index.html");
        } catch (error) {
          console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
        this.errorReceive = ''
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("web click")
          .key('WebAttributeTestButton')
          .focusable(true)
          .onFocus(() => {
            console.log("onFocus==>")
          })
          .onBlur(() => {
            console.log("onBlur==>")
          })
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "emitInitialScale001": {
                try {
                  this.initialScale = 120
                  await Utils.sleep(1000)
                  this.controller.loadUrl("resource://rawfile/index.html");
                  await Utils.sleep(2000)
                  Utils.emitEvent(`oldScale=${this.oldScale},newScale=${this.newScale}`, 70001)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitInitialScale002": {
                try {
                  this.initialScale = 100
                  await Utils.sleep(1000)
                  this.initialScale = 80
                  await Utils.sleep(1000)
                  this.controller.loadUrl("resource://rawfile/index.html");
                  await Utils.sleep(2000)
                  Utils.emitEvent(`oldScale=${this.oldScale},newScale=${this.newScale}`, 70003)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnScaleChange": {
                try {
                  this.initialScale = 100
                  await Utils.sleep(1000)
                  this.initialScale = 110
                  await Utils.sleep(2000)
                  this.controller.loadUrl("resource://rawfile/index.html")
                  await Utils.sleep(2000)
                  Utils.emitEvent(`oldScale=${this.oldScale},newScale=${this.newScale}`, 70005)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnPageEnd001": {
                try {
                  this.pageEnd = ''
                  this.controller.clearHistory()
                  await Utils.sleep(1000)
                  this.controller.loadUrl("resource://rawfile/second.html")
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.pageEnd, 70007)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnPageEnd002": {
                try {
                  this.pageEnd = ''
                  this.controller.clearHistory()
                  await Utils.sleep(1000)
                  this.controller.loadUrl("resource://rawfile/iframe.html")
                  await Utils.sleep(3000)
                  this.controller.runJavaScript("createIframe()", (error, result) => {
                    if (error) {
                      console.info('createIframe() return error: ' + error)
                    }
                    if (result) {
                      console.info('createIframe() return result: ' + result)
                    }
                  })
                  await Utils.sleep(4000)
                  Utils.emitEvent(this.pageEnd, 70008)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnPageBegin001": {
                try {
                  this.pageBegin = ''
                  this.controller.loadUrl("resource://rawfile/second.html")
                  await Utils.sleep(2000)
                  Utils.emitEvent(this.pageBegin, 70009)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnPageBegin002": {
                try {
                  this.pageBegin = ''
                  this.controller.loadUrl("resource://rawfile/iframe.html")
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("createIframe()", (error, result) => {
                    if (error) {
                      console.info('createIframe() return error: ' + error)
                    }
                    if (result) {
                      console.info('createIframe() return result: ' + result)
                    }
                  })
                  await Utils.sleep(4000)
                  Utils.emitEvent(this.pageBegin, 70010)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnProgressChange001": {
                try {
                  this.progress = ''
                  this.controller.loadUrl("resource://rawfile/second.html")
                  await Utils.sleep(2000)
                  Utils.emitEvent(this.progress, 700012)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnTitleReceive001": {
                try {
                  this.controller.loadUrl("resource://rawfile/changeTitle.html");
                  await Utils.sleep(2000)
                  Utils.emitEvent(this.title, 70014)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnTitleReceive002": {
                try {
                  this.controller.loadUrl("resource://rawfile/changeTitle.html");
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("changeTitle(123)")
                  await Utils.sleep(2000)
                  Utils.emitEvent(this.title, 70016)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnGeolocationShow": {
                try {
                  this.geolocationAccess = true
                  this.geoShow = true
                  await Utils.sleep(1000)
                  this.controller.loadUrl("resource://rawfile/geo.html");
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitUserAgent001": {
                try {
                  Utils.emitEvent(this.controller.getCustomUserAgent(), 60063)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnRequestSelected001": {
                try {
                  this.onRequestSelectedCalled = false
                  focusControl.requestFocus('WebAttributeTestButton')
                  await Utils.sleep(1000)
                  this.controller.requestFocus()
                  await Utils.sleep(1000)
                  Utils.emitEvent(this.onRequestSelectedCalled, 70015)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnConsole001": {
                try {
                  this.testConsole = true
                  this.controller.loadUrl("resource://rawfile/index.html");
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("consoleTest()")
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitConsoleMessage001": {
                try {
                  this.testConsole = true
                  this.controller.loadUrl("resource://rawfile/index.html");
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("consoleTest()")
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnAlert001": {
                try {
                  this.controller.loadUrl("resource://rawfile/alert.html");
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("alertTest()")
                  await Utils.sleep(2000)
                  Utils.emitEvent(this.alert, 70017)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnConfirm001": {
                try {
                  this.controller.loadUrl("resource://rawfile/confirm.html");
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("confirmTest()")
                  await Utils.sleep(2000)
                  Utils.emitEvent(this.confirm, 70018)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnPrompt001": {
                try {
                  this.controller.loadUrl("resource://rawfile/prompt.html");
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("promptTest()")
                  await Utils.sleep(2000)
                  Utils.emitEvent(this.prompt, 70019)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitJsResultHandleCancel001": {
                try {
                  this.handleCancel = true
                  this.controller.loadUrl("resource://rawfile/confirm.html");
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("confirmTest()", (error, result) => {
                    if (error) {
                      console.info('confirmTest() return error: ' + error)
                    }
                    if (result) {
                      console.info('confirmTest() return result: ' + result)
                      Utils.emitEvent(result, 70021)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitJsResultHandleConfirm001": {
                try {
                  this.handleCancel = false
                  this.controller.loadUrl("resource://rawfile/confirm.html");
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("confirmTest()", (error, result) => {
                    if (error) {
                      console.info('confirmTest() return error: ' + error)
                    }
                    if (result) {
                      console.info('confirmTest() return result: ' + result)
                      Utils.emitEvent(result, 70023)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitJsResultHandlePromptConfirm001": {
                try {
                  this.controller.loadUrl("resource://rawfile/prompt.html");
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("promptTest()", (error, result) => {
                    if (error) {
                      console.info('promptTest() return error: ' + error)
                    }
                    if (result) {
                      console.info('promptTest() return result: ' + result)
                      Utils.emitEvent(result, 70025)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnErrorReceive001": {
                try {
                  this.controller.loadUrl('http://testonerrorexample.com/')
                  await Utils.sleep(2000)
                  Utils.emitEvent(this.errorReceive, 60065)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnErrorReceive002": {
                try {
                  this.controller.removeCache(true)
                  this.blockNetwork = true
                  await Utils.sleep(1000)
                  this.controller.loadUrl('https://openharmony.cn/')
                  await Utils.sleep(2000)
                  this.blockNetwork = false
                  await Utils.sleep(1000)
                  Utils.emitEvent(this.errorReceive, 60066)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnHttpErrorReceive": {
                try {
                  this.isHttpErrorReceive = true
                  await Utils.sleep(1000)
                  this.controller.loadUrl('http://1.1.1.123/index.html')
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnDownloadStart": {
                try {
                  this.isDownloadStart = true
                  await Utils.sleep(1000)
                  this.controller.loadUrl('https://consumer.huawei.com/content/dam/' +
                  'huawei-cbg-site/cn/mkt/mobileservices/2022/download/' +
                  'PC107f1b3947c942ffaa14334a879065d8.2107261020.exe')
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnRefreshAccessedHistory001": {
                try {
                  this.controller.loadUrl('resource://rawfile/second.html');
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.newUrl, 60116)
                  Utils.emitEvent(this.isRefreshed, 60117)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnRefreshAccessedHistory002": {
                try {
                  this.controller.loadUrl('resource://rawfile/second.html');
                  await Utils.sleep(2000)
                  this.controller.refresh();
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.newUrl, 60118)
                  Utils.emitEvent(this.isRefreshed, 60119)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnUrlLoadIntercept": {
                try {
                  this.controller.loadUrl('https://gitee.com/')
                  await Utils.sleep(3000)
                  Utils.emitEvent(this.loadedUrl, 60104)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnRenderExited": {
                try {
                  await Utils.sleep(2000)
                  this.controller.loadUrl('chrome://crash/')
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitHeader001": {
                try {
                  this.controller.loadUrl('http://testonerrorexample.com/', [{
                    headerKey: "customHeaderKey",
                    headerValue: "customHeaderValue"
                  }])
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnSearchResultReceive001": {
                try {
                  this.controller.loadUrl('resource://rawfile/search.html');
                  await Utils.sleep(2000)
                  this.controller.searchAllAsync('search');
                  await Utils.sleep(1000)
                  console.error(`searchResultCount is: ${this.searchResultCount}`);
                  Utils.emitEvent(this.searchResultCount, 60414)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnSearchResultReceive002": {
                try {
                  this.controller.loadUrl('resource://rawfile/search.html');
                  await Utils.sleep(2000)
                  this.controller.searchAllAsync('searchNone');
                  await Utils.sleep(1000)
                  Utils.emitEvent(this.searchResultCount, 60416)
                  console.error(`searchResultCount is: ${this.searchResultCount}`);

                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitBlockNetWork001": {
                try {
                  this.blockNetwork = true
                  await Utils.sleep(1000)
                  this.controller.loadUrl('https://openharmony.cn/')
                  await Utils.sleep(2000)
                  this.blockNetwork = false
                  await Utils.sleep(1000)
                  Utils.emitEvent(this.errorReceive, 60418)
                  break;
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitBlockNetWork002": {
                try {
                  this.blockNetwork = false;
                  await Utils.sleep(1000)
                  this.controller.loadUrl('https://openharmony.cn/');
                  await Utils.sleep(4000)
                  let testTitle = this.controller.getTitle();
                  console.log(`testTitle is: ${testTitle}`);
                  Utils.emitEvent(testTitle, 60420)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitBlockNetWork003": {
                try {
                  this.blockNetwork = true
                  await Utils.sleep(1000)
                  this.controller.loadUrl($rawfile('second.html'))
                  await Utils.sleep(2000)
                  this.blockNetwork = false
                  await Utils.sleep(1000)
                  Utils.emitEvent(this.errorReceive, 60800)
                  break;
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitBlockNetWork004": {
                try {
                  this.blockNetwork = true
                  await Utils.sleep(1000)
                  this.controller.loadUrl('resource://rawfile/index.html')
                  await Utils.sleep(2000)
                  this.blockNetwork = false
                  await Utils.sleep(1000)
                  Utils.emitEvent(this.errorReceive, 60802)
                  break;
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitBlockNetWork005": {
                try {
                  let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                  this.blockNetwork = true
                  await Utils.sleep(1000)
                  this.controller.loadUrl(`file://${sandboxPath}`)
                  await Utils.sleep(2000)
                  this.blockNetwork = false
                  await Utils.sleep(1000)
                  Utils.emitEvent(this.errorReceive, 60805)
                  break;
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnFaviconReceived": {
                try {
                  this.controller.loadUrl('resource://rawfile/icon.html');
                  await Utils.sleep(1000)
                  Utils.emitEvent(this.onFaviconReceivedCalled, 60421)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnInterceptKeyEvent": {
                try {
                  this.controller.loadUrl('resource://rawfile/keyEvent.html');
                  await Utils.sleep(1000)
                  await Utils.triggerKey(2017)
                  await Utils.sleep(1000)
                  Utils.emitEvent(this.onInterceptKeyEventCode, 60422)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetCertificate001": {
                try {
                  this.controller.loadUrl('https://expired.badssl.com')
                  await Utils.sleep(6000)
                  this.controller.getCertificate().then(x509CertArray => {
                    this.outputStr = ParseX509CertInfo(x509CertArray);
                    console.log("getCertificate result of this page: " + this.outputStr);
                    Utils.emitEvent(this.outputStr, 60423)
                  })
                } catch (error) {
                  this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                }
                break;
              }
              case "emitGetCertificate002": {
                try {
                  this.controller.loadUrl('https://expired.badssl.com')
                  await Utils.sleep(6000)
                  this.controller.getCertificate((error, x509CertArray) => {
                    if (error) {
                      this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                    } else {
                      this.outputStr = ParseX509CertInfo(x509CertArray);
                      console.log("getCertificate result of this page: " + this.outputStr);
                      Utils.emitEvent(this.outputStr, 60424)
                    }
                  })
                } catch (error) {
                  this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .key('webView')
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .initialScale(this.initialScale)
          .geolocationAccess(this.geolocationAccess)
          .databaseAccess(true)
          .blockNetwork(this.blockNetwork)
          .userAgent('Mozilla/5.0 (Windows NT 10.0; WOW64)')
          .onRenderExited((event) => {
            if (event) {
              console.info("onRenderExited==>" + event.renderExitReason)
              Utils.emitEvent(event.renderExitReason, 60106)
            }
          })
          .onUrlLoadIntercept((event) => {
            if (event) {
              console.info("onUrlLoadIntercept==>" + event.data)
              this.loadedUrl = String(event.data)
            }
            return false
          })
          .onRefreshAccessedHistory((event) => {
            console.info("onRefreshAccessedHistory==>")
            if (event) {
              this.newUrl = event.url
              this.isRefreshed = event.isRefreshed
            }
          })
          .onScaleChange((event) => {
            console.log('onScaleChange called oldScale :' + event.oldScale)
            console.log('onScaleChange called newScale :' + event.newScale)
            this.oldScale = event.oldScale
            this.newScale = event.newScale
          })
          .onErrorReceive((event) => {
            console.log("onErrorReceive==>")
            if (event) {
              this.errorReceive = event.request.getRequestUrl()
              console.log('getErrorInfo:' + event.error.getErrorInfo())
              console.log('getErrorCode:' + event.error.getErrorCode())
              console.log('url:' + event.request.getRequestUrl())
              console.log('isMainFrame:' + event.request.isMainFrame())
              console.log('isRedirect:' + event.request.isRedirect())
              console.log('isRequestGesture:' + event.request.isRequestGesture())
              console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString())
              let result = event.request.getRequestHeader()
              console.log('The request header result size is ' + result.length)
              for (let i of result) {
                console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue)
                if (i.headerKey == 'customHeaderKey' && i.headerValue == 'customHeaderValue') {
                  Utils.emitEvent(true, 412);
                }
              }
            }
          })
          .onDownloadStart((event) => {
            console.info("onDownloadStart==>")
            if (event) {
              if (this.isDownloadStart) {
                console.info("isDownloadStart==>")
                Utils.emitEvent(event.url, 60068)
                this.isDownloadStart = false
              }
            }
          })
          .onHttpErrorReceive((event) => {
            console.info("isHttpErrorReceive==>")
            if (event) {
              this.httpErrorReceive = event.response.getResponseCode()
              if (this.isHttpErrorReceive) {
                if (this.httpErrorReceive > 400) {
                  this.isLargeThan = true
                  Utils.emitEvent(this.isLargeThan, 60067)
                }
                this.isLargeThan = false
                this.isHttpErrorReceive = false
              }
            }
          })
          .onGeolocationShow((event) => {
            console.log("onGeolocationShow==>")
            if (this.geoShow) {
              Utils.emitEvent("onGeolocationShow", 70011)
              this.geoShow = false
            }
            if (event) {
              console.log("onGeolocationShow : " + event.origin);
              event.geolocation.invoke(event.origin, false, false)
            }
          })
          .onPageBegin((event) => {
            if (event) {
              this.pageBegin = event.url
              console.log("onPageBegin==> event.url:" + event.url)
            }
          })
          .onProgressChange((event) => {
            if (event) {
              this.progress = event.newProgress + ""
            }
          })
          .onPageEnd((event) => {
            if (event) {
              this.pageEnd = event.url
              console.log("onPageEnd==> event.url:" + event.url)
              console.log("onPageEnd==> this.pageEnd:" + this.pageEnd)
            }
          })
          .onRequestSelected(() => {
            console.log("onRequestSelected==>")
            this.onRequestSelectedCalled = true
          })
          .onFocus(() => {
            console.log("WebOnFocus==>")
          })
          .onAlert((event) => {
            if (event) {
              console.log("event.url:" + event.url)
              console.log("event.message:" + event.message)
              this.alert = event.message
            }
            return false
          })
          .onConfirm((event) => {
            if (event) {
              console.log("event.url:" + event.url)
              console.log("event.message:" + event.message)
              this.confirm = event.message;
              if (this.handleCancel) {
                event.result.handleCancel()
              } else {
                event.result.handleConfirm()
              }
            }
            return true
          })
          .onPrompt((event) => {
            if (event) {
              console.log("event.url:" + event.url)
              console.log("event.message:" + event.message)
              console.log("event.value:" + event.value)
              this.prompt = event.message;
              event.result.handlePromptConfirm('handlePromptConfirm')
            }
            return true
          })
          .onSearchResultReceive(ret => {
            if (ret) {
              console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
              "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
              this.searchResultCount = ret.numberOfMatches
            }
          })
          .onInterceptKeyEvent((event) => {
            console.log("onInterceptKeyEvent==>")
            if (event) {
              this.onInterceptKeyEventCode = event.keyCode
            }
            return false;
          })
          .onTouchIconUrlReceived((event) => {
            if (event) {
              console.log('onTouchIconUrlReceived:' + JSON.stringify(event))
            }
          })
          .onFaviconReceived((event) => {
            this.onFaviconReceivedCalled = true
            if (event) {
              console.log('onFaviconReceived' + JSON.stringify(event));
            }
          })
          .onTitleReceive((event) => {
            if (event) {
              console.log('onTitleReceive title:' + event.title)
              this.title = event.title
            }
          })
          .onConsole((event) => {
            if (event) {
              if (this.testConsole) {
                Utils.emitEvent(event.message.getMessage(), 70040)
                Utils.emitEvent(event.message.getLineNumber(), 70042)
                Utils.emitEvent(event.message.getSourceId(), 70044)
                Utils.emitEvent(event.message.getMessageLevel(), 70046)
                this.testConsole = false
              }
            }
            return false
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}