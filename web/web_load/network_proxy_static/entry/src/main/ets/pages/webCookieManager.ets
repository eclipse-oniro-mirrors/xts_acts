/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import Utils from '../../src/test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement'
import { Button, ClickEvent, Column, Component, Entry, Row, Web } from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webCookieManager {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  stringObj: StringFields  = new StringFields ();
  @State javaScriptAccess: boolean = true;

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
        this.stringObj.str = strValue;
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebCookieManager click').key('WebCookieManagerButton').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {
            case 'testSaveCookieSync001': {
              try {
                webView.WebCookieManager.saveCookieSync();
                Utils.emitEvent('success', 202502180);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent('fail', 202502180);
              }
              break;
            }
            case 'testRemoveAllCache001': {
              try {
                webView.WebviewController.removeAllCache(true);
                Utils.emitEvent('success', 202502211);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent('fail', 202502211);
              }
              break;
            }
            case 'testRemoveAllCache002': {
              try {
                webView.WebviewController.removeAllCache(false);
                Utils.emitEvent('success', 202502212);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent('fail', 202502212);
              }
              break;
            }

            case 'WebHttpCookieSameSitePolicy_NONE': {
              try {
                Utils.emitEvent(webView.WebHttpCookieSameSitePolicy.NONE, 202502213)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'WebHttpCookieSameSitePolicy_LAX': {
              try {
                Utils.emitEvent(webView.WebHttpCookieSameSitePolicy.LAX, 202502214)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'WebHttpCookieSameSitePolicy_STRICT': {
              try {
                Utils.emitEvent(webView.WebHttpCookieSameSitePolicy.STRICT, 202502215)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'WebHttpCookieSameSitePolicy_samesitePolicy': {
              try {
                webView.WebCookieManager.configCookieSync("https://" + "www.example.com", "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT");
                webView.WebCookieManager.fetchAllCookies(false)
                  .then(cookies => {
                    console.log("cookies"+cookies[0].expiresDate);
                    if (cookies && cookies.length > 0 && cookies[0].expiresDate != undefined) {
                       Utils.emitEvent(true, 202502216)

                    }
                  })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'WebHttpCookieSameSitePolicy_name': {
              try {
                webView.WebCookieManager.configCookieSync("https://" + "www.example.com", "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT");
                webView.WebCookieManager.fetchAllCookies(false)
                  .then(cookies => {
                    console.log("cookies"+cookies[0].name);
                    if (cookies && cookies.length > 0 && cookies[0].name != undefined) {
                      Utils.emitEvent(true, 202502217)

                    }
                  })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'WebHttpCookieSameSitePolicy_isSessionCookie': {
              try {
                webView.WebCookieManager.configCookieSync("https://" + "www.example.com", "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT");
                webView.WebCookieManager.fetchAllCookies(false)
                  .then(cookies => {
                    console.log("cookies"+cookies[0].isSessionCookie);
                    if (cookies && cookies.length > 0 && cookies[0].isSessionCookie != undefined) {
                      Utils.emitEvent(true, 202502218)

                    }
                  })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'WebHttpCookieSameSitePolicy_value': {
              try {
                webView.WebCookieManager.configCookieSync("https://" + "www.example.com", "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT");
                webView.WebCookieManager.fetchAllCookies(false)
                  .then(cookies => {
                    console.log("cookies"+cookies[0].value);
                    if (cookies && cookies.length > 0 && cookies[0].value != undefined) {
                      Utils.emitEvent(true, 202502219)

                    }
                  })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'WebHttpCookieSameSitePolicy_path': {
              try {
                webView.WebCookieManager.configCookieSync("https://" + "www.example.com", "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT");
                webView.WebCookieManager.fetchAllCookies(false)
                  .then(cookies => {
                    console.log("cookies"+cookies[0].path);
                    if (cookies && cookies.length > 0 && cookies[0].path != undefined) {
                      Utils.emitEvent(true, 202502220)

                    }
                  })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'WebHttpCookieSameSitePolicy_isHttpOnly': {
              try {
                webView.WebCookieManager.configCookieSync("https://" + "www.example.com", "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT");
                webView.WebCookieManager.fetchAllCookies(false)
                  .then(cookies => {
                    console.log("cookies"+cookies[0].isHttpOnly);
                    if (cookies && cookies.length > 0 && cookies[0].isHttpOnly != undefined) {
                      Utils.emitEvent(true, 202502221)

                    }
                  })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'WebHttpCookieSameSitePolicy_isSecure': {
              try {
                webView.WebCookieManager.configCookieSync("https://" + "www.example.com", "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT");
                webView.WebCookieManager.fetchAllCookies(false)
                  .then(cookies => {
                    console.log("cookies"+cookies[0].isSecure);
                    if (cookies && cookies.length > 0 && cookies[0].isSecure != undefined) {
                      Utils.emitEvent(true, 202502222)

                    }
                  })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'WebHttpCookieSameSitePolicy_domain': {
              try {
                webView.WebCookieManager.configCookieSync("https://" + "www.example.com", "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT");
                webView.WebCookieManager.fetchAllCookies(false)
                  .then(cookies => {
                    console.log("cookies"+cookies[0].domain);
                    if (cookies && cookies.length > 0 && cookies[0].domain != undefined) {
                      Utils.emitEvent(true, 202502223)

                    }
                  })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: "pages/webViewController" })
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
    }
  }
}
