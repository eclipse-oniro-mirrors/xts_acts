/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { CommonConstants } from '../../test/Constant.test';

const EVENT_ID_SET_EMIT_KEY = 111850;

@Entry
@Component
struct webViewContPageAndprepareForPageLoadErrorTwo {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State zoomAccess: boolean = false;
  @State str: string = "";
  @State errorCode: string = '0';
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
    console.info("webViewContPageAndprepareForPageLoadErrorTwo page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("messageEventErrorTest").key('webViewContPageAndprepareForPageLoadErrorTwo').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'webViewContPageAndprepareForPageLoadErrorTwoIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'webViewContPageAndprepareForPageLoadErrorTwoIsReceive', 1, 1000);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitPrefetchPageErr": {
              try {
                this.controller.prefetchPage('华为');
              } catch (error) {
                console.info(`prefetchPage fail, ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                Utils.emitEvent(this.errorCode, 111860);
              }
              break;
            }
            case "emitPrepareForPageLoadErr": {
              try {
                web_webview.WebviewController.prepareForPageLoad("华为", true, 6);
              } catch (error) {
                console.error(`prepareForPageLoad fail, ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                Utils.emitEvent(this.errorCode, 111870);
              }
              break;
            }
            case "emitPrepareForPageLoadErrTwo": {
              try {
                web_webview.WebviewController.prepareForPageLoad(CommonConstants.TEST_URL, true, 7);
              } catch (error) {
                console.error(`prepareForPageLoad fail, ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                Utils.emitEvent(this.errorCode, 111880);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .zoomAccess(this.zoomAccess)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}