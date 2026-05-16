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
const EVENT_ID_SET_EIMIT_KEY = 107000;

@Entry
@Component
struct webSetNetErrorCodeChen2 {
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
              .key('webSetNetErrorCodeChen2')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.waitForExist(()=>this.isPageEnd, 'webSetNetErrorCodeChen2ButtonIsPageEnd', 1, 1000);
                  await Utils.waitForExist(()=>this.isReceive, 'webSetNetErrorCodeChen2ButtonIsPageEnd', 1, 1000);
                  this.isReceive = -1;
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_ERR_SOCKS_CONNECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKS_CONNECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKS_CONNECTION_FAILED) {
                          Utils.emitEvent(true, 107010)
                        } else {
                          Utils.emitEvent(false, 107010)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107010)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKS_CONNECTION_HOST_UNREACHABLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKS_CONNECTION_HOST_UNREACHABLE) {
                          Utils.emitEvent(true, 107020)
                        } else {
                          Utils.emitEvent(false, 107020)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107020)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ALPN_NEGOTIATION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ALPN_NEGOTIATION_FAILED) {
                          Utils.emitEvent(true, 107030)
                        } else {
                          Utils.emitEvent(false, 107030)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107030)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_NO_RENEGOTIATION);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_NO_RENEGOTIATION) {
                          Utils.emitEvent(true, 107040)
                        } else {
                          Utils.emitEvent(false, 107040)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107040)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES) {
                          Utils.emitEvent(true, 107050)
                        } else {
                          Utils.emitEvent(false, 107050)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107050)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_DECOMPRESSION_FAILURE_ALERT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_DECOMPRESSION_FAILURE_ALERT) {
                          Utils.emitEvent(true, 107060)
                        } else {
                          Utils.emitEvent(false, 107060)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107060)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_BAD_RECORD_MAC_ALERT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_BAD_RECORD_MAC_ALERT) {
                          Utils.emitEvent(true, 107070)
                        } else {
                          Utils.emitEvent(false, 107070)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107070)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_PROXY_AUTH_REQUESTED) {
                          Utils.emitEvent(true, 107080)
                        } else {
                          Utils.emitEvent(false, 107080)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107080)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_CONNECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_PROXY_CONNECTION_FAILED) {
                          Utils.emitEvent(true, 107090)
                        } else {
                          Utils.emitEvent(false, 107090)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107090)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_MANDATORY_PROXY_CONFIGURATION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_MANDATORY_PROXY_CONFIGURATION_FAILED) {
                          Utils.emitEvent(true, 107100)
                        } else {
                          Utils.emitEvent(false, 107100)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107100)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PRECONNECT_MAX_SOCKET_LIMIT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_PRECONNECT_MAX_SOCKET_LIMIT) {
                          Utils.emitEvent(true, 107110)
                        } else {
                          Utils.emitEvent(false, 107110)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107110)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED) {
                          Utils.emitEvent(true, 107120)
                        } else {
                          Utils.emitEvent(false, 107120)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107120)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY) {
                          Utils.emitEvent(true, 107130)
                        } else {
                          Utils.emitEvent(false, 107130)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107130)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_CERTIFICATE_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_PROXY_CERTIFICATE_INVALID) {
                          Utils.emitEvent(true, 107140)
                        } else {
                          Utils.emitEvent(false, 107140)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107140)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NAME_RESOLUTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NAME_RESOLUTION_FAILED) {
                          Utils.emitEvent(true, 107150)
                        } else {
                          Utils.emitEvent(false, 107150)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107150)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_ACCESS_DENIED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NETWORK_ACCESS_DENIED) {
                          Utils.emitEvent(true, 107160)
                        } else {
                          Utils.emitEvent(false, 107160)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107160)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TEMPORARILY_THROTTLED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_TEMPORARILY_THROTTLED) {
                          Utils.emitEvent(true, 107170)
                        } else {
                          Utils.emitEvent(false, 107170)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107170)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT) {
                          Utils.emitEvent(true, 107180)
                        } else {
                          Utils.emitEvent(false, 107180)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107180)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED) {
                          Utils.emitEvent(true, 107190)
                        } else {
                          Utils.emitEvent(false, 107190)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107190)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_MSG_TOO_BIG': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_MSG_TOO_BIG);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_MSG_TOO_BIG) {
                          Utils.emitEvent(true, 107200)
                        } else {
                          Utils.emitEvent(false, 107200)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107200)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_WS_PROTOCOL_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_WS_PROTOCOL_ERROR) {
                          Utils.emitEvent(true, 107210)
                        } else {
                          Utils.emitEvent(false, 107210)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107210)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ADDRESS_IN_USE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_IN_USE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ADDRESS_IN_USE) {
                          Utils.emitEvent(true, 107220)
                        } else {
                          Utils.emitEvent(false, 107220)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107220)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_HANDSHAKE_NOT_COMPLETED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_HANDSHAKE_NOT_COMPLETED) {
                          Utils.emitEvent(true, 107230)
                        } else {
                          Utils.emitEvent(false, 107230)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107230)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_BAD_PEER_PUBLIC_KEY);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_BAD_PEER_PUBLIC_KEY) {
                          Utils.emitEvent(true, 107240)
                        } else {
                          Utils.emitEvent(false, 107240)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107240)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN) {
                          Utils.emitEvent(true, 107250)
                        } else {
                          Utils.emitEvent(false, 107250)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107250)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED) {
                          Utils.emitEvent(true, 107260)
                        } else {
                          Utils.emitEvent(false, 107260)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107260)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_DECRYPT_ERROR_ALERT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_DECRYPT_ERROR_ALERT) {
                          Utils.emitEvent(true, 107270)
                        } else {
                          Utils.emitEvent(false, 107270)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107270)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_WS_THROTTLE_QUEUE_TOO_LARGE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_WS_THROTTLE_QUEUE_TOO_LARGE) {
                          Utils.emitEvent(true, 107280)
                        } else {
                          Utils.emitEvent(false, 107280)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107280)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_SERVER_CERT_CHANGED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_SERVER_CERT_CHANGED) {
                          Utils.emitEvent(true, 107290)
                        } else {
                          Utils.emitEvent(false, 107290)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107290)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_UNRECOGNIZED_NAME_ALERT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_UNRECOGNIZED_NAME_ALERT) {
                          Utils.emitEvent(true, 107300)
                        } else {
                          Utils.emitEvent(false, 107300)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107300)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR) {
                          Utils.emitEvent(true, 107310)
                        } else {
                          Utils.emitEvent(false, 107310)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107310)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR) {
                          Utils.emitEvent(true, 107320)
                        } else {
                          Utils.emitEvent(false, 107320)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107320)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE) {
                          Utils.emitEvent(true, 107330)
                        } else {
                          Utils.emitEvent(false, 107330)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 107330)
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