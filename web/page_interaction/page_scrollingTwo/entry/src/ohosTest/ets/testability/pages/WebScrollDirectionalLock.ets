/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

const EVENT_ID_SET_SUITE_KEY = 185001;

@Entry
@Component
struct WebScrollDirectionalLock {
  @State str: string = "";
  @State isReceive: number = -1;
  @State lockEnabled: boolean = true;
  @State lockType: ScrollDirectionalLockType = ScrollDirectionalLockType.ALL;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
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
    console.info("WebScrollDirectionalLock page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('WebScrollDirectionalLockButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 1, 1000);
          await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitScrollDirectionalLock001": {
              try {
                this.lockEnabled = true;
                this.lockType = ScrollDirectionalLockType.ALL;
                Utils.emitEvent(true, 185010);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 185010);
              }
              break;
            }
            case "emitScrollDirectionalLock002": {
              try {
                this.lockEnabled = true;
                this.lockType = ScrollDirectionalLockType.NESTED_SCROLL;
                Utils.emitEvent(true, 185020);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 185020);
              }
              break;
            }
            case "emitScrollDirectionalLock003": {
              try {
                this.lockEnabled = false;
                this.lockType = ScrollDirectionalLockType.ALL;
                Utils.emitEvent(true, 185030);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 185030);
              }
              break;
            }
            case "emitScrollDirectionalLock004": {
              try {
                this.lockEnabled = false;
                this.lockType = ScrollDirectionalLockType.NESTED_SCROLL;
                Utils.emitEvent(true, 185040);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 185040);
              }
              break;
            }
            case "emitScrollDirectionalLock005": {
              try {
                this.lockEnabled = true;
                this.lockType = ScrollDirectionalLockType.ALL;
                this.lockType = ScrollDirectionalLockType.NESTED_SCROLL;
                Utils.emitEvent(true, 185050);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 185050);
              }
              break;
            }
            case "emitScrollDirectionalLock006": {
              try {
                this.lockEnabled = true;
                this.lockType = ScrollDirectionalLockType.NESTED_SCROLL;
                this.lockType = ScrollDirectionalLockType.ALL;
                Utils.emitEvent(true, 185060);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 185060);
              }
              break;
            }
            case "emitScrollDirectionalLock007": {
              try {
                this.lockEnabled = true;
                this.lockEnabled = false;
                this.lockType = ScrollDirectionalLockType.ALL;
                Utils.emitEvent(true, 185070);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 185070);
              }
              break;
            }
            case "emitScrollDirectionalLock008": {
              try {
                this.lockEnabled = false;
                this.lockEnabled = true;
                this.lockType = ScrollDirectionalLockType.NESTED_SCROLL;
                Utils.emitEvent(true, 185080);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 185080);
              }
              break;
            }
            case "emitScrollDirectionalLock009": {
              try {
                this.lockEnabled = true;
                this.lockType = ScrollDirectionalLockType.ALL;
                this.lockType = ScrollDirectionalLockType.ALL;
                Utils.emitEvent(true, 185090);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 185090);
              }
              break;
            }
            case "emitScrollDirectionalLock010": {
              try {
                this.lockEnabled = true;
                this.lockType = ScrollDirectionalLockType.NESTED_SCROLL;
                this.lockType = ScrollDirectionalLockType.NESTED_SCROLL;
                Utils.emitEvent(true, 185100);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 185100);
              }
              break;
            }
            default:
              break;
          }
        })
      }

      Web({ src: $rawfile('indexFive.html'), controller: this.controller })
        .key('WebScrollDirectionalLockWeb')
        .javaScriptAccess(true)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .enableScrollDirectionalLock(this.lockEnabled, this.lockType)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
        .height('95%')
    }
  }
}
