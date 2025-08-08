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
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .key('webView')
          .height('50%')
          .fileAccess(true)
          .width('100%')
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .initialScale(this.initialScale)
          .geolocationAccess(this.geolocationAccess)
          .databaseAccess(true)
          .blockNetwork(this.blockNetwork)
          .userAgent('Mozilla/5.0 (Windows NT 10.0; WOW64)')
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
      }
      .width('100%')
    }

    .height('100%')
  }
}