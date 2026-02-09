/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import business_error from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ''
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State consoleMsg: string = ''
  @State consoleCorsError: boolean = false
  @State flag: boolean = false
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 138500,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(138500)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Row() {
      Column() {
        Button('WebInitTestButton')
          .key('WebInitTestButton')
          .onClick(async () => {
            await waitForExist(() => this.isPageEnd, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            webView.WebviewController.setRenderProcessMode(webView.RenderProcessMode.SINGLE);
            switch (this.str) {
              case 'emitWebViewGetAndSetRenderProcessMode03': {
                try {
                  let oldMode = webView.WebviewController.getRenderProcessMode();
                  console.log('oldMode===>' + oldMode)
                  webView.WebviewController.setRenderProcessMode(webView.RenderProcessMode.MULTIPLE);
                  let newMode = webView.WebviewController.getRenderProcessMode();
                  console.log('newMode===>' + newMode)
                  if (oldMode === 0 && newMode === 1) {
                    Utils.emitEvent('success', 138510);
                  } else {
                    Utils.emitEvent('fail', 138510);
                  }
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewGetAndSetRenderProcessMode04': {
                try {
                  webView.WebviewController.setRenderProcessMode(null);
                  let newMode = webView.WebviewController.getRenderProcessMode();
                  console.log('newMode===>' + newMode)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  if (e.code == 401) {
                    Utils.emitEvent('success', 138520);
                  }
                }
                break;
              }
              case 'emitWebViewOnRenderProcessResponding': {
                this.controller.runJavaScript('jumpPageCaton()', (error, result) => {
                  console.error(`The jumpPageCaton() return error is: ${error}`);
                  console.log(`The jumpPageCaton() return value is: ${result}`);
                })
                Utils.emitEvent(true, 138530)
                break;
              }
              case 'emitWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT': {
                this.controller.runJavaScript('jumpPageCaton()', (error, result) => {
                  console.error(`The jumpPageCaton() return error is: ${error}`);
                  console.log(`The jumpPageCaton() return value is: ${result}`);
                })
                Utils.emitEvent(true, 138540)
                break;
              }
            }
          })

        Web({ src: $rawfile('common_index.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onRenderProcessResponding(() => {
            console.log('onRenderProcessResponding again');
            Utils.emitEvent(true, 138530)
          })
          .onRenderProcessNotResponding(async (data) => {
            console.log('onRenderProcessNotResponding: [jsStack]= ' + data.jsStack +
              ', [process]=' + data.pid + ', [reason]=' + data.reason);
            this.controller.runJavaScript('stopBlockJs()', (error, result) => {
              console.error(`The stopBlockJs() return error is: ${error}`);
              console.log(`The stopBlockJs() return value is: ${result}`);
            })
            if (RenderProcessNotRespondingReason.NAVIGATION_COMMIT_TIMEOUT.toString() === '1') {
              Utils.emitEvent(true, 138540)
            }
          })
          .onPageEnd((event) => {
            console.log('web pageEnd==>' + event.url);
            this.isPageEnd = 0;
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}