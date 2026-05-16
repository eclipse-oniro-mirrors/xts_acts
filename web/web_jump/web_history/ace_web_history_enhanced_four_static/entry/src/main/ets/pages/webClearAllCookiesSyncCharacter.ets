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

import { Button, ClickEvent, Column, Component, Entry, Row, Web, WebDarkMode, $rawfile } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webView from '@ohos.web.webview';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium/index';
import testsuite from '../../src/test/List.test';
import Utils from '../../src/test/Util.test';
import image from '@ohos.multimedia.image';
import emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct webClearAllCookiesSyncCharacter {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('clearAllCookiesSync click').key('webClearAllCookiesSyncCharacterButton').onClick((e:ClickEvent) => {
          this.isReceive = -1;
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitClearAllCookiesSyncCharacter': {
              try {
                webView.WebCookieManager.clearAllCookiesSync(false);
                webView.WebCookieManager.configCookieSync("https://www.baidu.com", 'a=b\nc');
                console.log('configCookie success!');
                let value1 = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                console.log(this.str + 'fetchCookieSync cookie value1= ' + value1);
                webView.WebCookieManager.clearAllCookiesSync(false);
                let value2 = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
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
                webView.WebCookieManager.configCookieSync("https://www.baidu.com", 'a=b\nc', true, false);
                console.log('configCookie success!');
                let value1 = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com", true);
                console.log(this.str + 'fetchCookieSync cookie value1= ' + value1);
                webView.WebCookieManager.clearAllCookiesSync(true);
                let value2 = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com", true);
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
            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webConfigCookieCharacter' })
              console.log('push URL success')
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
