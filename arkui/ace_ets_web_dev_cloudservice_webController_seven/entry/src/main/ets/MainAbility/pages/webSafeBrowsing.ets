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
@Entry
@Component
struct webSafeBrowsing {
  controller: webview.WebviewController = new webview.WebviewController();
  srcUrl: string = 'https://m.iqiyi.com/';

  @State emitKey: string = '';

  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('web click')
              .key('webViewSdkSchemeHandler')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.sleep(3000);
                  switch (this.emitKey) {
                    case 'emitEnableSafeBrowsingTrue': {
                      try {
                        this.controller.enableSafeBrowsing(true);
                        let result:boolean = this.controller.isSafeBrowsingEnabled();
                        console.log(' emitEnableSafeBrowsingTrue:  ', result);

                        await Utils.sleep(1000)
                        Utils.emitEvent(result, 2001)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 2001)
                      }
                      break;
                    }

                    case 'emitEnableSafeBrowsingFalse': {
                      try {
                        this.controller.enableSafeBrowsing(false);
                        let result:boolean = this.controller.isSafeBrowsingEnabled();
                        console.log(' emitEnableSafeBrowsingFalse:  ', result);

                        await Utils.sleep(1000)
                        Utils.emitEvent(!result, 2002)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 2002)
                      }
                      break;
                    }

                    case 'emitIsSafeBrowsingEnabledTrue': {
                      try {
                        this.controller.enableSafeBrowsing(true);
                        let result:boolean = this.controller.isSafeBrowsingEnabled();
                        console.log(' emitIsSafeBrowsingEnabledTrue:  ', result);

                        await Utils.sleep(1000)
                        Utils.emitEvent(result, 2003)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 2003)
                      }
                      break;
                    }

                    case 'emitIsSafeBrowsingEnabledFalse': {
                      try {
                        this.controller.enableSafeBrowsing(false);
                        let result:boolean = this.controller.isSafeBrowsingEnabled();
                        console.log(' emitIsSafeBrowsingEnabledFalse:  ', result);

                        await Utils.sleep(1000)
                        Utils.emitEvent(!result, 2004)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 2004)
                      }
                      break;
                    }
                  }
              })
          }
          Web({ src: this.srcUrl, controller: this.controller })
      }
  }
}
