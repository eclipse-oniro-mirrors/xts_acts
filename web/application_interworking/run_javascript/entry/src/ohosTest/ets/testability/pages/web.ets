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

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
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
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitJavaScriptProxy': {
              await waitForExist(()=>this.isComplete, 'emitJavaScriptProxy', 0, 1000)
              this.isComplete = -1
              this.controller.runJavaScript({ script: 'test()' });
              break;
            }
            case 'emitRunJavaScript': {
              this.controller.loadUrl({ url: 'resource://rawfile/index.html' });
              setTimeout(() => {
                this.controller.runJavaScript({
                  script: 'testRunJavaScript()', callback: (res) => {
                    Utils.emitEvent(res, 112);
                  }
                })
              }, 3000)
              break;
            }
            case 'emitOnConsole': {
              this.controller.runJavaScript({ script: 'consoleTest()' });
              setTimeout(() => {
                Utils.emitEvent(this.console, 62);
              }, 3000);
              break;
            }
            case 'emitJavaScriptAccess': {
              this.javaScriptAccess = false;
              setTimeout(() => {
                this.controller.runJavaScript({ script: 'jsAccess()' });
                setTimeout(() => {
                  if (this.console !== 'web111') {
                    let javaScriptAccessCalled = true;
                    Utils.emitEvent(javaScriptAccessCalled, 88);
                  }
                }, 3000);
              }, 3000);
              break;
            }
            case 'testRunJavaScript001': {
              try {
                this.javaScriptAccess = true;
                await Utils.sleep(2000);
                this.controller.loadUrl({ url: 'resource://rawfile/webPart1index.html' });
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: 'testRunJavaScript()', callback: (res) => {
                  Utils.emitEvent(String(res), 31004)
                } })
              }
              catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 31004)
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
          console.log('onPageEnd ==>' + event.url);
          this.isComplete = 0
        })
    }
  }
}
