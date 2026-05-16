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

const EVENT_ID_SET_SUITE_KEY = 154010;

@Entry
@Component
struct WebDataBaseSaveHttpAuthCredentials {
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
        Button("web click").key('saveHttpAuthCredentialsClick').onClick(async () => {
          console.info("key==>" + this.emitKey)
          await waitForExist(() => this.isReceive, this.emitKey + ' isReceive', 1, 1000);
          await waitForExist(() => this.isPageEnd, this.emitKey + ' isPageEnd', 1, 1000);
          this.isReceive = -1;
          
          switch (this.emitKey) {
            case "testSaveHttpAuthCredentialsAllEmpty": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials("", "", "", "");
                Utils.emitEvent("empty", 20260240);
              } catch (error) {
                console.error("saveHttpAuthCredentials with all empty error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260240);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsAllNull": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(null, null, null, null);
                Utils.emitEvent("null", 20260241);
              } catch (error) {
                console.error("saveHttpAuthCredentials with all null error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260241);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsAllUndefined": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(undefined, undefined, undefined, undefined);
                Utils.emitEvent("undefined", 20260242);
              } catch (error) {
                console.error("saveHttpAuthCredentials with all undefined error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260242);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsEmptyHost": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials("", "realm", "username", "password");
                Utils.emitEvent("empty_host", 20260243);
              } catch (error) {
                console.error("saveHttpAuthCredentials with empty host error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260243);
              }
              break;
            }
            case "TestSaveHttpAuthCredentialsNullHost": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(null, "realm", "username", "password");
                Utils.emitEvent("null_host", 20260244);
              } catch (error) {
                console.error("saveHttpAuthCredentials with null host error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260244);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsUndefinedHost": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(undefined, "realm", "username", "password");
                Utils.emitEvent("undefined_host", 20260245);
              } catch (error) {
                console.error("saveHttpAuthCredentials with undefined host error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260245);
              }
            break;
            }
            case "testSaveHttpAuthCredentialsEmptyRealm": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials("host", "", "username", "password");
                Utils.emitEvent("empty_realm", 20260246);
              } catch (error) {
                console.error("saveHttpAuthCredentials with empty realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260246);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsNullRealm": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials("host", null, "username", "password");
                Utils.emitEvent("null_realm", 20260247);
              } catch (error) {
                console.error("saveHttpAuthCredentials with null realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260247);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsUndefinedRealm": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials("host", undefined, "username", "password");
                Utils.emitEvent("undefined_realm", 20260248);
              } catch (error) {
                console.error("saveHttpAuthCredentials with undefined realm error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260248);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsEmptyUsername": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials("host", "realm", "", "password");
                Utils.emitEvent("empty_username", 20260249);
              } catch (error) {
                console.error("saveHttpAuthCredentials with empty username error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260249);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsNullUsername": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials("host", "realm", null, "password");
                Utils.emitEvent("null_username", 20260250);
              } catch (error) {
                console.error("saveHttpAuthCredentials with null username error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260250);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsUndefinedUsername": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials("host", "realm", undefined, "password");
                Utils.emitEvent("undefined_username", 20260251);
              } catch (error) {
                console.error("saveHttpAuthCredentials with undefined username error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260251);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsEmptyPassword": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials("host", "realm", "username", "");
                Utils.emitEvent("empty_password", 20260252);
              } catch (error) {
                console.error("saveHttpAuthCredentials with empty password error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260252);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsNullPassword": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials("host", "realm", "username", null);
                Utils.emitEvent("null_password", 20260253);
              } catch (error) {
                console.error("saveHttpAuthCredentials with null password error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260253);
              }
              break;
            }
            case "testSaveHttpAuthCredentialsUndefinedPassword": {
              try {
                webview.WebDataBase.saveHttpAuthCredentials("host", "realm", "username", undefined);
                Utils.emitEvent("undefined_password", 20260254);
              } catch (error) {
                console.error("saveHttpAuthCredentials with undefined password error: " + JSON.stringify(error));
                Utils.emitEvent("error", 20260254);
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
