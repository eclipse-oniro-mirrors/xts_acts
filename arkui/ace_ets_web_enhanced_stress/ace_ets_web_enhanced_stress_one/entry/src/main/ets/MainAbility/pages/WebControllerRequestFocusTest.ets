/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebControllerRequestFocusTest {
  controller: WebController = new WebController();
  @State str: string = "";
  @State callBackId: number = 0;
  @State stressTimes: number = 0;
  @State successTimes: number = 0;
  @State buttonKey: string = '';
  @State requestFocus: boolean = false

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
      }
    })
  }

  onPageHide() {
    Utils.unRegisterEventPage()
  }

  build() {
    Row() {
      Column() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case 'testWebControllerRequestFocus001': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl({ url: $rawfile('second.html') });
                    await Utils.sleep(100)
                    sendEventByKey('textInput', 10, '')
                    Utils.stressingLog('WebController.requestFocus()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
            }
          })

        TextInput({ placeholder: "inputs your words" })
          .key('textInput')
          .type(InputType.Normal)
          .placeholderColor(Color.Blue)
          .placeholderFont({ size: 20, weight: FontWeight.Normal, family: "sans-serif", style: FontStyle.Normal })
          .enterKeyType(EnterKeyType.Next)
          .caretColor(Color.Green)
          .height(60)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontFamily("cursive")
          .fontStyle(FontStyle.Italic)
          .fontColor(Color.Red)
          .maxLength(20)
          .border({ width: 1, color: 0x317AF7, radius: 10, style: BorderStyle.Solid })
          .onClick(() => {
            console.info("TextInput click")
          })

        Web({ src: $rawfile('webPart1index.html'), controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onBlur(() => {
            console.info("onBlur==>")
            this.controller.requestFocus()
          })
          .onFocus(() => {
            this.requestFocus = true
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}