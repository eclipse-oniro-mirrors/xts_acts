/**
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
import business_error from '@ohos.base'
import { waitForExist, waitForAssert } from '../../test/WaitTest'
import { URL } from '../../test/Config'


@Entry
@Component
struct WebCookieManagerFetchCookieIncognito {
  controller: webView.WebviewController = new webView.WebviewController();
  @State console: string = ''
  @State str: string = ''
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 136700,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(136700)
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
        Button('WebCookieManagerFetchCookie click').key('WebCookieManagerFetchCookieTestButton')
          .onClick(async () => {
            await waitForExist(() => this.isComplete, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;

            console.info('key==>' + this.str)
            switch (this.str) {
              case 'testFetchCookieIncognito001': {
                let resultValue: string = '0'
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.configCookieSync(URL, 'a=b', false);
                  webView.WebCookieManager.fetchCookie(URL, false)
                    .then(cookie => {
                      console.log('testFetchCookieIncognito001 fetchCookie cookie : ' + cookie);
                      resultValue = cookie
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error(`testFetchCookieIncognito001 ErrorCode: ${error.code},  Message: ${error.message}`);
                      resultValue = String(error.code)
                    })
                } catch (error) {
                  console.error(`testFetchCookieIncognito001 ErrorCode: ${(error as business_error.BusinessError).code},  Message: ${(error as business_error.BusinessError).message}`);
                  resultValue = String(error.code)
                }

                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'a=b', 136710, this.str);
                break;
              }

              case 'testFetchCookieIncognito002': {
                let resultValue: string = '0'
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, 'aa=cc', true);
                  webView.WebCookieManager.fetchCookie(URL, true)
                    .then(cookie => {
                      console.log('testFetchCookieIncognito002 cookie : ' + cookie);
                      resultValue = cookie
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('testFetchCookieIncognito002 error: ' + JSON.stringify(error));
                      resultValue = String(error.code)
                    })
                } catch (error) {
                  console.error(`testFetchCookieIncognito002 ErrorCode: ${error.code},  Message: ${error.message}`);
                  resultValue = String(error.code)
                }

                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'aa=cc', 136720, this.str);
                break;
              }

              case 'testFetchCookieIncognitoErrorCode003': {
                let resultValue: number = 0
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, 'abc=edf', true);
                  webView.WebCookieManager.fetchCookie('', true)
                    .then(cookie => {
                      console.log('testFetchCookieIncognitoErrorCode003 cookie : ' + cookie);
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('testFetchCookieIncognitoErrorCode003 error: ' + JSON.stringify(error));
                      resultValue = error.code
                    })
                } catch (error) {
                  console.error(`testFetchCookieIncognitoErrorCode003 ErrorCode: ${error.code},  Message: ${error.message}`);
                  resultValue = error.code
                }

                let check = (v1: number, v2: number): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 17100002, 136730, this.str);
                break;
              }
            }
          },
          )
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onConsole((event) => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}
