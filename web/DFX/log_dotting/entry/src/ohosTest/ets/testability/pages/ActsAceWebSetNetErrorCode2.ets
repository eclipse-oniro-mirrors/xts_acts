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
struct webSetNetErrorCode2 {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
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
              .key('webSetNetErrorCode2Button')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.sleep(1000);
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_NET_OK': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.NET_OK);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.NET_OK) {
                          Utils.emitEvent(true, 3000)
                        } else {
                          Utils.emitEvent(false, 3000)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3000)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_IO_PENDING': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_IO_PENDING);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_IO_PENDING) {
                          Utils.emitEvent(true, 3001)
                        } else {
                          Utils.emitEvent(false, 3001)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3001)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FAILED) {
                          Utils.emitEvent(true, 3002)
                        } else {
                          Utils.emitEvent(false, 3002)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3002)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_ABORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ABORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ABORTED) {
                          Utils.emitEvent(true, 3003)
                        } else {
                          Utils.emitEvent(false, 3003)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3003)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INVALID_ARGUMENT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_ARGUMENT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_INVALID_ARGUMENT) {
                          Utils.emitEvent(true, 3004)
                        } else {
                          Utils.emitEvent(false, 3004)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3004)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INVALID_HANDLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_HANDLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_INVALID_HANDLE) {
                          Utils.emitEvent(true, 3005)
                        } else {
                          Utils.emitEvent(false, 3005)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3005)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_NOT_FOUND': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_NOT_FOUND);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_NOT_FOUND) {
                          Utils.emitEvent(true, 3006)
                        } else {
                          Utils.emitEvent(false, 3006)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3006)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_TIMED_OUT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TIMED_OUT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_TIMED_OUT) {
                          Utils.emitEvent(true, 3007)
                        } else {
                          Utils.emitEvent(false, 3007)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3007)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_TOO_LARGE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_TOO_LARGE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_TOO_LARGE) {
                          Utils.emitEvent(true, 3008)
                        } else {
                          Utils.emitEvent(false, 3008)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3008)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_UNEXPECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNEXPECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_UNEXPECTED) {
                          Utils.emitEvent(true, 3009)
                        } else {
                          Utils.emitEvent(false, 3009)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 3009)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_ACCESS_DENIED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ACCESS_DENIED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ACCESS_DENIED) {
                          Utils.emitEvent(true, 3010)
                        } else {
                          Utils.emitEvent(false, 3010)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 3010)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_NOT_IMPLEMENTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NOT_IMPLEMENTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NOT_IMPLEMENTED) {
                          Utils.emitEvent(true, 3011)
                        } else {
                          Utils.emitEvent(false, 3011)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3011)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INSUFFICIENT_RESOURCES': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INSUFFICIENT_RESOURCES);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_INSUFFICIENT_RESOURCES) {
                          Utils.emitEvent(true, 3012)
                        } else {
                          Utils.emitEvent(false, 3012)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3012)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_OUT_OF_MEMORY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_OUT_OF_MEMORY);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_OUT_OF_MEMORY) {
                          Utils.emitEvent(true, 3013)
                        } else {
                          Utils.emitEvent(false, 3013)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3013)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_UPLOAD_FILE_CHANGED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UPLOAD_FILE_CHANGED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_UPLOAD_FILE_CHANGED) {
                          Utils.emitEvent(true, 3014)
                        } else {
                          Utils.emitEvent(false, 3014)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3014)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_SOCKET_NOT_CONNECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_NOT_CONNECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_NOT_CONNECTED) {
                          Utils.emitEvent(true, 3015)
                        } else {
                          Utils.emitEvent(false, 3015)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3015)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_EXISTS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_EXISTS);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_EXISTS) {
                          Utils.emitEvent(true, 3016)
                        } else {
                          Utils.emitEvent(false, 3016)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3016)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_PATH_TOO_LONG': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_PATH_TOO_LONG);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_PATH_TOO_LONG) {
                          Utils.emitEvent(true, 3017)
                        } else {
                          Utils.emitEvent(false, 3017)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 3017)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_NO_SPACE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_NO_SPACE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_NO_SPACE) {
                          Utils.emitEvent(true, 3018)
                        } else {
                          Utils.emitEvent(false, 3018)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3018)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FILE_VIRUS_INFECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FILE_VIRUS_INFECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_FILE_VIRUS_INFECTED) {
                          Utils.emitEvent(true, 3019)
                        } else {
                          Utils.emitEvent(false, 3019)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3019)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_CLIENT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_CLIENT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_CLIENT) {
                          Utils.emitEvent(true, 3020)
                        } else {
                          Utils.emitEvent(false, 3020)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3020)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NETWORK_CHANGED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_CHANGED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NETWORK_CHANGED) {
                          Utils.emitEvent(true, 3021)
                        } else {
                          Utils.emitEvent(false, 3021)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3021)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_ADMINISTRATOR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_ADMINISTRATOR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_ADMINISTRATOR) {
                          Utils.emitEvent(true, 3022)
                        } else {
                          Utils.emitEvent(false, 3022)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3022)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SOCKET_CONNECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_CONNECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_CONNECTED) {
                          Utils.emitEvent(true, 3023)
                        } else {
                          Utils.emitEvent(false, 3023)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3023)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED) {
                          Utils.emitEvent(true, 3024)
                        } else {
                          Utils.emitEvent(false, 3024)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3024)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONTEXT_SHUT_DOWN);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONTEXT_SHUT_DOWN) {
                          Utils.emitEvent(true, 3025)
                        } else {
                          Utils.emitEvent(false, 3025)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3025)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_RESPONSE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_RESPONSE) {
                          Utils.emitEvent(true, 3026)
                        } else {
                          Utils.emitEvent(false, 3026)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3026)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CLEARTEXT_NOT_PERMITTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CLEARTEXT_NOT_PERMITTED) {
                          Utils.emitEvent(true, 3027)
                        } else {
                          Utils.emitEvent(false, 3027)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3027)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_CSP': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_CSP);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_CSP) {
                          Utils.emitEvent(true, 3028)
                        } else {
                          Utils.emitEvent(false, 3028)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3028)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_H2_OR_QUIC_REQUIRED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_H2_OR_QUIC_REQUIRED) {
                          Utils.emitEvent(true, 3029)
                        } else {
                          Utils.emitEvent(false, 3029)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3029)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_ORB': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_ORB);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_ORB) {
                          Utils.emitEvent(true, 3030)
                        } else {
                          Utils.emitEvent(false, 3030)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3030)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_CLOSED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_CLOSED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_CLOSED) {
                          Utils.emitEvent(true, 3031)
                        } else {
                          Utils.emitEvent(false, 3031)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3031)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_RESET': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_RESET);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_RESET) {
                          Utils.emitEvent(true, 3032)
                        } else {
                          Utils.emitEvent(false, 3032)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3032)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_REFUSED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_REFUSED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_REFUSED) {
                          Utils.emitEvent(true, 3033)
                        } else {
                          Utils.emitEvent(false, 3033)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3033)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_ABORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_ABORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_ABORTED) {
                          Utils.emitEvent(true, 3034)
                        } else {
                          Utils.emitEvent(false, 3034)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3034)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_FAILED) {
                          Utils.emitEvent(true, 3035)
                        } else {
                          Utils.emitEvent(false, 3035)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3035)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NAME_NOT_RESOLVED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NAME_NOT_RESOLVED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NAME_NOT_RESOLVED) {
                          Utils.emitEvent(true, 3036)
                        } else {
                          Utils.emitEvent(false, 3036)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3036)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_INTERNET_DISCONNECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INTERNET_DISCONNECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_INTERNET_DISCONNECTED) {
                          Utils.emitEvent(true, 3037)
                        } else {
                          Utils.emitEvent(false, 3037)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3037)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_PROTOCOL_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_PROTOCOL_ERROR) {
                          Utils.emitEvent(true, 3038)
                        } else {
                          Utils.emitEvent(false, 3038)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3038)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ADDRESS_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ADDRESS_INVALID) {
                          Utils.emitEvent(true, 3039)
                        } else {
                          Utils.emitEvent(false, 3039)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3039)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_UNREACHABLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ADDRESS_UNREACHABLE) {
                          Utils.emitEvent(true, 3040)
                        } else {
                          Utils.emitEvent(false, 3040)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3040)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NEEDED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NEEDED) {
                          Utils.emitEvent(true, 3041)
                        } else {
                          Utils.emitEvent(false, 3041)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3041)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TUNNEL_CONNECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_TUNNEL_CONNECTION_FAILED) {
                          Utils.emitEvent(true, 3042)
                        } else {
                          Utils.emitEvent(false, 3042)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3042)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NO_SSL_VERSIONS_ENABLED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NO_SSL_VERSIONS_ENABLED) {
                          Utils.emitEvent(true, 3043)
                        } else {
                          Utils.emitEvent(false, 3043)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3043)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_VERSION_OR_CIPHER_MISMATCH);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_VERSION_OR_CIPHER_MISMATCH) {
                          Utils.emitEvent(true, 3044)
                        } else {
                          Utils.emitEvent(false, 3044)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3044)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_RENEGOTIATION_REQUESTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_RENEGOTIATION_REQUESTED) {
                          Utils.emitEvent(true, 3045)
                        } else {
                          Utils.emitEvent(false, 3045)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3045)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_UNSUPPORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_PROXY_AUTH_UNSUPPORTED) {
                          Utils.emitEvent(true, 3046)
                        } else {
                          Utils.emitEvent(false, 3046)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3046)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BAD_SSL_CLIENT_AUTH_CERT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BAD_SSL_CLIENT_AUTH_CERT) {
                          Utils.emitEvent(true, 3047)
                        } else {
                          Utils.emitEvent(false, 3047)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3047)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_TIMED_OUT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_TIMED_OUT) {
                          Utils.emitEvent(true, 3048)
                        } else {
                          Utils.emitEvent(false, 3048)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3048)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HOST_RESOLVER_QUEUE_TOO_LARGE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_HOST_RESOLVER_QUEUE_TOO_LARGE) {
                          Utils.emitEvent(true, 3049)
                        } else {
                          Utils.emitEvent(false, 3049)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3049)
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
