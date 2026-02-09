/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

let loadedUrl: string;
const EVENT_ID_SET_EMIT_KEY = 200210;

@Entry
@Component
struct Index {
  controller: WebController = new WebController();
  @State str: string = "";
  @State newUrl: string = "";
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
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
          await Utils.waitForExist(()=>this.isPageEnd, 'webcomponentIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'webcomponentIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "emitUserAgent": {
              this.controller.runJavaScript({
                script: "getUserAgent()", callback: (res) => {
                  Utils.emitEvent(res, 200220);
                }
              });
              break;
            }
            case "emitOnUrlLoadIntercept": {
              this.isPageEnd = -1;
              this.controller.loadUrl({ url: "https://www.example.com/" });
              let realVal = await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              if (realVal === 1) {
                Utils.emitEvent(loadedUrl, 200230);
              }
              break;
            }
            case "emitLoadUrl": {
              this.isPageEnd = -1;
              this.controller.loadUrl({ url: "resource://rawfile/index.html" });
              let realVal = await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              if (realVal !== 1) {
                break;
              }
              this.controller.runJavaScript({
                script: "getTitle()", callback: (res) => {
                  console.info("getTitle1==>" + res);
                  Utils.emitEvent(res, 200240);
                }
              })
              break;
            }
            case "emitOnRefreshAccessedHistory": {
              this.isPageEnd = -1;
              this.controller.loadUrl({ url: "resource://rawfile/second.html" });
              let realVal = await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              if (realVal !== 1) {
                break;
              }
              Utils.emitEvent(this.newUrl, 200250);
              break;
            }
            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .userAgent("Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36")
        .onUrlLoadIntercept((event) => {
          console.info("onUrlLoadIntercept==>" + event?.data);
          loadedUrl = String(event?.data);
          return false;
        })
        .onRefreshAccessedHistory((event) => {
          console.info("onRefreshAccessedHistory==>");
          this.newUrl = event.url;
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}