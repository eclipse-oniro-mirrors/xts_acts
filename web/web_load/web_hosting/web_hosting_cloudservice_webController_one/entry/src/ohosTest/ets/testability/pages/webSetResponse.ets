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
import { waitForExist } from '../../test/WaitTest.test'

@Entry
@Component
struct webSetResponse {
  controller: webview.WebviewController = new webview.WebviewController();
  srcUrl: string = 'https://www.example.com/';

  @State emitKey: string = '';
  @State isReceive:number = -1

  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 147001,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide(){
    events_emitter.off(147001)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
              this.isReceive = 0
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('web click')
              .key('webSetNetErrorCode')
              .onClick(async () => {
                await waitForExist(()=>this.isReceive, this.emitKey, 0);
                this.isReceive = -1;
                  console.info('key==>' + this.emitKey)
                  switch (this.emitKey) {
                    case 'emitWebSetResponseStatus': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setStatus(null);
                        Utils.emitEvent(false, 147010)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 147010)
                        } else {
                          Utils.emitEvent(false, 147010)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseStatusText': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setStatusText(null);
                        Utils.emitEvent(false, 147020)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 147020)
                        } else {
                          Utils.emitEvent(false, 147020)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseMimeType': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setMimeType(null);
                        Utils.emitEvent(false, 147030)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 147030)
                        } else {
                          Utils.emitEvent(false, 147030)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseEncoding': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setEncoding(null);
                        Utils.emitEvent(false, 147040)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 147040)
                        } else {
                          Utils.emitEvent(false, 147040)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseHeaderNameNull': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setHeaderByName(null, 'test', true);
                        Utils.emitEvent(false, 147050)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 147050)
                        } else {
                          Utils.emitEvent(false, 147050)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseHeaderValueNull': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setHeaderByName('test', null, true);
                        Utils.emitEvent(false, 147060)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 147060)
                        } else {
                          Utils.emitEvent(false, 147060)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseHeaderOverwriteNull': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setHeaderByName('test', 'test', null);
                        Utils.emitEvent(false, 147070)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 147070)
                        } else {
                          Utils.emitEvent(false, 147070)
                        }
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
