/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import fileio from '@ohos.fileio';
import prompt from '@system.prompt';
import cert from '@ohos.security.cert';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

let loadedUrl: string;

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  dialogController?: CustomDialogController;
  scheme1: web_webview.WebCustomScheme = { schemeName: "name1", isSupportCORS: true, isSupportFetch: true };
  scheme2: web_webview.WebCustomScheme = { schemeName: "name2", isSupportCORS: true, isSupportFetch: true };
  scheme3: web_webview.WebCustomScheme = { schemeName: "name3", isSupportCORS: true, isSupportFetch: true };
  responseweb: WebResourceResponse = new WebResourceResponse();
  @State str: string = "emitGetStoredGeolocation";
  @State text: boolean = false;
  @State num: number = 0;
  @State mode: WebDarkMode = WebDarkMode.Off;
  @State mode1: WebDarkMode = WebDarkMode.On;
  @State mode2: WebDarkMode = WebDarkMode.Auto;
  @State enterPageEnd: boolean = false;
  @State getString: boolean = false;
  @State getNum: boolean = false;
  @State getBoo: boolean = false;
  @State getArrayBuffer: boolean = false;
  @State getArray: boolean = false;
  @State msg1: string = "";
  @State type: number = 0;
  @State enterPageEndAuto: boolean = false;
  @State enterPageEndOff: boolean = false;
  @State outputStr: string = '';
  message: web_webview.WebMessageExt = new web_webview.WebMessageExt();
  ports: web_webview.WebMessagePort[] | null = null;
  nativePort: web_webview.WebMessagePort | null = null;
  @State webMessResult: string = ""
  testObj: ESObject = {
    testOne: (data: ESObject): ESObject => {
      Utils.emitEvent(data, 13)
      return data;
    },
    toString: () => {
      console.log('Web Component toString');
    }
  };
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 160580,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(160580)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    try {
      web_webview.WebviewController.customizeSchemes([this.scheme1, this.scheme2, this.scheme3]);
      web_webview.WebviewController.setWebDebuggingAccess(true);
      web_webview.once("webInited", () => {
        web_webview.WebCookieManager.setCookie("https://www.huawei.com", "a=b");
      });
    } catch (error) {
      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
    }

  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str);
          switch (this.str) {
            case "emitGetStoredGeolocation": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation("file:///")
                web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error) {
                    console.log('getStoredGeolocationAsync error: ' + JSON.stringify(error))
                    return;
                  }
                  if (origins) {
                    let origins_str: string = origins.join()
                    console.log('getStoredGeolocationAsync origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 160590);
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitSetHttpDnsSuccess": {
              try {
                web_webview.WebviewController.setHttpDns(web_webview.SecureDnsMode.SECURE_ONLY,
                  "https://httpdns-browser.platform.dbankcloud.cn/dns-query{?dns}")
                this.isPageEnd = -1;
                this.controller.loadUrl("https://www.example.com/");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                Utils.emitEvent(1, 160600);

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetAccessibleGeolocation": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation("file:///")
                web_webview.GeolocationPermissions.getAccessibleGeolocation("file:///", (error, result) => {
                  if (error) {
                    console.log('getAccessibleGeolocation error: ' + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.log('getAccessibleGeolocationAsync result: ' + result);
                    Utils.emitEvent(result, 160610);
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitGetAccessibleGeolocationPromise": {
              try {
                 web_webview.GeolocationPermissions.allowGeolocation("file:///");
                web_webview.GeolocationPermissions.getAccessibleGeolocation("file:///")
                  .then(result => {
                    console.log('getAccessibleGeolocationPromise result: ' + result);
                    Utils.emitEvent(result, 160620);
                  }).catch((error: ESObject) => {
                  console.log('getAccessibleGeolocationPromise error: ' + JSON.stringify(error));
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetStoredGeolocationPromise": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation("file:///")
                web_webview.GeolocationPermissions.getStoredGeolocation()
                  .then(origins => {
                    let origins_str: string = origins.join();
                    console.log('getStoredGeolocationPromise origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 160630);
                  }).catch((error: ESObject) => {
                  console.log('getStoredGeolocationPromise error: ' + JSON.stringify(error));
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: "www.example.com", controller: this.controller })
        .mediaPlayGestureAccess(true)
        .javaScriptAccess(true)
        .zoomAccess(this.text)
        .onDataResubmitted((event) => {
          console.log('onDataResubmitted');
          event.handler.resend();
        })
        .onContextMenuShow((event) => {
          console.info(event.param.getMediaType() + event.param.getSelectionText() + event.param.getSourceType());
          console.info(event.param.getInputFieldType().toString());
          console.info(event.param.isEditable().toString());
          console.info(event.param.getEditStateFlags().toString());
          event.result.paste();
          event.result.cut();
          return true;
        })
        .onHttpErrorReceive((event) => {
          event.response.setResponseIsReady(true);
        })
        .onPageEnd((event) => {
          this.isPageEnd = 0;

        })
        .darkMode(this.mode)
        .forceDarkAccess(false)
        .webSerifFont('serif')
        .webFixedFont('fixed')
        .webSansSerifFont('serif')
        .minLogicalFontSize(1)
        .horizontalScrollBarAccess(true)
        .verticalScrollBarAccess(true)
        .onTouchIconUrlReceived((event) => {
          console.log('onTouchIconUrlReceived:' + JSON.stringify(event));
        })
        .pinchSmooth(true)
    }
  }
}