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
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import business_error from '@ohos.base';

@Entry
@Component
struct webViewSetConnectionTimeout {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isFrameResourceType: boolean = false
  
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
              .key('webViewSetConnectionTimeoutButton')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  this.controller.refresh()
                  await Utils.sleep(2500);
                  switch (this.emitKey) {
                    case 'emitWebViewSetConnectionTimeoutZeroSeconds': {
                      try {
                        webview.WebviewController.setConnectionTimeout(0);
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent('Error', 8001);
                      }
                      break;
                    }
                    case 'emitWebViewSetConnectionTimeoutPointFiveSeconds': {
                      try {
                        webview.WebviewController.setConnectionTimeout(0.5);
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent('Error', 8002);
                      }
                      break;
                    }
                    case 'emitWebViewSetConnectionTimeoutNegativeOneSeconds': {
                      try {
                        webview.WebviewController.setConnectionTimeout(-1);
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent('Error', 8003);
                      }
                      break;
                    }
                    case 'emitWebViewSetConnectionTimeoutWithA': {
                      try {
                        webview.WebviewController.setConnectionTimeout(Number('a'));
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent('Error', 8004);
                      }
                      break;
                    }
                    case 'emitWebViewSetConnectionTimeoutTenSeconds': {
                      try {
                        webview.WebviewController.setConnectionTimeout(5);
                        this.controller.loadUrl('https://www.weibo111xxxbbb.com')
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      }
                      break;
                    }
                 }
              })
          }
          Web({ src: '', controller: this.controller })
                .javaScriptAccess(this.javaScriptAccess)
                .fileAccess(this.fileAccess)
                .imageAccess(this.imageAccess)
                .domStorageAccess(this.domStorageAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .databaseAccess(this.databaseAccess)
                .onErrorReceive((event) => {
                  if (event) {
                    console.log('getErrorInfo:' + event.error.getErrorInfo())
                    console.log('getErrorCode:' + event.error.getErrorCode())
                    let getErrorInfo = event.error.getErrorInfo()
                    Utils.emitEvent('Time_out', 8005);
                  }
                })
      }
  }
}
