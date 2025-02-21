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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebViewControllerLoadUrlTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State callBackId: number = 0;
  @State stressTimes: number = 0;
  @State buttonKey: string = '';

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

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Row() {
      Column() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case 'testWebViewControllerLoadUrl001': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl($rawfile('index.html'))
                    Utils.stressingLog('WebViewController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebViewControllerLoadUrl002': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl('resource://rawfile/second.html')
                    Utils.stressingLog('WebViewController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebViewControllerLoadUrl003': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl('https://openharmony.cn/')
                    Utils.stressingLog('WebViewController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebViewControllerLoadUrl004': {
                try {
                  let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl(`file://${sandboxPath}`)
                    Utils.stressingLog('WebViewController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebViewControllerLoadUrl005': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl($rawfile('index.html'),
                      [{
                        headerKey: "customHeaderKey",
                        headerValue: "customHeaderValue"
                      }]
                    )
                    Utils.stressingLog('WebViewController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebViewControllerLoadUrl006': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl('resource://rawfile/second.html',
                      [{
                        headerKey: "customHeaderKey",
                        headerValue: "customHeaderValue"
                      }]
                    )
                    Utils.stressingLog('WebViewController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebViewControllerLoadUrl007': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl('https://openharmony.cn/',
                      [{
                        headerKey: "customHeaderKey",
                        headerValue: "customHeaderValue"
                      }]
                    )
                    Utils.stressingLog('WebViewController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebViewControllerLoadUrl008': {
                try {
                  let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl(`file://${sandboxPath}`,
                      [{
                        headerKey: "customHeaderKey",
                        headerValue: "customHeaderValue"
                      }]
                    )
                    Utils.stressingLog('WebViewController.loadUrl()', i + 1, this.stressTimes)
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

        Web({ src: '', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
      }
      .width('100%')
    }

    .height('100%')
  }
}