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
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
    }
  }
}
