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
struct webClearAllCookiesSyncCharacter {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 133400,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(133400)
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
        Button('clearAllCookiesSync click').key('webClearAllCookiesSyncCharacterButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitClearAllCookiesSyncCharacter': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync(URL, 'a=b\nc');
                console.log('configCookie success!');
                let value1 = webView.WebCookieManager.fetchCookieSync(URL);
                console.log(this.str + 'fetchCookieSync cookie value1= ' + value1);
                webView.WebCookieManager.clearAllCookiesSync();
                let value2 = webView.WebCookieManager.fetchCookieSync(URL);
                console.log(this.str + 'fetchCookieSync cookie value1= ' + value2);
                if (value1 == 'a=b' && !value2) {
                  Utils.emitEvent('success',133410);
                }
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('success',133410);
                }
              }
              break;
            }
            case 'emitClearAllCookiesSyncCharacterIncognito': {
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookieSync(URL, 'a=b\nc', true, false);
                console.log('configCookie success!');
                let value1 = webView.WebCookieManager.fetchCookieSync(URL, true);
                console.log(this.str + 'fetchCookieSync cookie value1= ' + value1);
                webView.WebCookieManager.clearAllCookiesSync(true);
                let value2 = webView.WebCookieManager.fetchCookieSync(URL, true);
                console.log(this.str + 'fetchCookieSync cookie value1= ' + value2);
                if (value1 == 'a=b' && !value2) {
                  Utils.emitEvent('success',133420);
                }
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('success',133420);
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
