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
const EVENT_ID_SET_SUITE_KEY = 178209;
const driver = Driver.create();
@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "";
  @State text:string = ''
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
        Button("web test").key('webKeyBoardAvoidModeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitWebKeyBoardAvoidMode01": {
                  this.userAgentPC = this.controller.getUserAgent();
                  if ((this.userAgentPC).includes("PC")) {
                    Utils.emitEvent(true, 20251211)
                    break;
                  }
                  this.controller.onActive();

                  let buttonOne = await driver.findComponent(ON.text('input'));
                  this.isOnConsoleEnd = -1
                  await buttonOne.click();
                  await Utils.waitForExist(()=>this.isOnConsoleEnd, this.str+' isOnConsoleEnd', 1, 1000);
                  if (this.text == 'focus') {
                    Utils.emitEvent(true, 20251211)
                  } else {
                    Utils.emitEvent(false, 20251211)
                  }
                  break;
              }
          }
        })
      }


         Web({ src: $rawfile('Index1.html'), controller: this.controller })
            .keyboardAvoidMode(WebKeyboardAvoidMode.RETURN_TO_UICONTEXT)
            .height("80%")
            .onConsole((event) => {
              if (event) {
                console.log('getMessage:' + event.message.getMessage());
                this.text = event.message.getMessage()
              }
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