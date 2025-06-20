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
struct webSetResponse {
  controller: webview.WebviewController = new webview.WebviewController();
  srcUrl: string = 'https://www.example.com/';

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
              .key('webSetNetErrorCode')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.sleep(1000);
                  switch (this.emitKey) {
                    case 'emitWebSetResponseStatus': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setStatus(null);
                        Utils.emitEvent(false, 1001)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 1001)
                        } else {
                          Utils.emitEvent(false, 1001)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseStatusText': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setStatusText(null);
                        Utils.emitEvent(false, 1002)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 1002)
                        } else {
                          Utils.emitEvent(false, 1002)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseMimeType': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setMimeType(null);
                        Utils.emitEvent(false, 1003)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 1003)
                        } else {
                          Utils.emitEvent(false, 1003)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseEncoding': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setEncoding(null);
                        Utils.emitEvent(false, 1004)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 1004)
                        } else {
                          Utils.emitEvent(false, 1004)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseHeaderNameNull': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setHeaderByName(null, 'test', true);
                        Utils.emitEvent(false, 1005)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 1005)
                        } else {
                          Utils.emitEvent(false, 1005)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseHeaderValueNull': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setHeaderByName('test', null, true);
                        Utils.emitEvent(false, 1006)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 1006)
                        } else {
                          Utils.emitEvent(false, 1006)
                        }
                      }
                      break;
                    }

                    case 'emitWebSetResponseHeaderOverwriteNull': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setHeaderByName('test', 'test', null);
                        Utils.emitEvent(false, 1007)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if (e.code == 401) {
                          Utils.emitEvent(true, 1007)
                        } else {
                          Utils.emitEvent(false, 1007)
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
