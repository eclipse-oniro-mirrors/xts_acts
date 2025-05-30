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

import web_webview from '@ohos.web.webview';
import prompt from '@ohos.promptAction';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';


@Entry
@Component
struct getLastHitTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State url: string = ''
  @State sm: number = 0
  @State sm2: string = '黑盒'
  @State shouldShowVirtualKeyboard: boolean=false;
  @State str: string = "getLastHitTest001";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("getLastHitTest page valueChangeCallBack");
    if (eventData != null) {
      console.info("getLastHitTest:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }



  build() {
    Column() {
      Row() {
        Button("web click").key('webGetLastHitTest').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "getLastHitTest001": {
              try {
                let driver = Driver.create();
                let component = await driver.findComponent(ON.text('www.example.com'));
                await component.click();
                await Utils.sleep(1000);

                Utils.emitEvent(this.sm == 2 && this.sm2 == 'https://www.example.com/' , 20250313)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Row() {
        Text('' + this.sm).fontWeight(FontWeight.Bold)
      }
      Row() {
        Text('' + this.sm2).fontWeight(FontWeight.Bold)
      }


        Web({ src: $rawfile('getLastHitTest.html'), controller: this.controller })
          .height("75%")
          .domStorageAccess(true)
          .onInterceptKeyboardAttach(()=>{return {
            useSystemKeyboard: this.shouldShowVirtualKeyboard,
          }})
          .onLoadIntercept((event) => {
            try {
              let tmp = this.controller.getLastHitTest()
              this.sm =  tmp.type;
              this.sm2 = tmp.extra;
              console.log('888888type' + this.sm2)

              prompt.showToast({ message: "hitTestType: " + tmp.type + "\nextra: " + tmp.extra })
            } catch (e) {
              console.log(e.toString())
            }
            if (event.data.getRequestUrl().match("resource")) {
              return false
            } else {
              return true;
            }
          })


    }.width('100%').height('100%')

  }


}