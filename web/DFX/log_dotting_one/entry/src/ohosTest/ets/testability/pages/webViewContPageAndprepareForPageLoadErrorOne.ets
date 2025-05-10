/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import UIAbility from '@ohos.app.ability.UIAbility';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct webViewContPageAndprepareForPageLoadErrorOne {
  controller20: web_webview.WebviewController = new web_webview.WebviewController();
  ports: web_webview.WebMessagePort[];
  msgPort: web_webview.WebMessagePort[] = null;
  @State str: string = "emitPrefetchPageErr";
  @State errorCode: string = '0';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewContPageAndprepareForPageLoadErrorOne page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  // private jsObj = {
  //   test: (res) => {
  //     Utils.emitEvent(res, 102);
  //   },
  //   toString: (str) => {
  //     console.info("ets toString:" + String(str));
  //   },
  //   register: (res) => {
  //     Utils.emitEvent(res, 86);
  //     return "web222"
  //   }
  // }

  private jsObj: ESObject = {
    test: (res: ESObject) => {
      Utils.emitEvent(res, 102);
    },
    toString: (str: ESObject) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: ESObject) => {
      Utils.emitEvent(res, 86);
      return "web222";
    }
  }


  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    // abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    // abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("messageEventErrorTest").key('webViewContPageAndprepareForPageLoadErrorOne').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitPrefetchPageErr": {
              try {
                this.controller20.prefetchPage('百度');
                console.info("---666---444---8888")
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                console.info("789+++987" + this.errorCode)
                Utils.emitEvent(this.errorCode, 900)
              }
              break;
            }
          }
        })
      }
    }
  }
}