/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under * License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import {waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct SetPathAllowingUniversalAccess {
  @State str: string = ""
  @State checkResult: number = 0;
  controller: webView.WebviewController = new webView.WebviewController();
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 119060,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(119060)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("setPathAllowingUniversalAccess").key('setPathAllowingUniversalAccessButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, 'setPathAllowingUniversalAccessButtonIsReceive', 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "testPathAllowingUniversalAccess001": {
              try {
                this.controller.setPathAllowingUniversalAccess(null);
                this.controller.loadUrl("file://" + getContext().resourceDir + "/index.html");
                Utils.emitEvent("success", 119070)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent((error as BusinessError).code, 119070)
              }
              break;
            }
            case "testPathAllowingUniversalAccess002": {
              try {
                this.controller.setPathAllowingUniversalAccess(undefined);
                this.controller.loadUrl("file://" + getContext().resourceDir + "/index.html");
                Utils.emitEvent("success", 119080)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent((error as BusinessError).code, 119080)
              }
              break;
            }
            case "testPathAllowingUniversalAccess003": {
              try {
                this.controller.setPathAllowingUniversalAccess([]);
                this.controller.loadUrl("file://" + getContext().resourceDir + "/index.html");
                Utils.emitEvent("success", 119090)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent((error as BusinessError).code, 119090)
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
        .onPageEnd(()=>{
          this.isPageEnd = 0;
        })
    }
  }
}
