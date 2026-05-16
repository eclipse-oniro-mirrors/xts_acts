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

const EVENT_ID_SET_SUITE_KEY = 184001;

@Entry
@Component
struct WebScrollbarLayoutPolicy {
  @State str: string = "";
  @State isReceive: number = -1;
  @State policyValue: ScrollbarLayoutPolicy = ScrollbarLayoutPolicy.CONTENT;
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
    console.info("WebScrollbarLayoutPolicy page valueChangeCallBack");
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
        Button("web click").key('ScrollbarLayoutPolicyButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 1, 1000);
          await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitScrollbarLayoutPolicy001": {
              try {
                this.policyValue = ScrollbarLayoutPolicy.CONTENT;
                Utils.emitEvent(true, 184010);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 184010);
              }
              break;
            }
            case "emitScrollbarLayoutPolicy002": {
              try {
                this.policyValue = ScrollbarLayoutPolicy.SYSTEM;
                Utils.emitEvent(true, 184020);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 184020);
              }
              break;
            }
            case "emitScrollbarLayoutPolicy003": {
              try {
                this.policyValue = ScrollbarLayoutPolicy.CONTENT;
                this.policyValue = ScrollbarLayoutPolicy.SYSTEM;
                Utils.emitEvent(true, 184030);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 184030);
              }
              break;
            }
            case "emitScrollbarLayoutPolicy004": {
              try {
                this.policyValue = ScrollbarLayoutPolicy.SYSTEM;
                this.policyValue = ScrollbarLayoutPolicy.CONTENT;
                Utils.emitEvent(true, 184040);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 184040);
              }
              break;
            }
            case "emitScrollbarLayoutPolicy005": {
              try {
                this.policyValue = ScrollbarLayoutPolicy.CONTENT;
                this.policyValue = ScrollbarLayoutPolicy.CONTENT;
                Utils.emitEvent(true, 184050);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 184050);
              }
              break;
            }
            case "emitScrollbarLayoutPolicy006": {
              try {
                this.policyValue = ScrollbarLayoutPolicy.SYSTEM;
                this.policyValue = ScrollbarLayoutPolicy.SYSTEM;
                Utils.emitEvent(true, 184060);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 184060);
              }
              break;
            }
            default:
              break;
          }
        })
      }

      Web({ src: $rawfile('indexFive.html'), controller: this.controller })
        .key('WebScrollbarLayoutPolicyWeb')
        .javaScriptAccess(true)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .scrollbarLayoutPolicy(this.policyValue)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
        .height('95%')
    }
  }
}
