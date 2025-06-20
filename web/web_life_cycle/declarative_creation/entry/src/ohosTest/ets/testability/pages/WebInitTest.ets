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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import business_error from '@ohos.base';
import { BusinessError } from '@ohos.base';

@CustomDialog
struct NewWebViewComp {
  controller?: CustomDialogController
  webViewController1: webView.WebviewController = new webView.WebviewController()

  build() {
    Column() {
      Web({ src: "", controller: this.webViewController1 })
        .javaScriptAccess(true)
        .multiWindowAccess(false)
        .onWindowExit(() => {
          console.info("NewWebViewComp onWindowExit")
          if (this.controller) {
            this.controller.close()
          }
        })
    }
  }
}

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State webInit: boolean = false
  @State arrid: number = 0;
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State consoleMsg: string = ''
  @State consoleCorsError: boolean = false
  dialogController: CustomDialogController | null = null
  popController: webView.WebviewController | null = null;
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
        try {
          this.controller.loadUrl("resource://rawfile/index.html");
        } catch (error) {
          console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
        this.interceptUrl = ''
        this.consoleMsg = ''
        this.consoleCorsError = false
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
            console.info("key==>" + this.str)
            switch (this.str) {
              case "emitOnControllerAttached": {
                Utils.emitEvent(this.arrid, 7);
                break;
              }

              case "emitSetWebController": {
                this.controller.loadUrl($rawfile("openNewWindow.html"));
                await Utils.sleep(2000);
                this.controller.runJavaScript('openWindowAll()', (error, result) => {
                  console.log('setWebController >>>: ' + result + error);
                  setTimeout(() => {
                    this.controller.loadUrl("resource://rawfile/indexTwo.html")
                  }, 2000)
                })
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .allowWindowOpenMethod(true)
          .databaseAccess(true)
          .onControllerAttached(() => {
            try {
              this.arrid = this.controller.getWebId();
              console.log("id++++++: " + this.arrid);
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
          })
          .onWindowNew((event) => {
            if (this.dialogController) {
              this.dialogController.close()
            }
            let popController: webView.WebviewController = new webView.WebviewController()
            this.dialogController = new CustomDialogController({
              builder: NewWebViewComp({ webViewController1: popController })
            })
            this.dialogController.open()
            event.handler.setWebController(popController)
            setTimeout(() => {
              if (popController) {
                Utils.emitEvent(true, 1311)
              }
            }, 3000)
          })
          .onWindowExit(() => {
            console.info("closeWindow")
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}