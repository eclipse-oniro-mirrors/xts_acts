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
import BusinessError from '@ohos.base';
import window from '@ohos.window'

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State userAgentPC:string = "";
  @State webInit: boolean = false
  @State confirm: string = "";
  @State alert: string = "";
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State consoleMsg: string = ''
  @State screenHeight: number = 0;
  @State avoidAreaChangeStr: string = '';

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
              case "emitOnPrompt": {
                  this.controller.loadUrl("resource://rawfile/index.html");
                  setTimeout(() => {
                    this.controller.runJavaScript('toPrompt()')
                      .then((result) => {
                        console.log('result: ' + result);
                      })
                  }, 3000);
                  break;
              }
              case "emitOnAlert": {
                  this.controller.runJavaScript('alertTest()')
                    .then((result) => {
                      console.log('result: ' + result);
                    })
                  setTimeout(() => {
                    Utils.emitEvent(this.alert, 63);
                  }, 3000);
                  break;
              }
              case "emitOnConfirm": {
                  this.controller.runJavaScript('confirmTest()')
                    .then((result) => {
                      console.log('result: ' + result);
                    })
                  setTimeout(() => {
                    Utils.emitEvent(this.confirm, 64);
                  }, 3000);
                  break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .onAlert((event) => {
            this.alert = event.message;
            return false;
          })
          .onConfirm((event) => {
            this.confirm = event.message;
            return false;
          })
          .onPrompt((event) => {
            event.result.handlePromptConfirm("onPrompt ok");
            Utils.emitEvent(event.message, 178);
            return true;
          })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onErrorReceive((event) => {
            if (event) {
              console.log('onErrorReceive ==============> ')
              console.log('getErrorInfo:' + event.error.getErrorInfo())
              console.log('getErrorCode:' + event.error.getErrorCode())
              console.log('url:' + event.request.getRequestUrl())
              console.log('isMainFrame:' + event.request.isMainFrame())
              console.log('isRedirect:' + event.request.isRedirect())
              console.log('isRequestGesture:' + event.request.isRequestGesture())
              console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString())
              let result = event.request.getRequestHeader()
              console.log('The request header result size is ' + result.length)
              for (let i of result) {
                console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue)
              }
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}