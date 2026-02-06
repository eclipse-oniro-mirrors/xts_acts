/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct Index {
  controller: WebController = new WebController();
  @State str: string = "emitRegisterJavaScriptProxy";
  @State console: string = "";
  @State javaScriptAccess: boolean = true;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172240,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(172240);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }
  private jsObj: ESObject = {
    test: (res: ESObject) => {
      Utils.emitEvent(res, 102);
    },
    toString: (str: ESObject) => {
      console.info('ets toString:' + String(str));
    },
    register: (res: ESObject) => {
      Utils.emitEvent(res, 172250);
      return "web222";
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
          console.info('key==>' + this.str);
          switch (this.str) {
            case "emitRegisterJavaScriptProxy": {
              this.controller.registerJavaScriptProxy({
                object: this.jsObj,
                name: "objName",
                methodList: ["test", "toString", "register"]
              });
              this.isPageEnd = -1;
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScript({ script: "proxy()" });

              break;
            }
            case "emitDeleteJavaScriptRegister": {
              this.controller.deleteJavaScriptRegister("objName");
              this.controller.runJavaScript({ script: "registerTest()" });
              await waitForExist(() => this.console,"jsResult",null);
              const result = await waitForExist(
                () => this.console !== "web222" ? "ready" : null,
                this.str,
                "ready"
              );
              if (result === "ready") {
                  let deleteEntireCookieCalled = true;
                  Utils.emitEvent(deleteEntireCookieCalled, 172260);
                }
              break;
            }
            default:
              console.info('can not match case');
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('web onPageEnd url:' + event.url);
          }
        })
    }
  }
}