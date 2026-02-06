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

import {inputMethod} from '@kit.IMEKit';
import { Driver, ON } from '@kit.TestKit';

const nativeHeight = "5%";
const webInitHight = '90%';

const EVENT_ID_SET_SUITE_KEY = 178001;
const driver = Driver.create();

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
  @State isPageEnd: number = -1;


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
        Button("WebController click").key('WebGestureFocusModeButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "testWebGestureFocusMode001": {
              try {
                this.flagType = 'webClick'
                //点击textInput
                let buttonOne = await driver.findComponent(ON.text('textInput'));
                await buttonOne.click()
                let buttonTwo = await driver.findComponent(ON.id('KeyHideKbd'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  this.inputMethodController.hideTextInput()
                }
                let buttonThree = await driver.findComponent(ON.id('WebViewGestureFocusMode'));
                //再点击web 抢焦点
                await buttonThree.click()
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "testWebGestureFocusMode002": {
              try {
                this.flagType = 'webLongClick'
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('textInput'));
                await buttonOne.click()
                let buttonTwo = await driver.findComponent(ON.id('KeyHideKbd'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  this.inputMethodController.hideTextInput()
                }
                let buttonThree = await driver.findComponent(ON.id('WebViewGestureFocusMode'));
                //再长按web 抢焦点
                await buttonThree.longClick()
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testWebGestureFocusMode003": {
              try {
                this.flagType = 'webPinchOut'
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                //先点击textInput
                let buttonOne = await driver.findComponent(ON.text('textInput'));
                await buttonOne.click()
                let buttonTwo = await driver.findComponent(ON.id('KeyHideKbd'));
                if (buttonTwo) {
                  await buttonTwo.click()
                } else {
                  await this.inputMethodController.hideTextInput()
                }
                let HtmlOne = await driver.findComponent(ON.id('WebViewGestureFocusMode'));
                //再缩放web 抢焦点
                await HtmlOne.pinchOut(1.5);
                this.isWebFocus = await HtmlOne.isFocused();
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
        .onFocus(() => {
          this.TextInputborderColor1 = Color.Red;
        })
        .onBlur(() => {
          this.TextInputborderColor1 = Color.Pink;
        })
      Scroll() {

        Column() {
          Web({ src: this.url, controller: this.controller })
            .key('WebViewGestureFocusMode')
            .gestureFocusMode(GestureFocusMode.DEFAULT)
            .javaScriptAccess(true)
            .height(this.webHeight)
            .borderWidth(2)
            .borderColor(this.webborderColor1)
            .onFocus(async () => {
              this.webborderColor1 = Color.Red;
              if(this.flagType == 'webClick') {
                console.log('pbbbtttttWebClick' + this.flagType + '55' )
                //点击
                Utils.emitEvent(true, 178010)
              } else if(this.flagType == 'webLongClick'){
                //长按
                Utils.emitEvent(true, 178020)
              } else if (this.flagType == 'webPinchOut') {
                //放大
                await Utils.waitForExist(()=>this.isWebFocus, this.str+' isWebFocus', true, 1000);
                Utils.emitEvent(true, 178030)
              } else if(this.flagType == 'webOnscroll' ) {
                Utils.emitEvent(true, 178040)
              }
            })
            .onBlur(() => {
              this.webborderColor1 = Color.Pink;
            })
            .onPageEnd((event) => {
              console.log('onPageEnd url:' + event.url);
              this.isPageEnd = 1;
            })
        }
      }
    }
  }
}