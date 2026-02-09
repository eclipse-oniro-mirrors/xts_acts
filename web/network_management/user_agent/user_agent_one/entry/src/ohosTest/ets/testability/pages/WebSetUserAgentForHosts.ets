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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { URL, URL2 } from '../../test/Config.test';

@Entry
@Component
struct webSetUserAgentForHosts {
  controller: webView.WebviewController = new webView.WebviewController();
  responseWeb: WebResourceResponse = new WebResourceResponse();
  @State emitKey: string = '';
  @State message: Array<string> = [];
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State webData: string = `
    <!DOCTYPE html>
    <html>
    <meta charset="utf-8">
    <body>
    <button type="button" onclick="getUserAgent()">onInterceptRequest</button>
    </body>
    <script type="text/javascript">
        function getUserAgent() {
            console.log('getUserAgent:' + navigator.userAgent);
            return navigator.userAgent;
        }
    </script>
    </html>
  `;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 174050,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(174050)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('setUserAgentForHosts click')
          .key('WebSetUserAgentForHostsButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitSetUserAgentForHostsOverRange': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  console.log('userAgent===>' + userAgent);
                  let customUserAgent = userAgent + ' setUserAgentForHosts';
                  webView.WebviewController.setUserAgentForHosts(customUserAgent, ['test123.test.com']);
                  this.isPageEnd = -1;
                  this.controller.loadUrl(URL);
                  await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                  this.controller.runJavaScript('getUserAgent()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                      let isGetResult = result.includes('setUserAgentForHosts');
                      Utils.emitEvent(isGetResult, 174060)
                    }
                  })
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent(true, 174060)
                  }
                }
                break;
              }
              case 'emitSetUserAgentForHosts': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  console.log('userAgent===>' + userAgent);
                  let customUserAgent = userAgent + ' setUserAgentForHosts';
                  webView.WebviewController.setUserAgentForHosts(customUserAgent, [URL2]);
                  this.isPageEnd = -1;
                  this.controller.loadUrl(URL);
                  await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                  this.controller.runJavaScript('getUserAgent()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                      let isGetResult = result.includes('setUserAgentForHosts');
                      Utils.emitEvent(isGetResult, 174070)
                    }
                  })
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent(true, 174070)
                  }
                }
                break;
              }
              case 'emitSetUserAgentForHostsFirstParamNull': {
                try {
                  webView.WebviewController.setUserAgentForHosts(null, [URL2]);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent('401', 174080);
                  } else {
                    Utils.emitEvent(String(error.code), 174080);
                  }
                }
                break;
              }
              case 'emitSetUserAgentForHostsFirstParamUndefined': {
                try {
                  webView.WebviewController.setUserAgentForHosts(undefined, [URL2]);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent('401', 174090);
                  } else {
                    Utils.emitEvent(String(error.code), 174090);
                  }
                }
                break;
              }
              case 'emitSetUserAgentForHostsSecondParamNull': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  console.log('userAgent===>' + userAgent);
                  let customUserAgent = userAgent + ' setUserAgentForHosts';
                  webView.WebviewController.setUserAgentForHosts(customUserAgent, null);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent('401', 174100);
                  } else {
                    Utils.emitEvent(String(error.code), 174100);
                  }
                }
                break;
              }
              case 'emitSetUserAgentForHostsSecondParamUndefined': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  console.log('userAgent===>' + userAgent);
                  let customUserAgent = userAgent + ' setUserAgentForHosts';
                  webView.WebviewController.setUserAgentForHosts(customUserAgent, undefined);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent('401', 174110);
                  } else {
                    Utils.emitEvent(String(error.code), 174110);
                  }
                }
                break;
              }
            }
         })
      }
      Web({ src: $rawfile('userAgent.html'), controller: this.controller })
        .key('setUserAgentForHostsWComponent')
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onPageEnd((event) => {
          if (event) {
            console.log('setUserAgentForHosts onPageEnd url:' + event.url);
            this.isPageEnd = 0;
           }
        })
        .onInterceptRequest((event) => {
          if (event) {
            console.log('url:' + event.request.getRequestUrl());
            if (!event.request.getRequestUrl().includes(URL2)) {
              return null
            }
            if (event.request.getRequestUrl().includes(URL2)) {
              this.responseWeb.setResponseData(this.webData);
            }
          }

          this.responseWeb.setResponseEncoding('utf-8');
          this.responseWeb.setResponseMimeType('text/html');
          this.responseWeb.setResponseCode(200);
          this.responseWeb.setReasonMessage('OK');
          return this.responseWeb;
        })
        .width('100%')
        .height('100%')
    }
  }
}
