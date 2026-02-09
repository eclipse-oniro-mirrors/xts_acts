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
import { waitForExist } from '../../test/WaitTest.test';
import Utils from '../../test/Utils';
import business_error from '@ohos.base';

@Entry
@Component
struct Index {
  controller: WebController = new WebController();
  @State str: string = 'emitJavaScriptProxy';
  @State console: string = '';
  @State javaScriptAccess: boolean = true;
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 171250,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(171250)
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
      Utils.emitEvent(res, 171260);
    },
    toString: (str: ESObject) => {
      console.info('ets toString:' + String(str));
    },
    register: (res: ESObject) => {
      Utils.emitEvent(res, 86);
      return 'web222';
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
        Button('web click').key('webcomponent').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitJavaScriptProxy': {
              this.controller.runJavaScript({ script: 'test()' });
              break;
            }
            case 'emitRunJavaScript': {
              this.isPageEnd = -1;
              this.controller.loadUrl({ url: 'resource://rawfile/index.html' });
              await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScript({
                  script: 'testRunJavaScript()', callback: (res) => {
                    Utils.emitEvent(res, 171270);
                  }
                })
              break;
            }
            case 'emitOnConsole': {
              this.controller.runJavaScript({ script: 'consoleTest()' });
              await waitForExist(() => this.console, this.str, "console test");
                Utils.emitEvent(this.console, 171280);
              break;
            }
            case 'emitJavaScriptAccess': {
              this.javaScriptAccess = false;
                this.controller.runJavaScript({ script: 'jsAccess()' });
                  if (this.console !== 'web111') {
                    let javaScriptAccessCalled = true;
                    Utils.emitEvent(javaScriptAccessCalled, 171290);
                  }
              break;
            }
            case 'testRunJavaScript001': {
              try {
                this.javaScriptAccess = true;
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: 'resource://rawfile/webPart1index.html' });
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScript({ script: 'testRunJavaScript()', callback: (res) => {
                  Utils.emitEvent(String(res), 171300)
                } })
              }
              catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171300)
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
        .javaScriptProxy({
          object: this.jsObj,
          name: 'backToEts',
          methodList: ['test', 'toString'],
          controller: this.controller
        })
        .onConsole((event) => {
          this.console = event.message.getMessage();
          let level = event.message.getMessageLevel();
          let msg = event.message.getMessage();
          console.log('html==>' + msg);
          return false;
        })
        .onPageBegin((event) => {
          console.log('onPageBegin ==>' + event.url);
        })
        .onPageEnd((event) => {
          this.isPageEnd = 0;
          console.log('onPageEnd ==>' + event.url);
        })
    }
  }
}
