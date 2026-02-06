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
import image from "@ohos.multimedia.image"
import business_error from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State res: boolean = false;
  @State str: string = ""
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State pixelmap: image.PixelMap | undefined = undefined;
  @State consoleMsg: string = ''
  @State searchResultCount: number = -1
  @State consoleCorsError: boolean = false
  @State flag: boolean = false
  @State isEnd: number = -1;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 300530,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(300530)
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
            console.info("isPageEnd :" + this.isPageEnd);
            console.info("isReceive :" + this.isReceive);
            await waitForExist(()=>this.isPageEnd, this.str + 'IsPageEnd', 0);
            await waitForExist(()=>this.isReceive, this.str + 'IsReceive', 0);
            console.info("key==>" + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case "emitSetPrintBackgroundOne": {
                this.isEnd = -1;
                this.controller.runJavaScript("tryPrint()", (error, result) => {
                  if (error) {
                    console.info(`emitSetPrintBackgroundOne runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    this.isEnd = 0;
                    console.log("emitSetPrintBackgroundOne runJavaScript.result: " + result);
                  }
                })
                await waitForExist(()=>this.isEnd, this.str + 'IsEnd',0,1000);
                try {
                  this.controller.setPrintBackground(false);
                  let enable = this.controller.getPrintBackground();
                  console.info("getPrintBackground: " + enable);
                  Utils.emitEvent(enable, 300540)
                  console.info("emitSetPrintBackgroundOne  res: " + enable);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .height('100%')
          .width('100%')
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onPageEnd(()=>{
            this.isPageEnd = 0;
          })
          .onSearchResultReceive(ret => {
            console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
              "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
            this.searchResultCount = ret.numberOfMatches
            let searchResult = ret.activeMatchOrdinal.toString() +
            ret.numberOfMatches.toString();
            console.log("searchResult" + searchResult);
            if(this.flag){
              setTimeout(() => {
                Utils.emitEvent(searchResult, 300550);
                this.controller.clearMatches();
                this.flag=false
              }, 3000)
            }
          })
      }
    }
  }
}