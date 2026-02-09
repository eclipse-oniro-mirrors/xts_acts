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
import events_emitter from '@ohos.events.emitter'
import webview from '@ohos.web.webview'
import Utils from '../../test/Utils'
import business_error from '@ohos.base'
import buffer from '@ohos.buffer'
import { WebNetErrorList } from '@ohos.web.netErrorList'
import {waitForAssert, waitForExist} from '../../test/WaitTest';
@Entry
@Component
struct webSafeBrowsing {
  controller: webview.WebviewController = new webview.WebviewController();
  srcUrl: string = 'https://m.iqiyi.com/';

  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 160740,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(160740)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
              this.isReceive = 0;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('webSafeBrowsingButton')
              .key('webSafeBrowsing')
              .onClick(async () => {
                await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                await waitForExist(() => this.isReceive, this.emitKey, 0);
                this.isReceive = -1;
                  console.info('key==>' + this.emitKey)
                  switch (this.emitKey) {
                    case 'emitEnableSafeBrowsingTrue': {
                      try {
                        this.controller.enableSafeBrowsing(true);
                        let result:boolean = this.controller.isSafeBrowsingEnabled();
                        console.log(' emitEnableSafeBrowsingTrue:  ', result);
                        Utils.emitEvent(result, 160750)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 160750)
                      }
                      break;
                    }

                    case 'emitEnableSafeBrowsingFalse': {
                      try {
                        this.controller.enableSafeBrowsing(false);
                        let result:boolean = this.controller.isSafeBrowsingEnabled();
                        console.log(' emitEnableSafeBrowsingFalse:  ', result);
                        Utils.emitEvent(!result, 160760)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 160760)
                      }
                      break;
                    }

                    case 'emitIsSafeBrowsingEnabledTrue': {
                      try {
                        this.controller.enableSafeBrowsing(true);
                        let result:boolean = this.controller.isSafeBrowsingEnabled();
                        console.log(' emitIsSafeBrowsingEnabledTrue:  ', result);

                        Utils.emitEvent(result, 160770)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 160770)
                      }
                      break;
                    }

                    case 'emitIsSafeBrowsingEnabledFalse': {
                      try {
                        this.controller.enableSafeBrowsing(false);
                        let result:boolean = this.controller.isSafeBrowsingEnabled();
                        console.log(' emitIsSafeBrowsingEnabledFalse:  ', result);

                        Utils.emitEvent(!result, 160780)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 160780)
                      }
                      break;
                    }
                  }
              })
          }
          Web({ src: this.srcUrl, controller: this.controller })
            .onPageEnd((event) => {
              if (event) {
                this.isPageEnd = 0;
                console.log('onPageEnd url:' + event.url);
              }
            })
      }
  }
}
