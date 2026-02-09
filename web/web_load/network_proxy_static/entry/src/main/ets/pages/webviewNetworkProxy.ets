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

import webview from '@ohos.web.webview'
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement'
import { Button, ClickEvent, Column, Component, Entry, Row, Text, Web } from '@ohos.arkui.component'
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import { Hypium } from '../../../hypium';
import Utils from '../../src/test/Utils.test';
import { UIContext, Router } from '@ohos.arkui.UIContext'

class StringFields {
  public str: string = '';
}
type OnProxyConfigChangeCallback = () => void
@Entry
@Component
struct webviewNetworkProxy {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State proxyConfig: webview.ProxyConfig = new webview.ProxyConfig();
  @State callbackFlag: boolean = false;

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
        Button("webviewNetworkProxy click").key('networkProxyButton').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {
            case 'testNetworkProxySchemeFilterMatchAllSchemes': {
              try {
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn',
                  webview.ProxySchemeFilter.MATCH_ALL_SCHEMES);
                let proxyRules = this.proxyConfig.getProxyRules();
                for (let i = 0; i < proxyRules.length; i++) {
                  console.log('SchemeFilter: ' + proxyRules[i].getSchemeFilter());
                  console.log('Url: ' + proxyRules[i].getUrl());
                  let schemeFilter = proxyRules[i].getSchemeFilter();
                  if (schemeFilter === 0) {
                    Utils.emitEvent(true, 202502181);
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testNetworkProxySchemeFilterMatchHttp': {
              try {
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn',
                  webview.ProxySchemeFilter.MATCH_HTTP);
                let proxyRules = this.proxyConfig.getProxyRules();
                for (let i = 0; i < proxyRules.length; i++) {
                  console.log('SchemeFilter: ' + proxyRules[i].getSchemeFilter());
                  console.log('Url: ' + proxyRules[i].getUrl());
                  let schemeFilter = proxyRules[i].getSchemeFilter();
                  if (schemeFilter === 1) {
                    Utils.emitEvent(true, 202502182);
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testNetworkProxySchemeFilterMatchHttps': {
              try {
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn',
                  webview.ProxySchemeFilter.MATCH_HTTPS);
                let proxyRules = this.proxyConfig.getProxyRules();
                for (let i = 0; i < proxyRules.length; i++) {
                  console.log('SchemeFilter: ' + proxyRules[i].getSchemeFilter());
                  console.log('Url: ' + proxyRules[i].getUrl());
                  let schemeFilter = proxyRules[i].getSchemeFilter();
                  if (schemeFilter === 2) {
                    Utils.emitEvent(true, 202502183);
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testInsertProxyRule': {
              try {
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn');
                let proxyRules = this.proxyConfig.getProxyRules();
                for (let i = 0; i < proxyRules.length; i++) {
                  console.log('SchemeFilter: ' + proxyRules[i].getSchemeFilter());
                  console.log('Url: ' + proxyRules[i].getUrl());
                  let schemeFilter = proxyRules[i].getSchemeFilter();
                  let url = proxyRules[i].getUrl();
                  if (schemeFilter === 0 && url === 'algorithmmark.hwcloudtest.cn') {
                    Utils.emitEvent(true, 202502184);
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testInsertDirectRule': {
              try {
                this.proxyConfig.insertDirectRule(webview.ProxySchemeFilter.MATCH_ALL_SCHEMES);
                let proxyRules = this.proxyConfig.getProxyRules();
                for (let i = 0; i < proxyRules.length; i++) {
                  console.log('SchemeFilter: ' + proxyRules[i].getSchemeFilter());
                  let schemeFilter = proxyRules[i].getSchemeFilter();
                  if (schemeFilter === 0) {
                    Utils.emitEvent(true, 202502185);
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testInsertBypassRule': {
              try {
                this.proxyConfig.insertBypassRule('www.example.com');
                let bypassRules = this.proxyConfig.getBypassRules();
                for (let i = 0; i < bypassRules.length; i++) {
                  console.log('bypassRules: ' + bypassRules[i]);
                  if (bypassRules[i] === 'www.example.com') {
                    Utils.emitEvent(true, 202502186);
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testBypassHostnamesWithoutPeriod': {
              try {
                this.callbackFlag = false;
                this.proxyConfig.insertProxyRule('http://testnone');
                this.proxyConfig.bypassHostnamesWithoutPeriod();
                webview.ProxyController.applyProxyOverride(this.proxyConfig, () => {
                  console.log('applyProxyOverride callback');
                  this.callbackFlag = true;
                });
                setTimeout(() => {
                  this.controller.loadUrl('www.baidu.com');
                  console.log('callbackFlag:' + this.callbackFlag);
                  Utils.emitEvent(this.callbackFlag, 202502187);
                }, 3000)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testClearImplicitRules': {
              try {
                this.callbackFlag = false;
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn');
                this.proxyConfig.clearImplicitRules();
                webview.ProxyController.applyProxyOverride(this.proxyConfig, () => {
                  console.log('applyProxyOverride callback');
                  this.callbackFlag = true;
                });
                setTimeout(() => {
                  this.controller.loadUrl('http://localhost:8080');
                  console.log('callbackFlag:' + this.callbackFlag);
                  Utils.emitEvent(this.callbackFlag, 202502188);
                }, 3000)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testEnableReverseBypass': {
              try {
                this.proxyConfig.insertBypassRule('www.example.com');
                this.proxyConfig.enableReverseBypass(true);
                let isReverseBypass = this.proxyConfig.isReverseBypassEnabled();
                console.log('isReverseBypass:' + isReverseBypass);
                Utils.emitEvent(isReverseBypass, 202502189);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testGetBypassRules': {
              try {
                this.proxyConfig.insertBypassRule('www.baidu.com');
                let bypassRules = this.proxyConfig.getBypassRules();
                for (let i = 0; i < bypassRules.length; i++) {
                  console.log('bypassRules: ' + bypassRules[i]);
                  if (bypassRules[i] === 'www.baidu.com') {
                    Utils.emitEvent(true, 202502190);
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testGetProxyRules': {
              try {
                this.proxyConfig.insertProxyRule('http://localhost');
                let proxyRules = this.proxyConfig.getProxyRules();
                for (let i = 0; i < proxyRules.length; i++) {
                  console.log('SchemeFilter: ' + proxyRules[i].getSchemeFilter());
                  console.log('Url: ' + proxyRules[i].getUrl());
                  let schemeFilter = proxyRules[i].getSchemeFilter();
                  let url = proxyRules[i].getUrl();
                  if (schemeFilter === 0 && url === 'http://localhost') {
                    Utils.emitEvent(true, 202502191);
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testIsReverseBypassEnabled': {
              try {
                this.proxyConfig.insertBypassRule('www.baidu.com');
                this.proxyConfig.enableReverseBypass(false);
                let isReverseBypass = this.proxyConfig.isReverseBypassEnabled();
                console.log('isReverseBypass:' + isReverseBypass);
                Utils.emitEvent(isReverseBypass, 202502192);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testGetSchemeFilter': {
              try {
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn');
                let proxyRules = this.proxyConfig.getProxyRules();
                for (let i = 0; i < proxyRules.length; i++) {
                  console.log('SchemeFilter: ' + proxyRules[i].getSchemeFilter());
                  console.log('Url: ' + proxyRules[i].getUrl());
                  let schemeFilter = proxyRules[i].getSchemeFilter();
                  if (schemeFilter === 0) {
                    Utils.emitEvent(true, 202502193);
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testProxyGetUrl': {
              try {
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn');
                let proxyRules = this.proxyConfig.getProxyRules();
                for (let i = 0; i < proxyRules.length; i++) {
                  console.log('SchemeFilter: ' + proxyRules[i].getSchemeFilter());
                  console.log('Url: ' + proxyRules[i].getUrl());
                  let url = proxyRules[i].getUrl();
                  if (url === 'algorithmmark.hwcloudtest.cn') {
                    Utils.emitEvent(true, 202502194);
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testApplyProxyOverride': {
              try {
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn');
                webview.ProxyController.applyProxyOverride(this.proxyConfig, () => {
                  console.log('applyProxyOverride callback');
                  Utils.emitEvent(true, 202502195);
                });
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testRemoveProxyOverride': {
              try {
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn');
                webview.ProxyController.applyProxyOverride(this.proxyConfig, () => {
                  console.log('applyProxyOverride callback');
                });
                webview.ProxyController.removeProxyOverride(() => {
                  console.log('removeProxyOverride callback');
                  Utils.emitEvent(true, 202502196);
                });
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: "pages/webCookieManager" })
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}
