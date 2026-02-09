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
import webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { JSON } from '@kit.ArkTS';

const EVENT_ID_SET_EMIT_KEY = 200040;

@Entry
@Component
struct webviewNetworkProxy {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = '';
  @State proxyConfig: webview.ProxyConfig = new webview.ProxyConfig();
  @State callbackFlag: boolean = false;
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('webviewNetworkProxy click').key('networkProxyButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'networkProxyButtonIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'networkProxyButtonIsReceive', 1, 1000);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitGetProxyRulesEmpty': {
              try {
                let proxyRules = this.proxyConfig.getProxyRules();
                console.log('proxyRules==>' + proxyRules.length);
                if (proxyRules.length == 0) {
                  Utils.emitEvent(true, 2025102101);
                } else {
                  Utils.emitEvent(false, 2025102101);
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.message, 2025102101);
              }
              break;
            }
            case 'emitGetBypassRulesEmpty': {
              try {
                let bypassRules = this.proxyConfig.getBypassRules();
                console.log('bypassRules==>' + bypassRules.length);
                if (bypassRules.length == 0) {
                  Utils.emitEvent(true, 2025102102);
                } else {
                  Utils.emitEvent(false, 2025102102);
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.message, 2025102102);
              }
              break;
            }
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
                    Utils.emitEvent(true, 200050);
                    break;
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
                    Utils.emitEvent(true, 200060);
                    break;
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
                    Utils.emitEvent(true, 200070);
                    break;
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
                    Utils.emitEvent(true, 200080);
                    break;
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
                    Utils.emitEvent(true, 200090);
                    break;
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
                  console.log('insert bypassRules: ' + bypassRules[i]);
                  if (bypassRules[i] === 'www.example.com') {
                    Utils.emitEvent(true, 200100);
                    break;
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'testBypassHostnamesWithoutPeriod': {
              try {
                this.proxyConfig.insertProxyRule('http://testnone');
                this.proxyConfig.bypassHostnamesWithoutPeriod();
                webview.ProxyController.applyProxyOverride(this.proxyConfig, () => {
                  console.log('applyProxyOverride callback');
                  Utils.emitEvent(true, 200110);
                });
                this.isPageEnd = -1;
                this.controller.loadUrl('www.example.com');
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'testClearImplicitRules': {
              try {
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn');
                this.proxyConfig.clearImplicitRules();
                webview.ProxyController.applyProxyOverride(this.proxyConfig, () => {
                  console.log('applyProxyOverride callback');
                  Utils.emitEvent(true, 200120);
                });
                this.isPageEnd = -1;
                this.controller.loadUrl('http://localhost:8080');
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
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
                Utils.emitEvent(isReverseBypass, 200130);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'testGetBypassRules': {
              try {
                this.proxyConfig.insertBypassRule('testGetBypassRules');
                let bypassRules = this.proxyConfig.getBypassRules();
                for (let i = 0; i < bypassRules.length; i++) {
                  console.log('get bypassRules: ' + bypassRules[i]);
                  if (bypassRules[i] === 'testGetBypassRules') {
                    Utils.emitEvent(true, 200140);
                    break;
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
                  let schemeFilter = proxyRules[i].getSchemeFilter();
                  let url = proxyRules[i].getUrl();
                  console.log('testGetProxyRules SchemeFilter: ' + schemeFilter);
                  console.log('testGetProxyRules Url: ' + url);
                  if (schemeFilter === 0 && url === 'http://localhost') {
                    Utils.emitEvent(true, 200150);
                    break;
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'testIsReverseBypassEnabled': {
              try {
                this.proxyConfig.insertBypassRule('testIsReverseBypassEnabled');
                this.proxyConfig.enableReverseBypass(false);
                let isReverseBypass = this.proxyConfig.isReverseBypassEnabled();
                console.log('isReverseBypass:' + isReverseBypass);
                Utils.emitEvent(isReverseBypass, 200160);
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
                  console.log('testGetSchemeFilter SchemeFilter: ' + proxyRules[i].getSchemeFilter());
                  console.log('testGetSchemeFilter Url: ' + proxyRules[i].getUrl());
                  let schemeFilter = proxyRules[i].getSchemeFilter();
                  if (schemeFilter === 0) {
                    Utils.emitEvent(true, 200170);
                    break;
                  }
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'testProxyGetUrl': {
              try {
                this.proxyConfig.insertProxyRule('testProxyGetUrl.cn');
                let proxyRules = this.proxyConfig.getProxyRules();
                for (let i = 0; i < proxyRules.length; i++) {
                  console.log('SchemeFilter: ' + proxyRules[i].getSchemeFilter());
                  console.log('Url: ' + proxyRules[i].getUrl());
                  let url = proxyRules[i].getUrl();
                  if (url === 'testProxyGetUrl.cn') {
                    Utils.emitEvent(true, 200180);
                    break;
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
                  Utils.emitEvent(true, 200190);
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
                  Utils.emitEvent(true, 200200);
                });
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}