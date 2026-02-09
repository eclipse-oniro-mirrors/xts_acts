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
import { webview } from '@kit.ArkWeb';
import business_error from '@ohos.base';
import prompt from '@ohos.promptAction';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import { waitForExist} from '../../test/WaitTest.test';
import { Driver, ON, MouseButton} from '@ohos.UiTest';
import {inputMethod} from '@kit.IMEKit';

@Entry
@Component
struct WebComponent {
  webController: webview.WebviewController = new webview.WebviewController();
  @State isRefreshing: boolean = false;
  @State isForceZoomEnabled: boolean = false;
  @State flag:number = 1;
  @State ScaleChange: boolean = false;
  @State str: string = "";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isEnd:number = -1;


  aboutToAppear(): void {
    try {
      webview.WebviewController.setWebDebuggingAccess(true);
    } catch (error) {
      let e: business_error.BusinessError = error as business_error.BusinessError;
      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
    }
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {

      Row() {
        Button("WebController click").key('WebForceEnableZoomButton').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(()=>this.isReceive, this.str, 0);
          switch (this.str) {
            case "emitWebForceEnableZoom001": {
              try {
                this.isForceZoomEnabled = true;
                this.isPageEnd = -1
                this.webController.loadUrl('www.example.com')
                await waitForExist(()=>this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.webController.loadUrl($rawfile("WebForceEnableZoom.html"))
                await waitForExist(()=>this.isPageEnd, this.str, 0);
                this.webController.zoomIn();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }


      Column() {
        Web({ src: $rawfile("WebForceEnableZoom.html"), controller: this.webController })
          .key('WebForceEnableZoomWeb')
          .zoomAccess(true)
          .metaViewport(true)
          .onPageEnd(() => {
            this.isRefreshing = false;
            this.isPageEnd = 0;
          })
          .onScaleChange((e) => {
            console.info("scale changed new = " + e.newScale + ", old = " + e.oldScale)
            this.ScaleChange = true;
            if(this.flag == 1) {
              Utils.emitEvent(true, 20250913)
            } else {
              Utils.emitEvent(true, 20250914)
            }
           
          })
          .forceEnableZoom(this.isForceZoomEnabled)

      }
    }
  }
}