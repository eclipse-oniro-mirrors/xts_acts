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

const EVENT_ID_SET_SUITE_KEY = 176201;

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State pixelmap: image.PixelMap | undefined = undefined;
  @State consoleMsg: string = ''
  @State searchResultCount: number = -1
  @State consoleCorsError: boolean = false
  @State flag: boolean = false

  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isOnSearchReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
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
            await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
            await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
            switch (this.str) {
              case "emitSearchAllAsync": {
                try {
                  this.flag = true
                  this.controller.searchAllAsync("首页");
                } catch (error) {
                  console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                }
                break;
              }
              case "emitContextMenuMediaType": {
                try {
                  let con = ContextMenuMediaType.Image;
                  Utils.emitEvent(con, 176220);
                  console.log("result: " + con);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitContextMenuInputFieldType": {
                try {
                  await Utils.emitEvent(ContextMenuInputFieldType.PlainText, 176230);
                  await Utils.emitEvent(ContextMenuInputFieldType.Telephone, 176231);
                  await Utils.emitEvent(ContextMenuInputFieldType.Other, 176232);
                  console.log("result: " + ContextMenuInputFieldType.PlainText);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitContextMenuEditStateFlags": {
                try {
                  await Utils.emitEvent(ContextMenuEditStateFlags.NONE, 176240);
                  await Utils.emitEvent(ContextMenuEditStateFlags.CAN_CUT, 176241);
                  await Utils.emitEvent(ContextMenuEditStateFlags.CAN_COPY, 176242);
                  await Utils.emitEvent(ContextMenuEditStateFlags.CAN_PASTE, 176243);
                  await Utils.emitEvent(ContextMenuEditStateFlags.CAN_SELECT_ALL, 176244);
                  console.log("result: " + ContextMenuEditStateFlags.CAN_SELECT_ALL);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitGetFavicon": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('indexCopy.html'))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.pixelmap = this.controller.getFavicon();
                  this.pixelmap.getImageInfo().then(imageInfo => {
                    if (imageInfo == undefined) {
                      console.error("Failed to obtain the image pixel map information.");
                    }
                    console.log("the result of pixelmap: " + JSON.stringify(imageInfo));
                    Utils.emitEvent(Object.getOwnPropertyNames(imageInfo).length, 176250)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(this.pixelmap, 176250)
                }
                break;
              }
              case "emitGetFaviconAgain": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('secondCopy.html'))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.pixelmap = this.controller.getFavicon();
                  this.pixelmap.getImageInfo().then(imageInfo => {
                    if (imageInfo == undefined) {
                      console.error("Failed to obtain the image pixel map information.");
                    }
                    console.log("the result of pixelmap: " + JSON.stringify(imageInfo));
                    if (Object.getOwnPropertyNames(imageInfo).length > 1) {
                      Utils.emitEvent(true, 176260)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnSearchResultReceive001": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/search.html');
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  console.error(`searchResultCount is: ${this.searchResultCount}`);
                  this.isOnSearchReceive = -1;
                  this.controller.searchAllAsync('search');
                  await Utils.waitForExist(()=>this.isOnSearchReceive, this.str+' isOnSearchReceive', 1, 1000);
                  console.error(`searchResultCount is: ${this.searchResultCount}`);
                  Utils.emitEvent(this.searchResultCount, 176270)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitOnSearchResultReceive002": {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/search.html');
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  this.isOnSearchReceive = -1;
                  this.controller.searchAllAsync('searchNone');
                  await Utils.waitForExist(()=>this.isOnSearchReceive, this.str+' isOnSearchReceive', 1, 1000);
                  Utils.emitEvent(this.searchResultCount, 176280)
                  console.error(`searchResultCount is: ${this.searchResultCount}`);

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
          .onSearchResultReceive(ret => {
            console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
              "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
            this.searchResultCount = ret.numberOfMatches
            this.isOnSearchReceive = 1;
            let searchResult = ret.activeMatchOrdinal.toString() +
            ret.numberOfMatches.toString();
            console.log("searchResult" + searchResult);
            if(this.flag){
              Utils.emitEvent(searchResult, 176210);
              this.controller.clearMatches();
              this.flag=false
            }
          })
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 1;
          })
      }
    }
  }
}