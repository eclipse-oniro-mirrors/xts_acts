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
struct webSetNetErrorCodeChen1 {
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
              .key('webSetNetErrorCodeChen1Button')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.sleep(1000);
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE) {
                          Utils.emitEvent(true, 3083)
                        } else {
                          Utils.emitEvent(false, 3083)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3083)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT) {
                          Utils.emitEvent(true, 3084)
                        } else {
                          Utils.emitEvent(false, 3084)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3084)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ICANN_NAME_COLLISION);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ICANN_NAME_COLLISION) {
                          Utils.emitEvent(true, 3085)
                        } else {
                          Utils.emitEvent(false, 3085)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3085)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_SERVER_CERT_BAD_FORMAT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_SERVER_CERT_BAD_FORMAT) {
                          Utils.emitEvent(true, 3086)
                        } else {
                          Utils.emitEvent(false, 3086)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3086)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CT_STH_PARSING_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CT_STH_PARSING_FAILED) {
                          Utils.emitEvent(true, 3087)
                        } else {
                          Utils.emitEvent(false, 3087)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3087)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CT_STH_INCOMPLETE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CT_STH_INCOMPLETE) {
                          Utils.emitEvent(true, 3088)
                        } else {
                          Utils.emitEvent(false, 3088)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3088)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH) {
                          Utils.emitEvent(true, 3089)
                        } else {
                          Utils.emitEvent(false, 3089)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3089)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED) {
                          Utils.emitEvent(true, 3090)
                        } else {
                          Utils.emitEvent(false, 3090)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3090)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_OBSOLETE_CIPHER);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_OBSOLETE_CIPHER) {
                          Utils.emitEvent(true, 3091)
                        } else {
                          Utils.emitEvent(false, 3091)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3091)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_WS_UPGRADE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_WS_UPGRADE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_WS_UPGRADE) {
                          Utils.emitEvent(true, 3092)
                        } else {
                          Utils.emitEvent(false, 3092)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3092)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_READ_IF_READY_NOT_IMPLEMENTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_READ_IF_READY_NOT_IMPLEMENTED) {
                          Utils.emitEvent(true, 3093)
                        } else {
                          Utils.emitEvent(false, 3093)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3093)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NO_BUFFER_SPACE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NO_BUFFER_SPACE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NO_BUFFER_SPACE) {
                          Utils.emitEvent(true, 3094)
                        } else {
                          Utils.emitEvent(false, 3094)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3094)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS) {
                          Utils.emitEvent(true, 3095)
                        } else {
                          Utils.emitEvent(false, 3095)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3095)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_EARLY_DATA_REJECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_EARLY_DATA_REJECTED) {
                          Utils.emitEvent(true, 3096)
                        } else {
                          Utils.emitEvent(false, 3096)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3096)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_WRONG_VERSION_ON_EARLY_DATA);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_WRONG_VERSION_ON_EARLY_DATA) {
                          Utils.emitEvent(true, 3097)
                        } else {
                          Utils.emitEvent(false, 3097)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3097)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TLS13_DOWNGRADE_DETECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_TLS13_DOWNGRADE_DETECTED) {
                          Utils.emitEvent(true, 3098)
                        } else {
                          Utils.emitEvent(false, 3098)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3098)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_KEY_USAGE_INCOMPATIBLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_KEY_USAGE_INCOMPATIBLE) {
                          Utils.emitEvent(true, 3099)
                        } else {
                          Utils.emitEvent(false, 3099)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3099)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_ECH_CONFIG_LIST);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_INVALID_ECH_CONFIG_LIST) {
                          Utils.emitEvent(true, 3100)
                        } else {
                          Utils.emitEvent(false, 3100)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3100)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ECH_NOT_NEGOTIATED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ECH_NOT_NEGOTIATED) {
                          Utils.emitEvent(true, 3101)
                        } else {
                          Utils.emitEvent(false, 3101)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3101)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ECH_FALLBACK_CERTIFICATE_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ECH_FALLBACK_CERTIFICATE_INVALID) {
                          Utils.emitEvent(true, 3102)
                        } else {
                          Utils.emitEvent(false, 3102)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3102)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_COMMON_NAME_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_COMMON_NAME_INVALID) {
                          Utils.emitEvent(true, 3103)
                        } else {
                          Utils.emitEvent(false, 3103)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3103)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_DATE_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_DATE_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_DATE_INVALID) {
                          Utils.emitEvent(true, 3104)
                        } else {
                          Utils.emitEvent(false, 3104)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3104)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_AUTHORITY_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_AUTHORITY_INVALID) {
                          Utils.emitEvent(true, 3105)
                        } else {
                          Utils.emitEvent(false, 3105)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3105)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_CONTAINS_ERRORS);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_CONTAINS_ERRORS) {
                          Utils.emitEvent(true, 3106)
                        } else {
                          Utils.emitEvent(false, 3106)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3106)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_NO_REVOCATION_MECHANISM);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_NO_REVOCATION_MECHANISM) {
                          Utils.emitEvent(true, 3107)
                        } else {
                          Utils.emitEvent(false, 3107)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3107)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_UNABLE_TO_CHECK_REVOCATION);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_UNABLE_TO_CHECK_REVOCATION) {
                          Utils.emitEvent(true, 3108)
                        } else {
                          Utils.emitEvent(false, 3108)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3108)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_REVOKED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_REVOKED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_REVOKED) {
                          Utils.emitEvent(true, 3109)
                        } else {
                          Utils.emitEvent(false, 3109)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3109)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_INVALID) {
                          Utils.emitEvent(true, 3110)
                        } else {
                          Utils.emitEvent(false, 3110)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3110)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_WEAK_SIGNATURE_ALGORITHM);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_WEAK_SIGNATURE_ALGORITHM) {
                          Utils.emitEvent(true, 3111)
                        } else {
                          Utils.emitEvent(false, 3111)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3111)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_NON_UNIQUE_NAME);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_NON_UNIQUE_NAME) {
                          Utils.emitEvent(true, 3112)
                        } else {
                          Utils.emitEvent(false, 3112)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3112)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_WEAK_KEY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_WEAK_KEY);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_WEAK_KEY) {
                          Utils.emitEvent(true, 3113)
                        } else {
                          Utils.emitEvent(false, 3113)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3113)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_NAME_CONSTRAINT_VIOLATION);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_NAME_CONSTRAINT_VIOLATION) {
                          Utils.emitEvent(true, 3114)
                        } else {
                          Utils.emitEvent(false, 3114)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3114)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_VALIDITY_TOO_LONG);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_VALIDITY_TOO_LONG) {
                          Utils.emitEvent(true, 3115)
                        } else {
                          Utils.emitEvent(false, 3115)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3115)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERTIFICATE_TRANSPARENCY_REQUIRED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERTIFICATE_TRANSPARENCY_REQUIRED) {
                          Utils.emitEvent(true, 3116)
                        } else {
                          Utils.emitEvent(false, 3116)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3116)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_SYMANTEC_LEGACY);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_SYMANTEC_LEGACY) {
                          Utils.emitEvent(true, 3117)
                        } else {
                          Utils.emitEvent(false, 3117)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3117)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_KNOWN_INTERCEPTION_BLOCKED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_KNOWN_INTERCEPTION_BLOCKED) {
                          Utils.emitEvent(true, 3118)
                        } else {
                          Utils.emitEvent(false, 3118)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3118)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_OBSOLETE_VERSION_OR_CIPHER);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_OBSOLETE_VERSION_OR_CIPHER) {
                          Utils.emitEvent(true, 3119)
                        } else {
                          Utils.emitEvent(false, 3119)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3119)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_END': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_END);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_END) {
                          Utils.emitEvent(true, 3120)
                        } else {
                          Utils.emitEvent(false, 3120)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 3120)
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
