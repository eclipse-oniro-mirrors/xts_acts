/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "blurMode01";
  @State blurMode:BlurOnKeyboardHideMode = BlurOnKeyboardHideMode.SILENT;
  @State text:string = ''
  @State userAgentPC:string = "";
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }
  build() {
    Column() {

      Row() {
        Button("web test").key('blurOnKeyboardHideMode01').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "blurMode01": {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(true, 20241133)
                break;
              }

              let driver = Driver.create();
              await Utils.sleep(1000);
              let buttonOne = await driver.findComponent(ON.text('input'));
              await buttonOne.click()
              await Utils.sleep(2000);
              let buttonTwo = await driver.findComponent(ON.id('KeyHideKbd'));
              if(buttonTwo) {
                await buttonTwo.click()
              } else {
                await driver.click(671,701);
              }
               await Utils.sleep(1000);
               if(this.text == 'focus') {
                 Utils.emitEvent(true, 20241133)
               }
              break;
            }

            case "blurMode02": {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(true, 20241134)
                break;
              }
              let driver = Driver.create();
              await Utils.sleep(1000);
              this.blurMode = BlurOnKeyboardHideMode.BLUR;


              let buttonOne = await driver.findComponent(ON.text('input'));
              await buttonOne.click()
              await Utils.sleep(2000);
              let buttonTwo = await driver.findComponent(ON.id('KeyHideKbd'));
              if(buttonTwo) {
                await buttonTwo.click()
              } else {
                await driver.click(671,701);
              }
              await Utils.sleep(1000);
              if(this.text == 'blur') {
                Utils.emitEvent(true, 20241134)
              }
              break;
            }
          }
        })
      }
      Text("" + this.text);

      Web({ src: $rawfile("blurMode.html"), controller: this.controller })
        .javaScriptAccess(true)
        .blurOnKeyboardHideMode(this.blurMode)
        .height("80%")
        .onConsole((event) => {
          if (event) {
            console.log('getMessage:' + event.message.getMessage());
            this.text = event.message.getMessage()
          }
          return false;
        })
        // .key('blurOnKeyboardHideModeWeb')

    }
  }
}