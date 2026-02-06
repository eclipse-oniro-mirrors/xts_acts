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
import business_error from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces';
import image from '@ohos.multimedia.image';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { URL } from '../../test/Config.test';

@Entry
@Component
struct webClearAllCookiesCharacter {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 133350,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(133350)
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
        Button('clearAllCookies click').key('webClearAllCookiesCharacterButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitClearAllCookiesCharacterCallback': {
              try {
                webView.WebCookieManager.clearAllCookies((error) => {
                  if (error) {
                    console.log(this.str + 'clearAllCookies error: ' + JSON.stringify(error));
                  }
                })
                webView.WebCookieManager.configCookie(URL, 'a=b\nc', (error) => {
                  if (error) {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('success',133360);
                    }
                  } else {
                    console.log('configCookie success!');
                    let value1 = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie value1= ' + value1);
                    webView.WebCookieManager.clearAllCookies((error) => {
                      if (error) {
                        console.log(this.str + 'clearAllCookies error: ' + JSON.stringify(error));
                      }
                    })
                    let value2 = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie value2= ' + value2);
                    if (value1 == 'a=b' && !value2) {
                      Utils.emitEvent('success',133360);
                    } else {
                      Utils.emitEvent('fail',133360);
                    }

                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('success',133360);
                }
              }
              break;
            }
            case 'emitClearAllCookiesCharacterPromise': {
              try {
                webView.WebCookieManager.clearAllCookies()
                  .then(() => {
                    console.log('clearAllCookies success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error(this.str + 'error: ' + JSON.stringify(error));
                  });
                webView.WebCookieManager.configCookie(URL, 'a=b\nc')
                  .then(() => {
                    console.log('configCookie success!');
                    let value1 = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie value1= ' + value1);
                    webView.WebCookieManager.clearAllCookies()
                      .then(() => {
                        console.log('clearAllCookies success!');
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.error(this.str + 'error: ' + JSON.stringify(error));
                      });
                    let value2 = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie value2= ' + value2);
                    if (value1 == 'a=b' && !value2) {
                      Utils.emitEvent('success',133370);
                    }
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('success',133370);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('success',133370);
                }
              }
              break;
            }


          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}
