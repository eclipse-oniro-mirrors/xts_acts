/**
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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { Driver } from '@ohos.UiTest';

const EVENT_ID_SET_SUITE_KEY = 181100;
const driver = Driver.create();

@Entry
@Component
struct WebZoomAccessTestPage {
  controller: webView.WebviewController = new webView.WebviewController();
  @State testAction: string = "";
  @State zoomAccess: boolean = false;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State oldScale: number = 0;
  @State newScale: number = 0;
  @State compareScale: number = 0;
  @State isPageEnd: number = -1;
  @State isReceived: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.once(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("WebZoomAccessTestPage valueChangeCallBack: " + JSON.stringify(eventData));
    if (eventData != null && eventData.data != null && eventData.data.ACTION != null) {
      this.testAction = eventData.data.ACTION;
      this.isReceived = 1;
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("WebZoomAccessTestButton").key('WebZoomAccessTestButton').onClick(async () => {
          console.info("WebZoomAccessTestButton clicked, action: " + this.testAction);
          await Utils.waitForExist(() => this.isReceived, this.testAction + ' isReceived', 1, 2000);
          await Utils.waitForExist(() => this.isPageEnd, this.testAction + ' isPageEnd', 1, 2000);

          switch (this.testAction) {
            case "testWebZoomAccessFalse": {
              await this.testZoomAccessFalse();
              break;
            }
            case "testWebZoomAccessTrue": {
              await this.testZoomAccessTrue();
              break;
            }
            case "testWebZoomAccessZoomIn": {
              await this.testZoomAccessZoomIn();
              break;
            }
            case "testWebZoomAccessZoomOut": {
              await this.testZoomAccessZoomOut();
              break;
            }
            case "testWebZoomAccessToggle": {
              await this.testZoomAccessToggle();
              break;
            }
            default: {
              console.error("Unknown test action: " + this.testAction);
              Utils.emitEvent("unknown_action", 181199);
            }
          }
        })
      }

      Web({ src: $rawfile('zoom.html'), controller: this.controller })
        .width('80%')
        .height('70%')
        .key('WebZoomAccessTestWebView')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .zoomAccess(this.zoomAccess)
        .onScaleChange((event) => {
          console.log('onScaleChange - oldScale: ' + event.oldScale + ', newScale: ' + event.newScale);
          this.oldScale = event.oldScale;
          this.newScale = event.newScale;
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url: ' + event.url);
          this.isPageEnd = 1;
        })
    }
  }

  private async testZoomAccessFalse() {
    try {
      this.isPageEnd = -1;
      this.zoomAccess = false;
      this.oldScale = 0;
      this.newScale = 0;
      this.controller.loadUrl($rawfile('zoom.html'));
      await Utils.waitForExist(() => this.isPageEnd, 'testWebZoomAccessFalse isPageEnd', 1, 2000);
      await Utils.waitForReleaseDriver('testWebZoomAccessFalse', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      await Utils.waitForReleaseDriver('testWebZoomAccessFalse', driver);
      Utils.emitEvent((this.oldScale === 0 && this.newScale === 0), 181101);
    } catch (error) {
      console.error('testZoomAccessFalse error: ' + JSON.stringify(error));
      Utils.emitEvent(false, 181101);
    }
  }

  private async testZoomAccessTrue() {
    try {
      this.isPageEnd = -1;
      this.zoomAccess = true;
      this.oldScale = 0;
      this.newScale = 0;
      this.controller.loadUrl($rawfile('zoom.html'));
      await Utils.waitForExist(() => this.isPageEnd, 'testWebZoomAccessTrue isPageEnd', 1, 2000);
      await Utils.waitForReleaseDriver('testWebZoomAccessTrue', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      await Utils.waitForReleaseDriver('testWebZoomAccessTrue', driver);
      Utils.emitEvent((this.oldScale > 0 && this.newScale > 0 && this.newScale > this.oldScale), 181102);
    } catch (error) {
      console.error('testZoomAccessTrue error: ' + JSON.stringify(error));
      Utils.emitEvent(false, 181102);
    }
  }

  private async testZoomAccessZoomIn() {
    try {
      this.isPageEnd = -1;
      this.zoomAccess = true;
      this.oldScale = 0;
      this.newScale = 0;
      this.controller.loadUrl($rawfile('zoom.html'));
      await Utils.waitForExist(() => this.isPageEnd, 'testWebZoomAccessZoomIn isPageEnd', 1, 2000);
      await Utils.waitForReleaseDriver('testWebZoomAccessZoomIn', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      await Utils.waitForReleaseDriver('testWebZoomAccessZoomIn', driver);
      Utils.emitEvent((this.newScale > this.oldScale), 181103);
    } catch (error) {
      console.error('testZoomAccessZoomIn error: ' + JSON.stringify(error));
      Utils.emitEvent(false, 181103);
    }
  }

  private async testZoomAccessZoomOut() {
    try {
      this.isPageEnd = -1;
      this.zoomAccess = true;
      this.oldScale = 0;
      this.newScale = 0;
      this.compareScale = 0;
      this.controller.loadUrl($rawfile('zoom.html'));
      await Utils.waitForExist(() => this.isPageEnd, 'testWebZoomAccessZoomOut isPageEnd', 1, 2000);
      await Utils.waitForReleaseDriver('testWebZoomAccessZoomOut', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      this.compareScale = this.newScale;
      await Utils.waitForReleaseDriver('testWebZoomAccessZoomOut', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', false);
      await Utils.waitForReleaseDriver('testWebZoomAccessZoomOut', driver);
      Utils.emitEvent((this.newScale < this.compareScale), 181104);
    } catch (error) {
      console.error('testZoomAccessZoomOut error: ' + JSON.stringify(error));
      Utils.emitEvent(false, 181104);
    }
  }

  private async testZoomAccessToggle() {
    try {
      this.isPageEnd = -1;
      this.zoomAccess = false;
      this.oldScale = 0;
      this.newScale = 0;
      this.controller.loadUrl($rawfile('zoom.html'));
      await Utils.waitForExist(() => this.isPageEnd, 'testWebZoomAccessToggle isPageEnd', 1, 2000);

      await Utils.waitForReleaseDriver('testWebZoomAccessToggle step1', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      let step1Result = (this.oldScale === 0 && this.newScale === 0);

      this.zoomAccess = true;
      await Utils.sleep(500);
      this.oldScale = 0;
      this.newScale = 0;

      await Utils.waitForReleaseDriver('testWebZoomAccessToggle step2', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      let step2Result = (this.newScale > this.oldScale);

      Utils.emitEvent((step1Result && step2Result), 181105);
    } catch (error) {
      console.error('testZoomAccessToggle error: ' + JSON.stringify(error));
      Utils.emitEvent(false, 181105);
    }
  }
}
