/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest';

const EVENT_ID_SET_SUITE_KEY = 154015;

@Entry
@Component
struct GeolocationPermissionsGetAccessibleGeolocation {
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
        Button("web click").key('getAccessibleGeolocationClick').onClick(async () => {
          console.info("key==>" + this.emitKey)
          await waitForExist(() => this.isReceive, this.emitKey + ' isReceive', 1, 1000);
          await waitForExist(() => this.isPageEnd, this.emitKey + ' isPageEnd', 1, 1000);
          this.isReceive = -1;

          switch (this.emitKey) {
            case "testGetAccessibleGeolocationEmptyOrigin":
              try {
                let result = await webview.GeolocationPermissions.getAccessibleGeolocation("");
                Utils.emitEvent("error", 20260265);
              } catch (error) {
                console.error("getAccessibleGeolocation with empty origin error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260265);
              }
              break;
            case "testGetAccessibleGeolocationNullOrigin":
              try {
                let result = await webview.GeolocationPermissions.getAccessibleGeolocation(null);
                Utils.emitEvent("error", 20260266);
              } catch (error) {
                console.error("getAccessibleGeolocation with null origin error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260266);
              }
              break;
            case "testGetAccessibleGeolocationUndefinedOrigin":
              try {
                let result = await webview.GeolocationPermissions.getAccessibleGeolocation(undefined);
                Utils.emitEvent("error", 20260267);
              } catch (error) {
                console.error("getAccessibleGeolocation with undefined origin error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260267);
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
