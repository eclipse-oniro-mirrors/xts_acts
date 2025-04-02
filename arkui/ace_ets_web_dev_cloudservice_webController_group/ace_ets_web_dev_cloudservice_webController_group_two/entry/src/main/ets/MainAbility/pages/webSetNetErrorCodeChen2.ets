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
struct webSetNetErrorCodeChen2 {
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
              .key('webSetNetErrorCodeChen2')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.sleep(1000);
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_ERR_SOCKS_CONNECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKS_CONNECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKS_CONNECTION_FAILED) {
                          Utils.emitEvent(true, 3050)
                        } else {
                          Utils.emitEvent(false, 3050)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3050)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKS_CONNECTION_HOST_UNREACHABLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKS_CONNECTION_HOST_UNREACHABLE) {
                          Utils.emitEvent(true, 3051)
                        } else {
                          Utils.emitEvent(false, 3051)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3051)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ALPN_NEGOTIATION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ALPN_NEGOTIATION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ALPN_NEGOTIATION_FAILED) {
                          Utils.emitEvent(true, 3052)
                        } else {
                          Utils.emitEvent(false, 3052)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3052)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_NO_RENEGOTIATION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_NO_RENEGOTIATION);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_NO_RENEGOTIATION) {
                          Utils.emitEvent(true, 3053)
                        } else {
                          Utils.emitEvent(false, 3053)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3053)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES) {
                          Utils.emitEvent(true, 3054)
                        } else {
                          Utils.emitEvent(false, 3054)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3054)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_DECOMPRESSION_FAILURE_ALERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_DECOMPRESSION_FAILURE_ALERT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_DECOMPRESSION_FAILURE_ALERT) {
                          Utils.emitEvent(true, 3055)
                        } else {
                          Utils.emitEvent(false, 3055)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3055)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_BAD_RECORD_MAC_ALERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_BAD_RECORD_MAC_ALERT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_BAD_RECORD_MAC_ALERT) {
                          Utils.emitEvent(true, 3056)
                        } else {
                          Utils.emitEvent(false, 3056)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3056)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_PROXY_AUTH_REQUESTED) {
                          Utils.emitEvent(true, 3057)
                        } else {
                          Utils.emitEvent(false, 3057)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3057)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_PROXY_CONNECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_CONNECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_PROXY_CONNECTION_FAILED) {
                          Utils.emitEvent(true, 3058)
                        } else {
                          Utils.emitEvent(false, 3058)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3058)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_MANDATORY_PROXY_CONFIGURATION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_MANDATORY_PROXY_CONFIGURATION_FAILED) {
                          Utils.emitEvent(true, 3059)
                        } else {
                          Utils.emitEvent(false, 3059)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3059)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_PRECONNECT_MAX_SOCKET_LIMIT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PRECONNECT_MAX_SOCKET_LIMIT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_PRECONNECT_MAX_SOCKET_LIMIT) {
                          Utils.emitEvent(true, 3060)
                        } else {
                          Utils.emitEvent(false, 3060)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3060)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED) {
                          Utils.emitEvent(true, 3061)
                        } else {
                          Utils.emitEvent(false, 3061)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3061)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY) {
                          Utils.emitEvent(true, 3062)
                        } else {
                          Utils.emitEvent(false, 3062)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3062)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_PROXY_CERTIFICATE_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_CERTIFICATE_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_PROXY_CERTIFICATE_INVALID) {
                          Utils.emitEvent(true, 3063)
                        } else {
                          Utils.emitEvent(false, 3063)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3063)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NAME_RESOLUTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NAME_RESOLUTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NAME_RESOLUTION_FAILED) {
                          Utils.emitEvent(true, 3064)
                        } else {
                          Utils.emitEvent(false, 3064)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3064)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NETWORK_ACCESS_DENIED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_ACCESS_DENIED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NETWORK_ACCESS_DENIED) {
                          Utils.emitEvent(true, 3065)
                        } else {
                          Utils.emitEvent(false, 3065)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3065)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_TEMPORARILY_THROTTLED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TEMPORARILY_THROTTLED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_TEMPORARILY_THROTTLED) {
                          Utils.emitEvent(true, 3066)
                        } else {
                          Utils.emitEvent(false, 3066)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3066)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT) {
                          Utils.emitEvent(true, 3067)
                        } else {
                          Utils.emitEvent(false, 3067)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3067)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED) {
                          Utils.emitEvent(true, 3068)
                        } else {
                          Utils.emitEvent(false, 3068)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3068)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_MSG_TOO_BIG': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_MSG_TOO_BIG);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_MSG_TOO_BIG) {
                          Utils.emitEvent(true, 3069)
                        } else {
                          Utils.emitEvent(false, 3069)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3069)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_WS_PROTOCOL_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_WS_PROTOCOL_ERROR) {
                          Utils.emitEvent(true, 3070)
                        } else {
                          Utils.emitEvent(false, 3070)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3070)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_WS_PROTOCOL_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_WS_PROTOCOL_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_WS_PROTOCOL_ERROR) {
                          Utils.emitEvent(true, 3070)
                        } else {
                          Utils.emitEvent(false, 3070)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3070)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ADDRESS_IN_USE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_IN_USE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ADDRESS_IN_USE) {
                          Utils.emitEvent(true, 3071)
                        } else {
                          Utils.emitEvent(false, 3071)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3071)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_HANDSHAKE_NOT_COMPLETED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_HANDSHAKE_NOT_COMPLETED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_HANDSHAKE_NOT_COMPLETED) {
                          Utils.emitEvent(true, 3072)
                        } else {
                          Utils.emitEvent(false, 3072)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3072)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_BAD_PEER_PUBLIC_KEY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_BAD_PEER_PUBLIC_KEY);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_BAD_PEER_PUBLIC_KEY) {
                          Utils.emitEvent(true, 3073)
                        } else {
                          Utils.emitEvent(false, 3073)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3073)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN) {
                          Utils.emitEvent(true, 3074)
                        } else {
                          Utils.emitEvent(false, 3074)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3074)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED) {
                          Utils.emitEvent(true, 3075)
                        } else {
                          Utils.emitEvent(false, 3075)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3075)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_DECRYPT_ERROR_ALERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_DECRYPT_ERROR_ALERT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_DECRYPT_ERROR_ALERT) {
                          Utils.emitEvent(true, 3076)
                        } else {
                          Utils.emitEvent(false, 3076)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3076)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_WS_THROTTLE_QUEUE_TOO_LARGE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_WS_THROTTLE_QUEUE_TOO_LARGE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_WS_THROTTLE_QUEUE_TOO_LARGE) {
                          Utils.emitEvent(true, 3077)
                        } else {
                          Utils.emitEvent(false, 3077)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3077)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_SERVER_CERT_CHANGED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_SERVER_CERT_CHANGED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_SERVER_CERT_CHANGED) {
                          Utils.emitEvent(true, 3078)
                        } else {
                          Utils.emitEvent(false, 3078)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3078)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_UNRECOGNIZED_NAME_ALERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_UNRECOGNIZED_NAME_ALERT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_UNRECOGNIZED_NAME_ALERT) {
                          Utils.emitEvent(true, 3079)
                        } else {
                          Utils.emitEvent(false, 3079)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3079)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR) {
                          Utils.emitEvent(true, 3080)
                        } else {
                          Utils.emitEvent(false, 3080)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3080)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR) {
                          Utils.emitEvent(true, 3081)
                        } else {
                          Utils.emitEvent(false, 3081)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3081)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE) {
                          Utils.emitEvent(true, 3082)
                        } else {
                          Utils.emitEvent(false, 3082)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3082)
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
