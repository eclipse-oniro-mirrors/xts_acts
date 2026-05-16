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
import { waitForExist} from '../../test/WaitTest.test';
import { webview } from '@kit.ArkWeb';
import { inputMethod } from '@kit.IMEKit';
const EVENT_ID_SET_SUITE_KEY = 178219;
const driver = Driver.create();
@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = "";
  @State text:string = ''
  @State userAgentPC:string = "";
  inputMethodController = inputMethod.getController()
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isOnConsoleEnd: number = -1;
  @State flag:number = 1;

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
        Button("web test").key('WebOnInputMethodAttachedButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnInputMethodAttached01": {
              this.flag = 1;
              let RedoButton = await driver.findComponent(ON.id("InputmethodAttachedButton"));
              await RedoButton.click();
              await driver.triggerKey(2001);
              await Utils.sleep(1000);
              let buttonOne = await driver.findComponent(ON.text('提交'));
              await  buttonOne.click()
              break;
              }
            case "emitOnInputMethodAttached02": {
              this.flag = 2;
              let RedoButton = await driver.findComponent(ON.id("InputmethodAttachedButton"));
              await RedoButton.click();
              await driver.triggerKey(2002);
              await Utils.sleep(1000);
              let buttonOne = await driver.findComponent(ON.text('提交'));
              await  buttonOne.click()
              break;
            }
          }
        })
      }


      Web({ src: $rawfile('example.html'), controller: this.controller }).key('InputmethodAttachedButton')
        .onInputmethodAttached(() => {
          console.log('inputmethod attached');
          inputMethod.getController().showTextInput();
          if(this.flag == 1) {
            Utils.emitEvent(true, 20250418)
          } else if(this.flag == 2) {
            Utils.emitEvent(true, 20250419)
          }

        })
            .onPageEnd((event) => {
              console.log('onPageEnd url:' + event.url);
               this.isPageEnd = 1;
        })

    }
  }
}