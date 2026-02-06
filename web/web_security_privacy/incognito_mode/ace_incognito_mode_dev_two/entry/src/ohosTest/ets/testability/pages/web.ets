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
import UIAbility from '@ohos.app.ability.UIAbility';
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import {waitForAssert, waitForExist} from '../../test/WaitTest';



export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log("EntryAbility onCreate");
    web_webview.WebviewController.initializeWebEngine();
    AppStorage.setOrCreate("abilityWant", want);
    console.log("EntryAbility onCreate done");
  }
}

let loadedUrl: string;

@Entry
@Component
struct Index {
  controller: WebController = new WebController()
  responseweb: WebResourceResponse = new WebResourceResponse();
  @State str: string = "emitClearHistory";
  @State text: string = "";
  @State textRatio: number = 100;
  @State zoomAccessValue: boolean = true;
  host: string = "www.spincast.org";
  realm: string = "protected example";
  username_password: string[] = [];
  origin: string = "resource://rawfile/";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 160500,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(160500)
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
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info('start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
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
            case "emitClearHistory": {
              this.isPageEnd = -1;
              this.controller.loadUrl({ url: "http://www.baidu.com/" });
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.clearHistory();
              this.isPageEnd = -1;
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              let clearHistoryCalled = this.controller.accessBackward();
              Utils.emitEvent(clearHistoryCalled, 160510);
              break;
            }
            case "emitAllowGeolocation": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation("resource://rawfile/");
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                if (error) {
                  console.log('error:' + JSON.stringify(error));
                  this.text = this.origin + ",error ," + JSON.stringify(error);
                  return;
                }
                this.text = this.origin + ", result: " + result;
                Utils.emitEvent(this.text, 160520);
              })
              break;
            }
            case "emitDeleteGeolocation": {
              web_webview.GeolocationPermissions.deleteGeolocation("resource://rawfile/");
              web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                if (error) {
                  console.log('error:' + JSON.stringify(error));
                  this.text = origins + ",error ," + JSON.stringify(error);
                  return;
                }
                this.text = origins.join();
                Utils.emitEvent(this.text, 160530);
              })
              break;
            }
            case "emitDeleteAllGeolocation": {
              web_webview.GeolocationPermissions.allowGeolocation("resource://rawfile/");
              web_webview.GeolocationPermissions.deleteAllGeolocation();
              web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                if (error) {
                  console.log('error:' + JSON.stringify(error));
                  this.text = origins + ",error ," + JSON.stringify(error);
                  return;
                }
                this.text = origins.join();
                Utils.emitEvent(this.text, 160540);
              })
              break;
            }
            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .databaseAccess(true)
        .zoomAccess(this.zoomAccessValue)
        .textZoomRatio(this.textRatio)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('WebController onPageEnd url:' + event.url);
          }
        })
    }
  }
}
