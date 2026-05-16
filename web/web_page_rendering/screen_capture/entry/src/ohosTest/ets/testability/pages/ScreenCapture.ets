/*
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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON, On } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { BusinessError } from '@kit.BasicServicesKit';

let driver: Driver = Driver.create();
@Entry
@Component
struct ScreenCapture {
  @State str: string = ""
  @State text: string = ''
  controller: webView.WebviewController = new webView.WebviewController();
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isRunJSEnd: number = -1;
  @State isGrantEnd: number = -1;
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 152500,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(152500)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1
      }
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
        Button("ScreenCapture").key('ScreenCaptureConfig').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitScreenCaptureConfigDeny001": {
              this.text = 'deny'
              this.isPageEnd = -1
              this.controller.loadUrl("resource://rawfile/screenCaptureTest.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isRunJSEnd = -1
              this.controller.runJavaScript('getScreenStream()').then((result) => {
                console.log('wait for JS end, result: ' + result)
                this.isRunJSEnd = 1
                this.isGrantEnd = -1
              }).catch((error: BusinessError) => {
                console.error("error: " + error);
              })
              await Utils.waitForExist(()=>this.isRunJSEnd, this.str+' isRunJSEnd', 1, 1000);
              break;
            }
            case "emitScreenCaptureConfigGetOrigin001": {
              this.text = 'getOrigin'
              this.isPageEnd = -1
              this.controller.loadUrl("resource://rawfile/screenCaptureTest.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isRunJSEnd = -1
              this.isGrantEnd = -1
              this.controller.runJavaScript('getScreenStream()').then((result) => {
                console.log('wait for JS end, result: ' + result)
                this.isRunJSEnd = 1
              }).catch((error: BusinessError) => {
                console.error("error: " + error);
              })
              await Utils.waitForExist(()=>this.isRunJSEnd, this.str+' isRunJSEnd', 1, 1000);
              break;
            }
            case "emitScreenCaptureConfigGrant001": {
              this.text = 'grant'
              this.isPageEnd = -1
              this.controller.loadUrl("resource://rawfile/screenCaptureTest.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isRunJSEnd = -1
              this.isGrantEnd = -1
              this.controller.runJavaScript('getScreenStream()').then((result) => {
                console.log('wait for JS end, result: ' + result)
                this.isRunJSEnd = 1
              }).catch((error: BusinessError) => {
                console.error("error: " + error);
              })
              await Utils.waitForExist(()=>this.isRunJSEnd, this.str+' isRunJSEnd', 1, 1000);
              let buttonOne = await driver.waitForComponent(ON.text('允许'),10000)
              this.isGrantEnd = 1
              await buttonOne.click()
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .onScreenCaptureRequest(async (event) => {
          console.log("event : >>>" + event)
          if (event) {
            switch (this.text) {
              case 'deny': {
                event.handler.deny()
                this.isGrantEnd = 1
                break
              }
              case 'getOrigin': {
                event.handler.getOrigin()
                this.isGrantEnd = 1
                break
              }
              case 'grant': {
                event.handler.grant({ captureMode: WebCaptureMode.HOME_SCREEN })
                break
              }
            }
            await Utils.waitForExist(()=>this.isGrantEnd, this.str+' isGrantEnd', 1, 1000);
            this.controller.runJavaScript('getResult()', async (error, result) => {
              console.log('result == > ' + result + ' ' + error)
              if (result == '"deny"') {
                Utils.emitEvent(true, 152510)
              }
              if (result == '""') {
                Utils.emitEvent(true, 152520)
              }
              if (result == '"grant"') {
                Utils.emitEvent(true, 152530)
              }
              this.isPageEnd = -1
              this.controller.loadUrl("resource://rawfile/indexJru.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
            })
          }
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
