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
import business_error from '@ohos.base';
import {waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  schemeList: webView.WebCustomScheme[] = [
    { schemeName: "jump1", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "jump2", isSupportCORS: true, isSupportFetch: false },
    { schemeName: "jump3", isSupportCORS: false, isSupportFetch: true },
    { schemeName: "jump4", isSupportCORS: false, isSupportFetch: false }
  ]
  outOfRangeSchemeList: webView.WebCustomScheme[] = [
    { schemeName: "name1", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name2", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name3", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name4", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name5", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name6", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name7", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name8", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name9", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name10", isSupportCORS: true, isSupportFetch: true },
    { schemeName: "name11", isSupportCORS: true, isSupportFetch: true }
  ]
  invalidSchemeList: webView.WebCustomScheme[] = [{
    schemeName: "nameLength32nameLength32nameLength32nameLength32",
    isSupportCORS: true,
    isSupportFetch: true
  }]
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
 
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 119760,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(119760)
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
        this.isReceive = 0;
      }
    }
  }

  aboutToAppear() {
    try {
      webView.WebviewController.customizeSchemes(this.schemeList)
    } catch (error) {
      let e: business_error.BusinessError = error as business_error.BusinessError;
      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
    }
  }

  build() {
    Row() {
      Column() {
        Button('WebInitTestButton')
          .key('WebInitTestButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, 'WebInitTestButtonIsReceive', 0);
            await waitForExist(()=>this.isPageEnd, 'WebInitTestButtonIsPageEnd', 0);
            console.info('key==>' + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case "testSchemeName001": {
                try {
                  webView.WebviewController.customizeSchemes(this.invalidSchemeList)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 119770);
                }
                break;
              }
              case "testCustomizeSchemes001": {
                try {
                  webView.WebviewController.customizeSchemes(this.outOfRangeSchemeList)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 119780);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onPageEnd(()=>{
            this.isPageEnd = 0;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}