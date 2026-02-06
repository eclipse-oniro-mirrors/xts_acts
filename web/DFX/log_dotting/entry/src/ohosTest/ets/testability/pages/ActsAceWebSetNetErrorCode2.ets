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
import { WebNetErrorList } from '@ohos.web.netErrorList'
const EVENT_ID_SET_EIMIT_KEY = 100000;

@Entry
@Component
struct webSetNetErrorCode2 {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  srcUrl: string = 'https://www.example.com/';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State emitKey: string = '';

  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: EVENT_ID_SET_EIMIT_KEY,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EIMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
              this.isReceive = 1;
          }
      }
  }

  build() {
      Column() {
          Row() {
              Button('web click')
              .key('webSetNetErrorCode2Button')
              .onClick(async () => {
                  await Utils.waitForExist(()=>this.isPageEnd, 'webSetNetErrorCode2ButtonIsPageEnd', 1, 1000);
                  await Utils.waitForExist(()=>this.isReceive, 'webSetNetErrorCode2ButtonIsReceive', 1, 1000);
                  console.info('key==>' + this.emitKey)
                  this.isReceive = -1;
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_NET_OK': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.NET_OK);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.NET_OK) {
                          Utils.emitEvent(true, 100010)
                        } else {
                          Utils.emitEvent(false, 100010)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100010)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_IO_PENDING': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_IO_PENDING);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_IO_PENDING) {
                          Utils.emitEvent(true, 100020)
                        } else {
                          Utils.emitEvent(false, 100020)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100020)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FAILED) {
                          Utils.emitEvent(true, 100030)
                        } else {
                          Utils.emitEvent(false, 100030)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100030)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_ABORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ABORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ABORTED) {
                          Utils.emitEvent(true, 100040)
                        } else {
                          Utils.emitEvent(false, 100040)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100040)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INVALID_ARGUMENT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_ARGUMENT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_INVALID_ARGUMENT) {
                          Utils.emitEvent(true, 100050)
                        } else {
                          Utils.emitEvent(false, 100050)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100050)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INVALID_HANDLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_HANDLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_INVALID_HANDLE) {
                          Utils.emitEvent(true, 100060)
                        } else {
                          Utils.emitEvent(false, 100060)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100060)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_NOT_FOUND': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_NOT_FOUND);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_NOT_FOUND) {
                          Utils.emitEvent(true, 100070)
                        } else {
                          Utils.emitEvent(false, 100070)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100070)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_TIMED_OUT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TIMED_OUT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_TIMED_OUT) {
                          Utils.emitEvent(true, 100080)
                        } else {
                          Utils.emitEvent(false, 100080)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100080)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_TOO_LARGE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_TOO_LARGE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_TOO_LARGE) {
                          Utils.emitEvent(true, 100090)
                        } else {
                          Utils.emitEvent(false, 100090)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100090)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_UNEXPECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNEXPECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_UNEXPECTED) {
                          Utils.emitEvent(true, 100100)
                        } else {
                          Utils.emitEvent(false, 100100)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 100100)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_ACCESS_DENIED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ACCESS_DENIED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ACCESS_DENIED) {
                          Utils.emitEvent(true, 100110)
                        } else {
                          Utils.emitEvent(false, 100110)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 100110)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_NOT_IMPLEMENTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NOT_IMPLEMENTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NOT_IMPLEMENTED) {
                          Utils.emitEvent(true, 100120)
                        } else {
                          Utils.emitEvent(false, 100120)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100120)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INSUFFICIENT_RESOURCES);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_INSUFFICIENT_RESOURCES) {
                          Utils.emitEvent(true, 100130)
                        } else {
                          Utils.emitEvent(false, 100130)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100130)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_OUT_OF_MEMORY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_OUT_OF_MEMORY);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_OUT_OF_MEMORY) {
                          Utils.emitEvent(true, 100140)
                        } else {
                          Utils.emitEvent(false, 100140)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100140)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UPLOAD_FILE_CHANGED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_UPLOAD_FILE_CHANGED) {
                          Utils.emitEvent(true, 100150)
                        } else {
                          Utils.emitEvent(false, 100150)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100150)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_NOT_CONNECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_NOT_CONNECTED) {
                          Utils.emitEvent(true, 100160)
                        } else {
                          Utils.emitEvent(false, 100160)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100160)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_EXISTS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_EXISTS);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_EXISTS) {
                          Utils.emitEvent(true, 100170)
                        } else {
                          Utils.emitEvent(false, 100170)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100170)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_PATH_TOO_LONG);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_PATH_TOO_LONG) {
                          Utils.emitEvent(true, 100180)
                        } else {
                          Utils.emitEvent(false, 100180)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 100180)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_NO_SPACE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_NO_SPACE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_NO_SPACE) {
                          Utils.emitEvent(true, 100190)
                        } else {
                          Utils.emitEvent(false, 100190)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100190)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_VIRUS_INFECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_VIRUS_INFECTED) {
                          Utils.emitEvent(true, 100200)
                        } else {
                          Utils.emitEvent(false, 100200)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100200)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_CLIENT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_CLIENT) {
                          Utils.emitEvent(true, 100210)
                        } else {
                          Utils.emitEvent(false, 100210)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100210)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NETWORK_CHANGED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_CHANGED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NETWORK_CHANGED) {
                          Utils.emitEvent(true, 100220)
                        } else {
                          Utils.emitEvent(false, 100220)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100220)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_ADMINISTRATOR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_ADMINISTRATOR) {
                          Utils.emitEvent(true, 100230)
                        } else {
                          Utils.emitEvent(false, 100230)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100230)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SOCKET_CONNECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_CONNECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_CONNECTED) {
                          Utils.emitEvent(true, 100240)
                        } else {
                          Utils.emitEvent(false, 100240)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100240)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED) {
                          Utils.emitEvent(true, 100250)
                        } else {
                          Utils.emitEvent(false, 100250)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100250)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONTEXT_SHUT_DOWN);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONTEXT_SHUT_DOWN) {
                          Utils.emitEvent(true, 100260)
                        } else {
                          Utils.emitEvent(false, 100260)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100260)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_RESPONSE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_RESPONSE) {
                          Utils.emitEvent(true, 100270)
                        } else {
                          Utils.emitEvent(false, 100270)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100270)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CLEARTEXT_NOT_PERMITTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CLEARTEXT_NOT_PERMITTED) {
                          Utils.emitEvent(true, 100280)
                        } else {
                          Utils.emitEvent(false, 100280)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100280)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_CSP': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_CSP);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_CSP) {
                          Utils.emitEvent(true, 100290)
                        } else {
                          Utils.emitEvent(false, 100290)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100290)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_H2_OR_QUIC_REQUIRED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_H2_OR_QUIC_REQUIRED) {
                          Utils.emitEvent(true, 100300)
                        } else {
                          Utils.emitEvent(false, 100300)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100300)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_ORB': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_ORB);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_ORB) {
                          Utils.emitEvent(true, 100310)
                        } else {
                          Utils.emitEvent(false, 100310)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100310)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_CLOSED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_CLOSED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_CLOSED) {
                          Utils.emitEvent(true, 100320)
                        } else {
                          Utils.emitEvent(false, 100320)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100320)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_RESET': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_RESET);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_RESET) {
                          Utils.emitEvent(true, 100330)
                        } else {
                          Utils.emitEvent(false, 100330)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100330)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_REFUSED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_REFUSED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_REFUSED) {
                          Utils.emitEvent(true, 100340)
                        } else {
                          Utils.emitEvent(false, 100340)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100340)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_ABORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_ABORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_ABORTED) {
                          Utils.emitEvent(true, 100350)
                        } else {
                          Utils.emitEvent(false, 100350)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100350)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_FAILED) {
                          Utils.emitEvent(true, 100360)
                        } else {
                          Utils.emitEvent(false, 100360)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100360)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NAME_NOT_RESOLVED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NAME_NOT_RESOLVED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NAME_NOT_RESOLVED) {
                          Utils.emitEvent(true, 100370)
                        } else {
                          Utils.emitEvent(false, 100370)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100370)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_INTERNET_DISCONNECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INTERNET_DISCONNECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_INTERNET_DISCONNECTED) {
                          Utils.emitEvent(true, 100380)
                        } else {
                          Utils.emitEvent(false, 100380)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100380)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_PROTOCOL_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_PROTOCOL_ERROR) {
                          Utils.emitEvent(true, 100390)
                        } else {
                          Utils.emitEvent(false, 100390)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100390)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ADDRESS_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ADDRESS_INVALID) {
                          Utils.emitEvent(true, 100400)
                        } else {
                          Utils.emitEvent(false, 100400)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100400)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_UNREACHABLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ADDRESS_UNREACHABLE) {
                          Utils.emitEvent(true, 100410)
                        } else {
                          Utils.emitEvent(false, 100410)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100410)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NEEDED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NEEDED) {
                          Utils.emitEvent(true, 100420)
                        } else {
                          Utils.emitEvent(false, 100420)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100420)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TUNNEL_CONNECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_TUNNEL_CONNECTION_FAILED) {
                          Utils.emitEvent(true, 100430)
                        } else {
                          Utils.emitEvent(false, 100430)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100430)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NO_SSL_VERSIONS_ENABLED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NO_SSL_VERSIONS_ENABLED) {
                          Utils.emitEvent(true, 100440)
                        } else {
                          Utils.emitEvent(false, 100440)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100440)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_VERSION_OR_CIPHER_MISMATCH);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_VERSION_OR_CIPHER_MISMATCH) {
                          Utils.emitEvent(true, 100450)
                        } else {
                          Utils.emitEvent(false, 100450)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100450)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_RENEGOTIATION_REQUESTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_RENEGOTIATION_REQUESTED) {
                          Utils.emitEvent(true, 100460)
                        } else {
                          Utils.emitEvent(false, 100460)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100460)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_UNSUPPORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_PROXY_AUTH_UNSUPPORTED) {
                          Utils.emitEvent(true, 100470)
                        } else {
                          Utils.emitEvent(false, 100470)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100470)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BAD_SSL_CLIENT_AUTH_CERT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BAD_SSL_CLIENT_AUTH_CERT) {
                          Utils.emitEvent(true, 100480)
                        } else {
                          Utils.emitEvent(false, 100480)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100480)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_TIMED_OUT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_TIMED_OUT) {
                          Utils.emitEvent(true, 100490)
                        } else {
                          Utils.emitEvent(false, 100490)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100490)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HOST_RESOLVER_QUEUE_TOO_LARGE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_HOST_RESOLVER_QUEUE_TOO_LARGE) {
                          Utils.emitEvent(true, 100500)
                        } else {
                          Utils.emitEvent(false, 100500)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100500)
                      }
                      break;
                    }
                  }
              })
          }
          Web({ src: this.srcUrl, controller: this.controller })
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 1;
          })
      }
  }
}
