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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import { Driver, ON, UiDirection, BY, UiDriver } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import {inputMethod} from '@kit.IMEKit';
import { waitForExist} from '../../test/WaitTest.test';
const EVENT_ID_SET_SUITE_KEY = 178208;
const driver = Driver.create();
@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "";
  @State blurMode:BlurOnKeyboardHideMode = BlurOnKeyboardHideMode.SILENT;
  @State userAgentPC:string = "";
  inputMethodController = inputMethod.getController()
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isOnConsoleEnd: number = -1;

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
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {

      Row() {
        Button("web test").key('setSoftKeyboardBehaviorModeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitSetSoftKeyboardBehaviorMode01": {
                  this.userAgentPC = this.controller.getUserAgent();
                  if ((this.userAgentPC).includes("PC")) {
                    Utils.emitEvent(true, 20251115)
                    break;
                  }
                  this.controller.onActive();
                  this.controller.setSoftKeyboardBehaviorMode(web_webview.WebSoftKeyboardBehaviorMode.DISABLE_AUTO_KEYBOARD_ON_ACTIVE);
                  let buttonOne = await driver.findComponent(ON.text('textContent'));
                  console.log('buttonOne11' + buttonOne)
                  this.isOnConsoleEnd = -1
                  await buttonOne.click();
                  await Utils.waitForExist(()=>this.isOnConsoleEnd, this.str+' isOnConsoleEnd', 1, 1000);
                  this.controller.onInactive();
                  let buttonTwo = await driver.findComponent(ON.id('KeyHideKbd'));
                  console.log('buttonTwo22' + buttonTwo)
                 // DISABLE_AUTO_KEYBOARD_ON_ACTIVE时,不会有软键盘的自动隐藏和啦气的表现
                  if (buttonTwo) {
                    Utils.emitEvent(true, 20251115)
                  } else {
                    Utils.emitEvent(false, 20251115)
                  }
                  break;
              }
            case "emitSetSoftKeyboardBehaviorMode02": {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 20251116)
                  break;
                }
                this.controller.loadUrl('resource://rawfile/SetSoftKeyboardBehaviorMode.html');
                await Utils.waitForExist(()=>this.isOnConsoleEnd, this.str+' isOnConsoleEnd', 1, 1000);
                this.controller.onActive();
                this.controller.setSoftKeyboardBehaviorMode(web_webview.WebSoftKeyboardBehaviorMode.DEFAULT);
                let buttonOne = await driver.findComponent(ON.text('textContent'));
                this.isOnConsoleEnd = -1
                await buttonOne.click();
                await Utils.waitForExist(()=>this.isOnConsoleEnd, this.str+' isOnConsoleEnd', 1, 1000);
                this.controller.onInactive();
                // defualt时,还会有软键盘的自动隐藏和啦气的表现
                let buttonTwo = await driver.findComponent(ON.id('KeyHideKbd'));
                if (!buttonTwo) {
                  Utils.emitEvent(true, 20251116)
                } else {
                  Utils.emitEvent(false, 20251116)
                }
                break;
                }
            }
        })
      }
          Web({ src: $rawfile('SetSoftKeyboardBehaviorMode.html'), controller: this.controller })
            .height("80%")
            .onConsole((event) => {
               this.isOnConsoleEnd = 1;
               return false;
            })
            .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}