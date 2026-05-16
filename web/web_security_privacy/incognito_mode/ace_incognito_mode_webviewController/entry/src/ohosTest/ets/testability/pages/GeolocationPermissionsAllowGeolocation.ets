/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under * License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See * License for * specific language governing permissions and
 * limitations under * License.
 */

import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest';

const EVENT_ID_SET_SUITE_KEY = 154012;

@Entry
@Component
struct GeolocationPermissionsAllowGeolocation {
  controller: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('allowGeolocationClick').onClick(async () => {
          console.info("key==>" + this.emitKey)
          await waitForExist(() => this.isReceive, this.emitKey + ' isReceive', 1, 1000);
          await waitForExist(() => this.isPageEnd, this.emitKey + ' isPageEnd', 1, 1000);
          this.isReceive = -1;

          switch (this.emitKey) {
            case "testAllowGeolocationEmptyOrigin":
              try {
                webview.GeolocationPermissions.allowGeolocation("");
                Utils.emitEvent("error", 20260256);
              } catch (error) {
                console.error("allowGeolocation with empty origin error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260256);
              }
              break;
            case "testAllowGeolocationNullOrigin":
              try {
                webview.GeolocationPermissions.allowGeolocation(null);
                Utils.emitEvent("error", 20260257);
              } catch (error) {
                console.error("allowGeolocation with null origin error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260257);
              }
              break;
            case "testAllowGeolocationUndefinedOrigin":
              try {
                webview.GeolocationPermissions.allowGeolocation(undefined);
                Utils.emitEvent("error", 20260258);
              } catch (error) {
                console.error("allowGeolocation with undefined origin error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260258);
              }
              break;
            case "testAllowGeolocationIncognitoFalse":
              try {
                webview.GeolocationPermissions.allowGeolocation("https://www.example.com", false);
                Utils.emitEvent("success", 20260259);
              } catch (error) {
                console.error("allowGeolocation with incognito=false error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260259);
              }
              break;
          }
        })
      }
      Web({ src: 'www.example.com', controller: this.controller })
        .databaseAccess(true)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
