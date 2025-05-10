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
struct webViewContPageAndprepareForPageLoadErrorTwo {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  ports: web_webview.WebMessagePort[];
  msgPort: web_webview.WebMessagePort[] = null;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State zoomAccess: boolean = false;
  @State str: string = "emitPostMessageInitErr";
  @State errorCode: string = '0';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewContPageAndprepareForPageLoadErrorTwo page valueChangeCallBack");
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
    // let abilityDelegator: any
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    // let abilityDelegatorArguments: any
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("messageEventErrorTest").key('webViewContPageAndprepareForPageLoadErrorTwo').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitPrefetchPageErr": {
              try {
                this.controller.prefetchPage('华为');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                console.info("123+++321" + this.errorCode)
                Utils.emitEvent(this.errorCode, 903)
              }
              break;
            }

            case "emitPrepareForPageLoadErr": {
              try {
                web_webview.WebviewController.prepareForPageLoad("华为", true, 6);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                console.info("456+++654" + this.errorCode)
                Utils.emitEvent(this.errorCode, 904)
              }
              break;
            }

            case "emitPrepareForPageLoadErrTwo": {
              try {
                web_webview.WebviewController.prepareForPageLoad("huawei", true, 7);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                console.info("4566+++6546" + this.errorCode)
                Utils.emitEvent(this.errorCode, 905)
              }
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .zoomAccess(this.zoomAccess)
    }
  }
}