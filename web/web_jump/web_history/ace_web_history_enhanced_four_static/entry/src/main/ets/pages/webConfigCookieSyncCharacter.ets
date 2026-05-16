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
struct webConfigCookieSyncCharacter {
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
        Button('ConfigCookieSync click').key('webConfigCookieSyncCharacterButton').onClick((e:ClickEvent) => {
          this.isReceive = -1;
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitConfigCookieSyncCharacter001': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync("", '');
                let value = webView.WebCookieManager.fetchCookieSync("");
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,133610);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133610);
                } else{
                  Utils.emitEvent(error.code,133610);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncCharacter002': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync("https://www.baidu.com", 'a=b\tc');
                let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('17100005',133620);
                } else {
                  Utils.emitEvent(error.code,133620);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncCharacter003': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync("https://www.baidu.com", 'a=b\rc');
                let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,133630);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133630);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncCharacter004': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync("https://www.baidu.com", 'a=b\0c');
                let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,133640);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133640);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncludeHttpOnlyCharacter001': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync("", '', false, true);
                let value = webView.WebCookieManager.fetchCookieSync("");
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,133650);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133650);
                } else{
                  Utils.emitEvent(error.code,133650);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncludeHttpOnlyCharacter002': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync("https://www.baidu.com", 'a=b,HttpOnly\tc', false, true)
                let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,133660);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('17100005',133660);
                } else{
                  Utils.emitEvent(error.code,133660);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncludeHttpOnlyCharacter003': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync("https://www.baidu.com", 'a=b,HttpOnly\rc', false, true)
                let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,133670);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133670);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncludeHttpOnlyCharacter004': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync("https://www.baidu.com", 'a=b,HttpOnly\0c', false, true)
                let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,133680);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133680);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncognitoCharacter001': {
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookieSync("https://www.baidu.com", 'a=b\nc', true, false)
                let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com", true);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,133690);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133690);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncognitoIncludeHttpOnlyCharacter001': {
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookieSync("https://www.baidu.com", 'a=b,HttpOnly\nc', true, true)
                let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com", true);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,133700);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133700);
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
