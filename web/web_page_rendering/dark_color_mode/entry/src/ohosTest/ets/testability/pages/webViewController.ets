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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';

@Entry
@Component
struct webViewController {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true
  @State darkMode: WebDarkMode = WebDarkMode.Off
  @State forceDarkAccess: boolean = false

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
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewControllerButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testDarkMode001": {
              try {
                this.darkMode = WebDarkMode.On
                this.forceDarkAccess = true
                this.controller.loadUrl("resource://rawfile/darkModle.html");
                await Utils.sleep(2000);
                this.controller.runJavaScript(
                  'isDarkModel()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(error.code, 31039)
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(result, 31039)
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31039)
              }
              break;
            }

            case "testDarkMode002": {
              try {
                this.darkMode = WebDarkMode.Auto
                this.forceDarkAccess = true
                this.controller.loadUrl("resource://rawfile/darkModle.html");
                await Utils.sleep(2000);
                this.controller.runJavaScript(
                  'isDarkModel()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(error.code, 31040)
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(result, 31040)
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31040)
              }
              break;
            }

            case "testForceDarkAccess001": {
              try {
                this.darkMode = WebDarkMode.Off
                this.forceDarkAccess = true
                this.controller.loadUrl("resource://rawfile/darkModle.html");
                await Utils.sleep(2000);
                this.controller.runJavaScript(
                  'isDarkModel()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(error.code, 31041)
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(result, 31041)
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31041)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key("onShowFileSelectorKey")
        .fileAccess(true)
        .darkMode(this.darkMode)
        .forceDarkAccess(this.forceDarkAccess)
    }
    .key('RowSize')
  }
}
