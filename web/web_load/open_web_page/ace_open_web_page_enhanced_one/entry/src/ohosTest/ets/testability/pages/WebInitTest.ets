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

const EVENT_ID_SET_EMIT_KEY = 200730;

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ''
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string | null = null
  @State consoleMsg: string = ''
  @State consoleCorsError: boolean = false
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  schemeList: webView.WebCustomScheme[] = [
    { schemeName: 'jump1', isSupportCORS: true, isSupportFetch: true },
    { schemeName: 'jump2', isSupportCORS: true, isSupportFetch: false },
    { schemeName: 'jump3', isSupportCORS: false, isSupportFetch: true },
    { schemeName: 'jump4', isSupportCORS: false, isSupportFetch: false }
  ]
  outOfRangeSchemeList: webView.WebCustomScheme[] = [
    { schemeName: 'name1', isSupportCORS: true, isSupportFetch: true },
    { schemeName: 'name2', isSupportCORS: true, isSupportFetch: true },
    { schemeName: 'name3', isSupportCORS: true, isSupportFetch: true },
    { schemeName: 'name4', isSupportCORS: true, isSupportFetch: true },
    { schemeName: 'name5', isSupportCORS: true, isSupportFetch: true },
    { schemeName: 'name6', isSupportCORS: true, isSupportFetch: true },
    { schemeName: 'name7', isSupportCORS: true, isSupportFetch: true },
    { schemeName: 'name8', isSupportCORS: true, isSupportFetch: true },
    { schemeName: 'name9', isSupportCORS: true, isSupportFetch: true },
    { schemeName: 'name10', isSupportCORS: true, isSupportFetch: true },
    { schemeName: 'name11', isSupportCORS: true, isSupportFetch: true }
  ]
  invalidSchemeList: webView.WebCustomScheme[] = [{
    schemeName: 'nameLength32nameLength32nameLength32nameLength32',
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
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        try {
          this.controller.loadUrl('resource://rawfile/index.html');
          this.isReceive = 1;
        } catch (error) {
          console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
      }
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)

    try {
      webView.WebviewController.customizeSchemes(this.schemeList)
    } catch (error) {
      let e: business_error.BusinessError = error as business_error.BusinessError;
      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
    }

    try {
      webView.once('webInited', () => {
        console.error('webInited =====>')
        this.webInit = true
      })
      webView.once('webCreated', () => {
        console.error('webCreated =====>')
        this.webCreated = true
      })
    } catch (error) {
      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
    }
  }

  build() {
    Row() {
      Column() {
        Button('WebInitTestButton')
          .key('WebInitTestButton')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isReceive, 'WebInitTestButtonIsReceive', 1, 1000);
            await Utils.waitForExist(()=>this.isPageEnd, 'WebInitTestButtonIsPageEnd', 1, 1000);
            console.info('key==>' + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case 'testCustomizeSchemesFetch001': {
                this.interceptUrl = null;
                this.controller.runJavaScript('fetchUrl("jump789")');
                await Utils.waitForExist(()=>this.consoleMsg, 'waitConsoleMsg', 'Uncaught (in promise) TypeError: Failed to fetch', 1000);
                if (this.interceptUrl === null && this.consoleMsg.indexOf('Failed to fetch') >= 0) {
                  Utils.emitEvent(true, 200740);
                } else {
                  Utils.emitEvent(false, 200740);
                }
                break;
              }
              case 'testCustomizeSchemesFetch002': {
                this.interceptUrl = null;
                this.controller.runJavaScript('fetchUrl("jump1")');
                await Utils.waitForExist(()=>this.interceptUrl, 'waitInterceptUrl', null, 1000);
                if (this.interceptUrl!.indexOf('jump1') >= 0) {
                  Utils.emitEvent(true, 200750);
                } else {
                  Utils.emitEvent(false, 200750);
                }
                break;
              }
              case 'testCustomizeSchemesFetch003': {
                this.interceptUrl = null;
                this.consoleMsg = '';
                this.consoleCorsError = false;
                this.controller.runJavaScript('fetchUrl("jump3")');
                await Utils.waitForExist(()=>this.consoleMsg, 'waitConsoleMsg', 'Uncaught (in promise) TypeError: Failed to fetch', 1000);
                console.log('====interceptUrl=' + this.interceptUrl)
                console.log('====consoleMsg=' + this.consoleMsg)
                console.log('====consoleCorsError=' + this.consoleCorsError)

                if (this.interceptUrl === null &&
                  this.consoleCorsError &&
                  this.consoleMsg.indexOf('Failed to fetch') >= 0) {
                  Utils.emitEvent(true, 200760);
                } else {
                  Utils.emitEvent(false, 200760);
                }
                break;
              }
              case 'testCustomizeSchemesFetch004': {
                this.interceptUrl = null;
                this.consoleMsg = '';
                this.consoleCorsError = false;
                this.controller.runJavaScript('fetchUrlAllowCors("jump3")');
                await Utils.waitForExist(()=>this.consoleMsg, 'waitConsoleMsg', 'Uncaught (in promise) TypeError: Failed to fetch', 1000);
                if (this.interceptUrl === null &&
                  this.consoleCorsError &&
                  this.consoleMsg.indexOf('Failed to fetch') >= 0) {
                  Utils.emitEvent(true, 200770);
                } else {
                  Utils.emitEvent(false, 200770);
                }
                break;
              }
              case 'testCustomizeSchemesFetch005': {
                this.interceptUrl = null;
                this.consoleMsg = '';
                this.controller.runJavaScript('fetchUrlAllowCors("jump2")');
                await Utils.waitForExist(()=>this.consoleMsg, 'waitConsoleMsg', 'Uncaught (in promise) TypeError: Failed to fetch', 1000);
                if (this.interceptUrl === null &&
                  this.consoleMsg.indexOf('Failed to fetch') >= 0) {
                  Utils.emitEvent(true, 200780);
                } else {
                  Utils.emitEvent(false, 200780);
                }
                break;
              }
              case 'testCustomizeSchemesFetch006': {
                this.interceptUrl = null;
                this.consoleMsg = '';
                this.controller.runJavaScript('fetchUrlAllowCors("jump4")');
                await Utils.waitForExist(()=>this.consoleMsg, 'waitConsoleMsg', 'Uncaught (in promise) TypeError: Failed to fetch', 1000);
                if (this.interceptUrl === null &&
                  this.consoleMsg.indexOf('Failed to fetch') >= 0) {
                  Utils.emitEvent(true, 200790);
                } else {
                  Utils.emitEvent(false, 200790);
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
              this.interceptUrl = event.request.getRequestUrl();
              console.log('url:' + this.interceptUrl)
            }

            let head1: Header = {
              headerKey: 'Connection',
              headerValue: 'keep-alive'
            }
            let head2: Header = {
              headerKey: 'Cache-Control',
              headerValue: 'no-cache'
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
              this.consoleMsg = event.message?.getMessage();
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
          .onPageBegin((event) => {
            console.log('onPageBegin ==>' + event.url);
          })
          .onPageEnd((event) => {
            console.log('onPageEnd ==>' + event.url);
            this.isPageEnd = 1
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}