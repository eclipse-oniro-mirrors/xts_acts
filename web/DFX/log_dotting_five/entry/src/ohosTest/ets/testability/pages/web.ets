/*
 * Copyright (c) 2021~2023 Huawei Device Co., Ltd.
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

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  scheme1: web_webview.WebCustomScheme = { schemeName: "name1", isSupportCORS: true, isSupportFetch: true };
  scheme2: web_webview.WebCustomScheme = { schemeName: "name2", isSupportCORS: true, isSupportFetch: true };
  scheme3: web_webview.WebCustomScheme = { schemeName: "name3", isSupportCORS: true, isSupportFetch: true };
  @State str: string = "emitClearMatches";
  @State text: boolean = false;
  @State mode: WebDarkMode = WebDarkMode.Off;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 100,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
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
          console.info("key==>" + this.str);
          switch (this.str) {
            case "emitClearMatches": {
              try {
                this.controllerTwo.clearMatches();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 17)
              }
              break;
            }
            case "emitSearchNext": {
              try {
                this.controllerTwo.searchNext(true);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 18)
              }
              break;
            }
            case "emitClearSslCache": {
              try {
                this.controllerTwo.clearSslCache();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 19)
              }
              break;
            }
            case "emitClearClientAuthenticationCache": {
              try {
                this.controllerTwo.clearClientAuthenticationCache();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 20);
              }
              break;
            }
            case "emitStop": {
              try {
                this.controllerTwo.stop();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 21);
              }
              break;
            }
            case "emitRequestFocus": {
              try {
                this.controllerTwo.requestFocus();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 22);
              }
              break;
            }
            case "emitZoomIn": {
              try {
                this.controllerTwo.zoomIn();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 23);
              }
              break;
            }
            case "emitZoomOut": {
              try {
                this.controllerTwo.zoomOut();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 24);
              }
              break;
            }
            case "emitGetWebId": {
              try {
                this.controllerTwo.requestFocus();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 25);
              }
              break;
            }
            case "emitGetUserAgent": {
              try {
                this.controllerTwo.requestFocus();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 26);
              }
              break;
            }
            case "emitGetPageHeigth": {
              try {
                this.controllerTwo.getPageHeight();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 27);
              }
              break;
            }
            case "emitBackOrForward": {
              try {
                this.controllerTwo.backOrForward(-2);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 28);
              }
              break;
            }
            case "emitGetUrl": {
              try {
                let url = this.controllerTwo.getUrl();
                console.log("url: " + url);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 30);
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
        .darkMode(this.mode)
        .forceDarkAccess(false)
        .webSerifFont('serif')
        .webFixedFont('fixed')
        .webSansSerifFont('serif')
        .minLogicalFontSize(1)
        .horizontalScrollBarAccess(true)
        .verticalScrollBarAccess(true)
        .pinchSmooth(true)
    }
  }
}