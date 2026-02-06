/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { waitForExist, waitForAssert } from '../../test/WaitTest.test';
import business_error from '@ohos.base'

@Entry
@Component
struct webviewCustomizeSchemesTrueTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State interceptUrl: string = '';
  @State consoleMsg: Array<string> = [];
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
  schemeError: webView.WebCustomScheme = {
    schemeName: 'name1',
    isSupportCORS: true,
    isSupportFetch: true,
    isStandard: false,
    isLocal: false,
    isDisplayIsolated: false,
    isSecure: false,
    isCspBypassing: false,
    isCodeCacheSupported: false,
  }
  heads: Header[] = [];
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

  aboutToAppear() {
    try {
      console.log('customizeSchemes lazyInitWebEngine true start');
      webView.WebviewController.customizeSchemes(this.schemeList, true);
      console.log('customizeSchemes lazyInitWebEngine true end');
    } catch (error) {
      let e: business_error.BusinessError = error as business_error.BusinessError;
      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
    }
  }
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 123,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(123)
  }



  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('customizeSchemes click').key('CustomizeSchemesTrueButton').onClick(async () => {
          await waitForExist(() => this.isReceive, this.str, 0, 1000);
          await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
          this.isReceive = -1;
          this.interceptUrl = '';
          this.consoleMsg = [];
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitCustomizeSchemesLazyInitWebEngineTrue01': {
              try {
                this.controller.runJavaScript('fetchUrl("jump1")');
                let check = (v1: string, v2: boolean): boolean => {
                  return this.interceptUrl.includes('jump1');
                }
                await waitForAssert(()=>this.interceptUrl, check, true, 2025102801, this.str, 1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitCustomizeSchemesLazyInitWebEngineTrue02': {
              try {
                this.controller.runJavaScript('fetchUrl("jump5")');
                let check = (v1: Array<string>, v2: boolean): boolean => {
                  return this.consoleMsg.join(',').includes('URL scheme "jump5" is not supported');
                }
                await waitForAssert(()=>this.consoleMsg, check, true, 2025102802, this.str, 1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitCustomizeSchemesLazyInitWebEngineTrue03': {
              try {
                this.controller.runJavaScript('fetchUrl("jump3")');
                let check = (v1: Array<string>, v2: boolean): boolean => {
                  return this.consoleMsg.join(',').includes('has been blocked by CORS policy');
                }
                await waitForAssert(()=>this.consoleMsg, check, true, 2025102803, this.str, 1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitCustomizeSchemesLazyInitWebEngineTrue04': {
              try {
                this.controller.runJavaScript('fetchUrl("jump4")');
                let check = (v1: Array<string>, v2: boolean): boolean => {
                  return this.consoleMsg.join(',').includes('URL scheme "jump4" is not supported');
                }
                await waitForAssert(()=>this.consoleMsg, check, true, 2025102804, this.str, 1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitCustomizeSchemesLazyInitWebEngineError01': {
              try {
                webView.WebviewController.customizeSchemes(this.invalidSchemeList, true);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(Number(error.code), 2025102805);
              }
              break;
            }
            case 'emitCustomizeSchemesLazyInitWebEngineError02': {
              try {
                webView.WebviewController.customizeSchemes(this.outOfRangeSchemeList, true);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(Number(error.code), 2025102806);
              }
              break;
            }
            case 'emitCustomizeSchemesLazyInitWebEngineError03': {
              try {
                webView.WebviewController.customizeSchemes([this.schemeError], true);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(Number(error.code), 2025102807);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url==>' + event.url);
          this.isPageEnd = 0;
        })
        .onInterceptRequest((event) => {
          if (event) {
            this.interceptUrl = event.request.getRequestUrl();
            console.log('onInterceptRequest url:' + this.interceptUrl);
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
            console.log('onConsole getMessage:' + event.message?.getMessage());
            this.consoleMsg.push(event.message?.getMessage());
          }
          return false
        })
    }
  }
}
