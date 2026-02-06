/**
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
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
import { waitForExist } from '../../test/WaitTest.test';


@Entry
@Component
struct WebViewGetOrigins {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = 'emitGetOriginsPromiseLoadLocalHtml01';
  @State testMultiWindowAccess: boolean = true;
  @State testAllowWindowOpenMethod: boolean = true;
  @State block: boolean = false;
  @State ref: number = 0;
  @State eventId: number = 0;
  @State userAgent: string =
    'Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State origin: string = 'resource://rawfile/';
  @State isReceive: number = -1;
  @State getOrignsArr:String[] = []
  @State getOrignsTwoArr:String[] = []
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 137851,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(137851)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('OnWindowNew page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('GetOriginsButton').onClick(async () => {
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitGetOrigins01': {
              let length = -1;
              try {
                web_webview.WebStorage.getOrigins()
                  .then(origins => {
                    if(origins) {
                     this.getOrignsArr[0] = origins[0].origin;
                    }
                    console.log(`emitGetOrigins01 call end`);
                  })
                Utils.emitEvent(this.getOrignsArr.length == 0, 20251016);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(this.getOrignsArr.length == 0, 20251016);
              }
              break;
            }

            case 'emitGetOrigins02': {
              let length = -1;
              try {
                web_webview.WebStorage.getOrigins((error, origins) => {
                  console.log(`PBBgetOrigins callback call`);
                  if (origins) {
                    length = origins.length;
                    console.log(`emitGetOrigins02: ${length}`);
                    this.getOrignsTwoArr[0] = origins[0].origin;
                  }
                })
                Utils.emitEvent(this.getOrignsTwoArr.length == 0, 20251017);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(this.getOrignsTwoArr.length == 0, 20251017);
              }
              break;
            }
          }
        })
      }
    }
  }
}