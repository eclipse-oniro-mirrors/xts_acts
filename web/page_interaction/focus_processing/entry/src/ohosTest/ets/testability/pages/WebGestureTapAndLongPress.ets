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
import business_error from '@ohos.base';
import prompt from '@ohos.promptAction';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import { waitForExist} from '../../test/WaitTest.test';
import { Driver, ON, MouseButton} from '@ohos.UiTest';
import {inputMethod} from '@kit.IMEKit';

const nativeHeight = "5%";
const webInitHight = '90%';

@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  url_input: ResourceStr = $rawfile('inputmode.html')
  @State url: ResourceStr = this.url_input;
  @State currentUrl: string = "textInput";
  @State isWebFocus: boolean = false;
  @State webborderColor1: Color = Color.Black;
  @State TextInputborderColor1: Color = Color.Blue;
  @State flagType:string = ''
  @State str: string = ""
  @State isReceive: number = -1;
  @State webHeight: string = webInitHight;
  inputMethodController = inputMethod.getController()


  aboutToAppear(): void {
    try {
      web_webview.WebviewController.setWebDebuggingAccess(true);
    } catch (error) {
      let e: business_error.BusinessError = error as business_error.BusinessError;
      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
    }
  }

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
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {

      Row() {
        Button("WebController click").key('WebWebViewWebGestureTapAndLongPressButton').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(()=>this.isReceive, this.str, 0);
          switch (this.str) {
            case "testWebGestureTapAndLongPress001": {
              try {
                this.flagType = 'webGestureTapClick'
                let driver = Driver.create();
                await Utils.sleep(2000);
                //点击textInput
                let buttonOne = await driver.findComponent(ON.text('textInput'));
                await buttonOne.click()
                await Utils.sleep(2000);
                let buttonTwo = await driver.findComponent(ON.id('WebViewWebGestureTapButton'));
                //再点击web 抢焦点
                await buttonTwo.click()
                await Utils.sleep(5000);

              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "testWebGestureTapAndLongPress002": {
              try {
                this.flagType = 'webGestureTapLongPress'
                this.controller.refresh();
                let driver = Driver.create();
                await Utils.sleep(2000);
                let buttonOne = await driver.findComponent(ON.text('textInput'));
                await buttonOne.click()
                await Utils.sleep(2000);
                let buttonTwo = await driver.findComponent(ON.id('WebViewWebGestureTapButton'));
                //再长按web 抢焦点
                await buttonTwo.longClick()
                await Utils.sleep(5000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      TextInput({ text: this.currentUrl })
        .backgroundColor(this.TextInputborderColor1)
        // .height(nativeHeight)
        .onFocus(() => {
          this.TextInputborderColor1 = Color.Red;
        })
        .onBlur(() => {
          this.TextInputborderColor1 = Color.Pink;
        })
      Scroll() {

        Column() {
          Web({ src: this.url, controller: this.controller })
            .key('WebViewWebGestureTapButton')
            .gestureFocusMode(GestureFocusMode.GESTURE_TAP_AND_LONG_PRESS)
            .javaScriptAccess(true)
            .height(this.webHeight)
            .borderWidth(2)
            .borderColor(this.webborderColor1)
            .onFocus(() => {
              this.webborderColor1 = Color.Red;
              console.log('gestureFocusMode' + this.flagType);
              if(this.flagType == 'webGestureTapClick') {
                console.log('pbbbttwebGestureTapClick' + this.flagType + '55' )
                //点击
                Utils.emitEvent(true, 20250726)
              } else if(this.flagType == 'webGestureTapLongPress'){
                //长按
                console.log('pbbbttwebGestureTapLongPress' + this.flagType + '66' )
                Utils.emitEvent(true, 20250727)
              }
            })
            .onBlur(() => {
              this.webborderColor1 = Color.Pink;
            })
        }
      }
    }
  }
}