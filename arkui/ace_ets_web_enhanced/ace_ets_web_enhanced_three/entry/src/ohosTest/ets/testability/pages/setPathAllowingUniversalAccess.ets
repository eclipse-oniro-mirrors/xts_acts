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
import { BusinessError } from '@ohos.base';
import { Driver, ON, On } from '@ohos.UiTest';

@Entry
@Component
struct setPathAllowingUniversalAccess {
  @State str: string = ""
  @State checkResult: number = 0;
  controller: webView.WebviewController = new webView.WebviewController();


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
        Button("setPathAllowingUniversalAccess").key('setPathAllowingUniversalAccessButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "setPathAllowingUniversalAccess0100": {
              this.controller.clearMatches();
              try {
                this.checkResult = 1;
                this.controller.setPathAllowingUniversalAccess([
                  getContext().resourceDir,
                  getContext().filesDir + "/example"
                ])
                this.controller.loadUrl("file://" + getContext().resourceDir + "/index.html")
                console.log(getContext().resourceDir)
                await Utils.sleep(2000);
                let driver: Driver = Driver.create();
                let buttonOne = await driver.findComponent(ON.text('stealFile'));
                await buttonOne.click()
                await Utils.sleep(2000);
                this.controller.searchAllAsync('success');

              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "setPathAllowingUniversalAccess0200": {
              try {
                this.controller.setPathAllowingUniversalAccess([
                  '/haha/hehe',
                  getContext().filesDir + "/example"
                ])
                this.controller.loadUrl("file://" + getContext().resourceDir + "/index.html")
                console.log(getContext().resourceDir)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code, 9471)
              }
              break;
            }
            case "setPathAllowingUniversalAccess0300": {
              try {
                this.controller.setPathAllowingUniversalAccess([
                  '/data/storage/el1/bundle/../../resfile',
                  getContext().filesDir + "/example"
                ])
                this.controller.loadUrl("file://" + getContext().resourceDir + "/index.html")
                console.log(getContext().resourceDir)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code, 9472)
              }
              break;
            }
            
          }
        })
      }


      Web({ src: "", controller: this.controller })
        .onSearchResultReceive(ret => {
          if (ret) {
            console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
              "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
            if(this.checkResult == 1) {
              console.log('check1')
              Utils.emitEvent(ret.numberOfMatches, 9470)
              this.checkResult = 0;
            }
          }
        })
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
    }
  }
}
