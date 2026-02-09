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

const EVENT_ID_SET_EMIT_KEY = 200800;

@Entry
@Component
struct setPathAllowingUniversalAccess {
  @State str: string = ""
  @State checkResult: number = 0;
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  times = 0;
  controller: webView.WebviewController = new webView.WebviewController();


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
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("setPathAllowingUniversalAccess").key('setPathAllowingUniversalAccessButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'setPathAllowingUniversalAccessButtonIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "setPathAllowingUniversalAccess0100": {
              this.controller.clearMatches();
              try {
                this.checkResult = 1;
                this.controller.setPathAllowingUniversalAccess([
                  getContext().resourceDir,
                  getContext().filesDir + "/example"
                ])
                this.isPageEnd = -1;
                this.controller.loadUrl("file://" + getContext().resourceDir + "/index.html");
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                console.log(getContext().resourceDir);
                this.controller.runJavaScript('getFile()',
                  (error, result) => {
                    if (error) {
                      console.error(`run JavaScript error: ` + JSON.stringify(error))
                      return;
                    }
                    if (result) {
                      console.info(`getFile() return value is: ${result}`);
                      this.controller.searchAllAsync('success');
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
      }


      Web({ src: "", controller: this.controller })
        .onSearchResultReceive(async ret => {
          if (ret) {
            this.times++;
            console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
              "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
            if(this.checkResult == 1) {
              console.log('check1')
              if (ret.numberOfMatches === 0 && this.times <= 10) {
                await Utils.sleep(500)
                console.log('sleep 500ms, retry...')
                this.controller.searchAllAsync('success');
                return;
              }
              Utils.emitEvent(ret.numberOfMatches, 200810)
              this.checkResult = 0;
            }
          }
        })
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}