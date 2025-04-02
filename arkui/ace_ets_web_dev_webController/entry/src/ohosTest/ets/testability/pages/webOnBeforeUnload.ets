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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';

@Entry
@Component
struct webOnBeforeUnload {
  controller: WebController = new WebController();
  @State str: string = "emitOnBeforeUnloadWebC";
  @State firstId: number = 402;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnBeforeUnload page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  private jsObj: ESObject = {
    test: (res: ESObject) => {
      Utils.emitEvent(res, 102);
    },
    toString: (str: ESObject) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: ESObject) => {
      Utils.emitEvent(res, 86);
      return "web222"
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webOnBeforeUnload').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnBeforeUnloadWebC": {
              try {
                this.controller.refresh();
                await Utils.sleep(1000);
                console.log("action of emitOnBeforeUnload is refresh");
                this.controller.runJavaScript({
                  script: "myRefresh()", callback: (result) => {
                    console.log(`The myRefresh() return value is: ${result}`);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnBeforeUnloadAgainWebC": {
              try {
                this.firstId = 404;
                this.controller.requestFocus();
                await Utils.sleep(1000);
                console.log("action of emitOnBeforeUnloadAgain is loadUrl new");
                this.controller.runJavaScript({
                  script: "myNewPage()", callback: (result) => {
                    console.log(`The myNewPage() return value is: ${result}`);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('onBeforeUnloadTest.html'), controller: this.controller })
        .key("TestwebOnBeforeUnload")
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onBeforeUnload((event) => {
          console.log("event.url:" + event.url)
          console.log("event.message:" + event.message)
          Utils.emitEvent(event.message, this.firstId)
          console.log("event.result.handleCancel: " + event.result.handleCancel());
          console.log("event.result.handleConfirm: " + event.result.handleConfirm());
          return true
        })
    }
  }
}