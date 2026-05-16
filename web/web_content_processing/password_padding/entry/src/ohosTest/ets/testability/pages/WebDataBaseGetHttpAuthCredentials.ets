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
import { waitForExist } from '../../test/WaitTest.test';

const EVENT_ID_SET_SUITE_KEY = 154069;

@Entry
@Component
struct WebDataBaseGetHttpAuthCredentials {
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
        Button("web click").key('getHttpAuthCredentialsClick').onClick(async () => {
          console.info("key==>" + this.emitKey)
          await waitForExist(() => this.isReceive, this.emitKey + ' isReceive', 1, 1000);
          await waitForExist(() => this.isPageEnd, this.emitKey + ' isPageEnd', 1, 1000);
          this.isReceive = -1;
          
          switch (this.emitKey) {
            case "testGetHttpAuthCredentialsEmptyHostEmptyRealm": {
              try {
                let result = webview.WebDataBase.getHttpAuthCredentials("", "");
                Utils.emitEvent("empty", 20260239);
              } catch (error) {
                console.error("getHttpAuthCredentials with empty host and empty realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260239);
              }
              break;
            }
            case "testGetHttpAuthCredentialsNullHostNullRealm": {
              try {
                let result = webview.WebDataBase.getHttpAuthCredentials(null, null);
                Utils.emitEvent("null", 20260240);
              } catch (error) {
                console.error("getHttpAuthCredentials with null host and null realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260240);
              }
              break;
            }
            case "testGetHttpAuthCredentialsUndefinedHostUndefinedRealm": {
              try {
                let result = webview.WebDataBase.getHttpAuthCredentials(undefined, undefined);
                Utils.emitEvent("undefined", 20260241);
              } catch (error) {
                console.error("getHttpAuthCredentials with undefined host and undefined realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260241);
              }
              break;
            }
            case "testGetHttpAuthCredentialsEmptyHostNullRealm": {
              try {
                let result = webview.WebDataBase.getHttpAuthCredentials("", null);
                Utils.emitEvent("empty_null", 20260242);
              } catch (error) {
                console.error("getHttpAuthCredentials with empty host and null realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260242);
              }
              break;
            }
            case "testGetHttpAuthCredentialsEmptyHostUndefinedRealm": {
              try {
                let result = webview.WebDataBase.getHttpAuthCredentials("", undefined);
                Utils.emitEvent("empty_undefined", 20260243);
              } catch (error) {
                console.error("getHttpAuthCredentials with empty host and undefined realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260243);
              }
              break;
            }
            case "testGetHttpAuthCredentialsNullHostEmptyRealm": {
              try {
                let result = webview.WebDataBase.getHttpAuthCredentials(null, "");
                Utils.emitEvent("null_empty", 20260244);
              } catch (error) {
                console.error("getHttpAuthCredentials with null host and empty realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260244);
              }
              break;
            }
            case "testGetHttpAuthCredentialsNullHostUndefinedRealm": {
              try {
                let result = webview.WebDataBase.getHttpAuthCredentials(null, undefined);
                Utils.emitEvent("null_undefined", 20260245);
              } catch (error) {
                console.error("getHttpAuthCredentials with null host and undefined realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260245);
              }
              break;
            }
            case "testGetHttpAuthCredentialsUndefinedHostEmptyRealm": {
              try {
                let result = webview.WebDataBase.getHttpAuthCredentials(undefined, "");
                Utils.emitEvent("undefined_empty", 20260246);
              } catch (error) {
                console.error("getHttpAuthCredentials with undefined host and empty realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260246);
              }
              break;
            }
            case "testGetHttpAuthCredentialsUndefinedHostNullNullRealm": {
              try {
                let result = webview.WebDataBase.getHttpAuthCredentials(undefined, null);
                Utils.emitEvent("undefined_null", 20260247);
              } catch (error) {
                console.error("getHttpAuthCredentials with undefined host and null realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260247);
              }
              break;
            }
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
