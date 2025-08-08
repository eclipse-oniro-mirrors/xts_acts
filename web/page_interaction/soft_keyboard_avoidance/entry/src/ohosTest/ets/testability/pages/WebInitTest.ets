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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import business_error from '@ohos.base';
import window from '@ohos.window'

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State userAgentPC:string = "";
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State consoleMsg: string = ''
  @State screenHeight: number = 0;
  @State avoidAreaChangeStr: string = '';
  @State consoleCorsError: boolean = false
  schemeList: webView.WebCustomScheme[] = [
    { schemeName: "jump1", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "jump2", isSupportCORS: true, isSupportFetch: false },
    { schemeName: "jump3", isSupportCORS: false, isSupportFetch: true },
    { schemeName: "jump4", isSupportCORS: false, isSupportFetch: false }
  ]
  outOfRangeSchemeList: webView.WebCustomScheme[] = [
    { schemeName: "name1", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name2", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name3", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name4", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name5", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name6", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name7", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name8", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name9", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name10", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name11", isSupportCORS: true, isSupportFetch: true }
  ]
  invalidSchemeList: webView.WebCustomScheme[] = [{
    schemeName: "nameLength32nameLength32nameLength32nameLength32",
    isSupportCORS: true,
    isSupportFetch: true
  }]
  heads: Header[] = new Array()
  responseWeb: WebResourceResponse = new WebResourceResponse()
  webData: string = '<!DOCTYPE html>' +
    ' <html lang="en">' +
    ' <head>' +
    '     <meta charset="UTF-8">' +
    '     <meta http-equiv="X-UA-Compatible" content="IE=edge">' +
    '     <meta name="viewport" content="width=device-width, initial-scale=1.0">' +
    '     <title>schemeTest</title>' +
    ' </head>' +
    ' <body>' +
    '     <div id="container">schemeTest</div>' +
    ' </body>' +
    ' <script>' +
    '     function fetchUrl(scheme){' +
    '         fetch(scheme + "://www.openharmony.cn/");' +
    '     }' +
    '     function fetchUrlAllowCors(scheme){' +
    '         fetch(scheme + "://www.openharmony.cn/", {' +
    '           mode: "cors",' +
    '           headers: {' +
    '             "Access-Control-Allow-Origin":"*"' +
    '           }' +
    '         });' +
    '     }' +
    ' </script>' +
    ' </html>'

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
        this.interceptUrl = ''
        this.consoleMsg = ''
        this.consoleCorsError = false
      }
    }
  }

  aboutToAppear() {
    window.getLastWindow(getContext(this)).then(currentWindow =>{
      let property = currentWindow.getWindowProperties();
      let avoidArea = currentWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD);
      this.avoidAreaChangeStr = JSON.stringify(avoidArea);
      // 初始化显示区域高度
      this.screenHeight = px2vp(property.windowRect.height - avoidArea.bottomRect.height);
      // 监视软键盘的弹出和收起
      currentWindow.on('avoidAreaChange', async data => {
        if (data.type !== window.AvoidAreaType.TYPE_KEYBOARD) {
          return;
        }
        this.screenHeight = px2vp(property.windowRect.height - data.area.bottomRect.height);
      })
    })
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)

  }

  build() {
    Row() {
      Column() {
        Button('WebInitTestButton')
          .key('WebInitTestButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case 'emitWebViewAvoidArea05': {
                try {
                  this.userAgentPC = this.controller.getUserAgent();
                  if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                    Utils.emitEvent('success', 6205);
                    break;
                  }
                  this.controller.loadUrl($rawfile('expandAreaCover.html'));
                  if (this.avoidAreaChangeStr.length > 0) {
                    Utils.emitEvent('success', 6205);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onInterceptRequest((event) => {
            console.log('onInterceptRequest ==============> ')
            if (event) {
              this.interceptUrl = event.request.getRequestUrl()
              console.log('url:' + event.request.getRequestUrl())
            }

            let head1: Header = {
              headerKey: "Connection",
              headerValue: "keep-alive"
            }
            let head2: Header = {
              headerKey: "Cache-Control",
              headerValue: "no-cache"
            }
            this.heads.push(head1)
            this.heads.push(head2)
            this.responseWeb.setResponseHeader(this.heads)
            this.responseWeb.setResponseData(this.webData)
            this.responseWeb.setResponseEncoding('utf-8')
            this.responseWeb.setResponseMimeType('text/html')
            this.responseWeb.setResponseCode(200)
            this.responseWeb.setReasonMessage('OK')

            return this.responseWeb
          })
          .onConsole((event) => {
            if (event) {
              this.consoleMsg = event.message?.getMessage()
              if (!this.consoleCorsError && event.message?.getMessage().indexOf('blocked by CORS policy') >= 0) {
                this.consoleCorsError = true
              }
              console.log('onConsole getMessage:' + event.message?.getMessage())
              console.log('onConsole getSourceId:' + event.message?.getSourceId())
              console.log('onConsole getLineNumber:' + event.message?.getLineNumber())
              console.log('onConsole getMessageLevel:' + event.message?.getMessageLevel())
            }
            return false
          })
          .onErrorReceive((event) => {
            if (event) {
              console.log('onErrorReceive ==============> ')
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
              }
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}