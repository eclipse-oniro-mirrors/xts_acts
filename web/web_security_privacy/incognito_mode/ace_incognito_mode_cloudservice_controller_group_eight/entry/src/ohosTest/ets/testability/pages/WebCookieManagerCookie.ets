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

import Utils from '../../test/Util';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest';
import { URL } from '../../test/Config';

@Entry
@Component
struct WebCookieManagerCookie {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 251121,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(251121)
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
        Button('WebCookieManagerCookieTest')
          .key('WebCookieManagerCookieTest')
          .onClick(async () => {
            await waitForExist(() => this.isReceive, 'WebCookieManagerCookieTest_isReceive', 0);
            await waitForExist(() => this.isPageEnd, 'WebCookieManagerCookieTest_isPageEnd', 0);
            this.isReceive = -1;
            console.info('key==>' + this.emitKey)
            switch (this.emitKey) {
              case 'testIncognitoExistCookieSetUndefined': {
                try {
                   webView.WebCookieManager.clearAllCookiesSync(true)
                   webView.WebCookieManager.configCookieSync(URL, 'ccs=bbc', true)
                   let getCookie = webView.WebCookieManager.fetchCookieSync(URL, true)
                   console.log('testIncognitoExistCookieSetUndefined fetchCookieSync:' + getCookie)
                   let result = webView.WebCookieManager.existCookie(undefined)
                   console.log('testIncognitoExistCookieSetUndefined existCookie set undefined:' + result)
                   webView.WebCookieManager.clearAllCookiesSync(true)
                   if (result === undefined) {
                      console.log('result is undefined')
                      Utils.emitEvent(String(result), 25112401)
                   } else {
                      Utils.emitEvent(result, 25112401)
                   }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code,25112401);
                }
                break;
              }
              case 'testIncognitoExistCookieSetNull': {
                try {
                   webView.WebCookieManager.clearAllCookiesSync(true)
                   webView.WebCookieManager.configCookieSync(URL, 'ccs=bbc', true)
                   let getCookie = webView.WebCookieManager.fetchCookieSync(URL, true)
                   console.log('testIncognitoExistCookieSetNull fetchCookieSync:' + getCookie)
                   let result = webView.WebCookieManager.existCookie(null)
                   console.log('testIncognitoExistCookieSetNull existCookie set null:' + result)
                   webView.WebCookieManager.clearAllCookiesSync(true)
                   if (result === undefined) {
                      console.log('result is undefined')
                      Utils.emitEvent(String(result), 25112402)
                   } else {
                      Utils.emitEvent(result, 25112402)
                   }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code,25112402);
                }
                break;
              }
              case 'testIncognitoClearAllCookiesSyncSetUndefined': {
                try {
                   webView.WebCookieManager.clearAllCookiesSync(true)
                   webView.WebCookieManager.configCookieSync(URL, 'ccs=bbc', true)
                   let getCookie = webView.WebCookieManager.fetchCookieSync(URL, true)
                   console.log('testIncognitoClearAllCookiesSyncSetUndefined fetchCookieSync:' + getCookie)
                   webView.WebCookieManager.clearAllCookiesSync(undefined)
                   let getCookie2 = webView.WebCookieManager.fetchCookieSync(URL, true)
                   console.log('testIncognitoClearAllCookiesSyncSetUndefined fetchCookieSync2:' + getCookie2)
                   webView.WebCookieManager.clearAllCookiesSync(true)
                   Utils.emitEvent(getCookie2, 25112403)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 25112403);
                }
                break;
              }
              case 'testIncognitoClearAllCookiesSyncSetNull': {
                try {
                   webView.WebCookieManager.clearAllCookiesSync(true)
                   webView.WebCookieManager.configCookieSync(URL, 'ccs=bbc', true)
                   let getCookie = webView.WebCookieManager.fetchCookieSync(URL, true)
                   console.log('testIncognitoClearAllCookiesSyncSetNull fetchCookieSync:' + getCookie)
                   webView.WebCookieManager.clearAllCookiesSync(null)
                   let getCookie2 = webView.WebCookieManager.fetchCookieSync(URL, true)
                   console.log('testIncognitoClearAllCookiesSyncSetNull fetchCookieSync2:' + getCookie2)
                   webView.WebCookieManager.clearAllCookiesSync(true)
                   Utils.emitEvent(getCookie2, 25112404)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 25112404);
                }
                break;
              }
            }
         })
      }
      Web({ src: URL, controller: this.controller })
        .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 0;
        })
        .width('100%')
        .height('100%')
    }
  }
}
