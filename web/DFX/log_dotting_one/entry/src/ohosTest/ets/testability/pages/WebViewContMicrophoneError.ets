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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

const EVENT_ID_SET_EMIT_KEY = 112331;

@Entry
@Component
struct webViewContZoomAndOthersError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "";
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State zoomAccess: boolean = false;
  @State errorCode: string = '0';
  @State errorMsg: string = 'failed';
  @State factor: number = 1;
  @State searchString: string = "test";
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewContZoomAndOthersError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('WebViewContMicrophoneErrorButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'WebViewContMicrophoneErrorIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'WebViewContMicrophoneErrorIsReceive', 1, 1000);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitResumeMicrophone": {
              try {
                this.controllerTwo.resumeMicrophone();
              } catch (error) {
                console.error(`emitResumeMicrophone ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 20241224)
              Utils.emitEvent(this.errorMsg, 20241225)
              break;
            }
            case "emitPauseMicrophone": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.pauseMicrophone();
              } catch (error) {
                console.error(`emitPauseMicrophone ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 20241226)
              Utils.emitEvent(this.errorMsg, 20241227)
              break;
            }
            case "emitStopMicrophone": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.stopMicrophone();
              } catch (error) {
                console.error(`emitStopMicrophone ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 20241228)
              Utils.emitEvent(this.errorMsg, 20241229)
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .zoomAccess(this.zoomAccess)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}