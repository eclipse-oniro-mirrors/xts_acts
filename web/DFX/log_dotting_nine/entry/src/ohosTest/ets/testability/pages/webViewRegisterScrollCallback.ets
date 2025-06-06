/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import testNapi from 'libentry.so';
import events_emitter from '@ohos.events.emitter';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';

@Entry
@Component
struct testWebResponseSetErrorFailParamIsString {
  @State str: string = ''
  webTag: string = 'ArkWeb1';
  @State isRegister:number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController(this.webTag);


  aboutToAppear() {
    web_webview.WebviewController.initializeWebEngine();
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Button('RegisterScrollCallback')
        .key('RegisterScrollCallbackButton')
        .onClick(async () => {
          console.log('key==')
          switch (this.str) {
            case 'testRegisterScrollCallbackString': {
              console.log('ppbbRegister' + this.isRegister)
              try {
                this.isRegister = testNapi.nativeWebInit(this.webTag);
                Utils.emitEvent(this.isRegister, 20250421);
                console.log('Pbbregister' + this.isRegister)
              } catch (error) {
                console.error(`testRegisterScrollCallbackString ErrorCode: ${error.code},  Message: ${error.message}`);
                console.log('3333pbb' + testNapi.nativeWebInit(this.webTag))
              }
              break;
            }
          }
        })
      Web({ src: "https://www.baidu.com", controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .borderRadius(10)
    }
  }
}