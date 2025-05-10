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

@Entry
@Component
struct ScreenCapture {
  @State str: string = ""
  @State text: string = ''
  controller: webView.WebviewController = new webView.WebviewController();

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
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
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
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitScreenCaptureConfigDeny001": {
              this.text = 'deny'
              this.controller.loadUrl("resource://rawfile/screenCaptureTest.html");
              await Utils.sleep(2000);
              this.controller.runJavaScript('getScreenStream()')
              await Utils.sleep(2000);
              let driver: Driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('允许'));
              await buttonOne.click()
              await Utils.sleep(2000);
              break;
            }
            case "emitScreenCaptureConfigGetOrigin001": {
              this.text = 'getOrigin'
              this.controller.loadUrl("resource://rawfile/screenCaptureTest.html");
              await Utils.sleep(2000);
              this.controller.runJavaScript('getScreenStream()')
              await Utils.sleep(2000);
              let driver: Driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('允许'));
              await buttonOne.click()
              await Utils.sleep(2000);
              break;
            }
            case "emitScreenCaptureConfigGrant001": {
              this.text = 'grant'
              this.controller.loadUrl("resource://rawfile/screenCaptureTest.html");
              await Utils.sleep(2000);
              this.controller.runJavaScript('getScreenStream()')
              await Utils.sleep(2000);
              let driver: Driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('允许'));
              await buttonOne.click()
              await Utils.sleep(2000);
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
                break
              }
              case 'getOrigin': {
                event.handler.getOrigin()
                break
              }
              case 'grant': {
                event.handler.grant({ captureMode: WebCaptureMode.HOME_SCREEN })
                break
              }
            }
            await Utils.sleep(2000);
            this.controller.runJavaScript('getResult()', async (error, result) => {
              console.log('result == > ' + result + ' ' + error)
              if (result == '"deny"') {
                Utils.emitEvent(true, 4201)
              }
              if (result == '""') {
                Utils.emitEvent(true, 4202)
              }
              if (result == '"grant"') {
                Utils.emitEvent(true, 4203)
              }
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/indexJru.html");
            })
          }
        })
    }
  }
}
