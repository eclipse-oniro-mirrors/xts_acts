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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct webViewGetAccessibleGeolocation {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitGetAccessAllowAndRetainAllFalse";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State geolocationAccess: boolean = true;
  @State invokeAllow: boolean = true;
  @State invokeRetain: boolean = true;
  @State checkEleResult: boolean = false;
  origin: string = "file:///";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewGetAccessibleGeolocation page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("geolocationTest").key('webViewGetAccessibleGeolocation').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitGetAccessAllowAndRetainAllFalse": {
              try {
                this.controller.loadUrl($rawfile('geo.html'));
                await Utils.sleep(1000);
                web_webview.GeolocationPermissions.deleteGeolocation(this.origin);
                this.invokeAllow = false;
                this.invokeRetain = false;
                web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                  if (error) {
                    console.log('getAccessibleGeolocationAsync error: ' + JSON.stringify(error));
                    return;
                  }
                  this.checkEleResult = result;
                  console.log('getAccessibleGeolocationAsync result: ' + result);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.checkEleResult, 409)
              })
              break;
            }
            case "emitGetAccessAllowAndRetainAllTrue": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation(this.origin);
                this.invokeAllow = true;
                this.invokeRetain = true;
                this.controller.loadUrl($rawfile('geo.html'));
                await Utils.sleep(1000);
                web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                  if (error) {
                    console.log('getAccessibleGeolocationAsync error: ' + JSON.stringify(error));
                    return;
                  }
                  this.checkEleResult = result;
                  console.log('getAccessibleGeolocationAsync result: ' + result);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.checkEleResult, 410)
              })
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .geolocationAccess(this.geolocationAccess)
        .onGeolocationShow((event) => {
          event.geolocation.invoke(event.origin, this.invokeAllow, this.invokeRetain)
          console.log("webViewInVoke : onGeolocationShow : " + event.origin + this.invokeAllow, this.invokeRetain);
        })
    }
  }
}