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
import { JsProxyObject } from '../../test/Interfaces';
import business_error, { BusinessError } from '@ohos.base';


type OnProxyConfigChangeCallback = () => void
@Entry
@Component
struct webviewNetworkProxy {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = '';
  @State proxyConfig: webview.ProxyConfig = new webview.ProxyConfig();
  @State callbackFlag: boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('webviewNetworkProxy click').key('networkProxyButton').onClick(async () => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testNetworkProxySchemeFilterMatchAllSchemes': {
              try {
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn',
                  webview.ProxySchemeFilter.MATCH_ALL_SCHEMES);
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
                this.proxyConfig.bypassHostnamesWithoutPeriod();
                await Utils.sleep(2000);
                webview.ProxyController.applyProxyOverride(this.proxyConfig, () => {
                  console.log('applyProxyOverride callback');
                  this.callbackFlag = true;
                });
                await Utils.sleep(2000);
                this.controller.loadUrl('www.baidu.com');
                await Utils.sleep(4000);
                console.log('callbackFlag:' + this.callbackFlag);
                Utils.emitEvent(this.callbackFlag, 202502187);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'testClearImplicitRules': {
              try {
                this.callbackFlag = false;
                this.proxyConfig.insertProxyRule('algorithmmark.hwcloudtest.cn');
                await Utils.sleep(2000);
                this.proxyConfig.clearImplicitRules();
                await Utils.sleep(2000);
                webview.ProxyController.applyProxyOverride(this.proxyConfig, () => {
                  console.log('applyProxyOverride callback');
                  this.callbackFlag = true;
                });
                await Utils.sleep(2000);
                this.controller.loadUrl('http://localhost:8080');
                await Utils.sleep(4000);
                console.log('callbackFlag:' + this.callbackFlag);
                Utils.emitEvent(this.callbackFlag, 202502188);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'testEnableReverseBypass': {
              try {
                this.proxyConfig.insertBypassRule('www.example.com');
                await Utils.sleep(2000);
                this.proxyConfig.enableReverseBypass(true);
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
                this.proxyConfig.enableReverseBypass(false);
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
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
                await Utils.sleep(2000);
                webview.ProxyController.applyProxyOverride(this.proxyConfig, () => {
                  console.log('applyProxyOverride callback');
                });
                await Utils.sleep(2000);
                webview.ProxyController.removeProxyOverride(() => {
                  console.log('removeProxyOverride callback');
                  Utils.emitEvent(true, 202502196);
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
    }
  }
}
