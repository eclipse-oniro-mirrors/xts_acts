/*
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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import { Driver } from '@kit.TestKit';
import prompt from '@ohos.promptAction';

const EVENT_ID_SET_SUITE_KEY = 182306;
let driver: Driver = Driver.create();

@Entry
@Component
struct webViewScrollable {
  @State str: string = "";
  @State isReceive: number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State x: boolean = true;
  @State webHeight: number = 0
  @State isWebBottom:Boolean = false;
  @State isWebTop:Boolean = false;
  @State isPageEnd: number = -1;


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
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }


  getWebHeight() {
    try {
      this.controller?.runJavaScriptExt('window.innerHeight',
        (error, result) => {
          if (error || !result) {
            return;
          }
          if (result.getType() === web_webview.JsMessageType.NUMBER) {
            this.webHeight = result.getNumber()
          }
        })
    } catch (error) {
    }
  }

  checkScrollPosition() {
    console.log("y:" + this.controller.getScrollOffset().y + ",webHeight :" + this.webHeight + ",getPageHeight:" +
    this.controller.getPageHeight());
    if (this.controller.getScrollOffset().y + this.webHeight >= this.controller.getPageHeight()- 2) {
      this.isWebBottom = true;
      console.log("页面已经滑动到底部");
    }
    else if(this.controller.getScrollOffset().y == 0) {
      this.isWebTop = true;
      console.log("页面已经滑动到顶部");
    }
  }


  build() {
      Column() {
        Row() {
          Button("web click").key('WebBackToTopButton').onClick(async () => {
            console.info("key==>" + this.str)
            await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
            await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
            let driver: Driver = Driver.create();
            switch (this.str) {
              case "emitBackToTop001": {
                try {
                  this.x = true;
                  let webRect = Utils.getComponentRect('WebBackToTopKey');
                  let downX = Math.round(globalThis.winLeft + webRect.left  + 5);
                  let downY = Math.round(globalThis.winTop + webRect.top + 5);
                  this.isPageEnd = -1;
                  this.controller.pageDown(true);
                  await driver.mouseScroll({x:downX , y:downY }, true, 30, 2072)
                  await Utils.waitForExist(()=>this.isPageEnd, this.str, 0);
                  setTimeout(() => {
                    if (this.isWebTop) {
                      console.log("页面已经滑动到顶部");
                      Utils.emitEvent(true, 20251216);
                    } else {
                      Utils.emitEvent(false, 20251216);
                    }
                  },3000)

                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitBackToTop002": {
                try {
                  this.x = false;
                  let webRect = Utils.getComponentRect('WebBackToTopKey');
                  let downX = Math.round(globalThis.winLeft + webRect.left  + 5);
                  let downY = Math.round(globalThis.winTop + webRect.top + 5);
                  this.isPageEnd = -1;
                  this.controller.pageDown(true);
                  await driver.mouseScroll({x:downX , y:downY }, true, 30, 2072)
                  await Utils.waitForExist(()=>this.isPageEnd, this.str, 0);
                  setTimeout(() => {
                    if (this.isWebTop) {
                      console.log("页面已经滑动到顶部");
                      Utils.emitEvent(false, 20251217);
                    } else {
                      Utils.emitEvent(true, 20251217);
                    }
                  },3000)

                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

            }
          })
        }

        Web({ src: $rawfile('indexFive.html'), controller: this.controller }).key('WebBackToTopKey')
          .javaScriptAccess(true)
          .fileAccess(true)
          .imageAccess(true)
          .domStorageAccess(true)
          .onlineImageAccess(true)
          .databaseAccess(true)
          .onPageEnd((event) => {
            this.getWebHeight();
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 1;
          })
          .onScroll((event) => {
            console.log('onScroll xOffset:' + event.xOffset + ' yOffset:' + event.yOffset);
            this.checkScrollPosition();
          }).height('95%')
          .backToTop(this.x)

      }
  }
}
