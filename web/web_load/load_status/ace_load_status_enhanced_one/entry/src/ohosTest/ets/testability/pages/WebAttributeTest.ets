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
import { waitForExist } from '../../test/WaitTest.test';

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
  @State isReceive: number = -1;
  @State isEnd:number = -1;
  @State isPageEnd:number = -1;
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 141401,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(141401)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
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
            await waitForExist(()=>this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info("key==>" + this.str)
            switch (this.str) {
              case "emitOnPageEnd001": {
                try {
                  this.pageEnd = ''
                  this.controller.clearHistory()
                  this.isPageEnd = -1
                  this.controller.loadUrl("resource://rawfile/second.html")
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  Utils.emitEvent(this.pageEnd, 141410)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnPageEnd002": {
                try {
                  this.pageEnd = ''
                  this.controller.clearHistory()
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/iframe.html")
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.isEnd = -1;
                  this.controller.runJavaScript("createIframe()", (error, result) => {
                    if (error) {
                      console.info('createIframe() return error: ' + error)
                    }
                    if (result) {
                      console.info('createIframe() return result: ' + result)
                      this.isEnd = 0;
                    }
                  })
                  await waitForExist(()=>this.isEnd, this.str, 0);
                  Utils.emitEvent(this.pageEnd, 141420)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnPageBegin001": {
                try {
                  this.pageBegin = ''
                  this.isPageEnd = -1
                  this.controller.loadUrl("resource://rawfile/second.html")
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  Utils.emitEvent(this.pageBegin, 141430)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnPageBegin002": {
                try {
                  this.pageBegin = ''
                  this.isPageEnd = -1
                  this.controller.loadUrl("resource://rawfile/iframe.html")
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                 this.isEnd = -1;
                  this.controller.runJavaScript("createIframe()", (error, result) => {
                    if (error) {
                      console.info('createIframe() return error: ' + error)
                    }
                    if (result) {
                      console.info('createIframe() return result: ' + result)
                      this.isEnd = 0
                    }
                  })
                  await waitForExist(()=>this.isEnd, this.str, 0);
                  Utils.emitEvent(this.pageBegin, 141440)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnProgressChange001": {
                try {
                  this.progress = ''
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/second.html")
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  Utils.emitEvent(this.progress, 141450)
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
          .onUrlLoadIntercept((event) => {
            if (event) {
              console.info("onUrlLoadIntercept==>" + event.data)
              this.loadedUrl = String(event.data)
            }
            return false
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
            this.isPageEnd = 0;
            if (event) {
              this.pageEnd = event.url
              console.log("onPageEnd==> event.url:" + event.url)
              console.log("onPageEnd==> this.pageEnd:" + this.pageEnd)
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}