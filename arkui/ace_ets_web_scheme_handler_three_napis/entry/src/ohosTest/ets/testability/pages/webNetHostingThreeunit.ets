/**
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
import web_webview from '@ohos.web.webview'
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';

import testsuite from '../../test/List.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';


import testNapi from 'libentry.so';

@Entry
@Component
struct webRegisterCustomsComponent {

  controller: web_webview.WebviewController = new web_webview.WebviewController("scheme-handler");
  @State str: string = ""
  @State interceptUrl: string = ''
  heads: Header[] = new Array()
  @State consoleCorsError: boolean = false
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State consoleMsg: string = ''
  @State isRegister: number = -1;
  @State isSet: number = -1;

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()

    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)

    console.error("aboutToAppear registerCustomSchemes")
    testNapi.registerCustomSchemes()
    web_webview.WebviewController.initializeWebEngine();
    testNapi.setSchemeHandler();

    console.error("aboutToAppear setSchemeHandler" + this.isSet)
    console.error("aboutToAppear registerCustomSchemes End")
    
    testNapi.initResourceManager(getContext().resourceManager);
  }

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

  build() {
    Column() {
      Row() {
        Button("webHostingButton").key('webHostingButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "emitWebResourceHandler_DidFailWithError": {
              console.log("runJavaScript testError()");
              await Utils.sleep(1000);

              this.controller.runJavaScript('testError()', (error, result)=> {
                if (error) {
                  console.info(" run JavaScript testError error:" + JSON.stringify(error));
                  return;
                }
                if (result) {
                  console.info(" run JavaScript testError return value is:" + result);
                }
              })

              await Utils.sleep(1000);
              console.log("emitWebResourceHandler_DidFailWithError ==>");
              let result:number = testNapi.resourceHandlerDidFailWithError();
              console.log("emitWebResourceHandler_DidFailWithError ==>" + result);

              await Utils.sleep(1000);

              if (result == 0) {
                Utils.emitEvent(true, 7755);
              } else {
                Utils.emitEvent(false, 7755);
              }
              break;
            }

          }
        })
      }
      Web({ src: $rawfile("chunked_post_stream.html"), controller: this.controller})
        .javaScriptAccess(true)
        .width('100%')
        .height('100%')
        .databaseAccess(true)
        .fileAccess(false)
        .domStorageAccess(true)
        .cacheMode(CacheMode.Default)
    }
    .height('100%')

  }

}
