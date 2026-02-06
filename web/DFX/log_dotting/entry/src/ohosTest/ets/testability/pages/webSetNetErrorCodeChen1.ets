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
const EVENT_ID_SET_EIMIT_KEY = 106000;

@Entry
@Component
struct webSetNetErrorCodeChen1 {
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
              .key('webSetNetErrorCodeChen1Button')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.waitForExist(()=>this.isPageEnd, 'webSetNetErrorCodeChen1ButtonIsPageEnd', 1, 1000);
                  await Utils.waitForExist(()=>this.isReceive, 'webSetNetErrorCodeChen1ButtonIsReceive', 1, 1000);
                  this.isReceive = -1;
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE) {
                          Utils.emitEvent(true, 106010)
                        } else {
                          Utils.emitEvent(false, 106010)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106010)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT) {
                          Utils.emitEvent(true, 106020)
                        } else {
                          Utils.emitEvent(false, 106020)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106020)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ICANN_NAME_COLLISION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ICANN_NAME_COLLISION);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ICANN_NAME_COLLISION) {
                          Utils.emitEvent(true, 106030)
                        } else {
                          Utils.emitEvent(false, 106030)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106030)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_SERVER_CERT_BAD_FORMAT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_SERVER_CERT_BAD_FORMAT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_SERVER_CERT_BAD_FORMAT) {
                          Utils.emitEvent(true, 106040)
                        } else {
                          Utils.emitEvent(false, 106040)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106040)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CT_STH_PARSING_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CT_STH_PARSING_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CT_STH_PARSING_FAILED) {
                          Utils.emitEvent(true, 106050)
                        } else {
                          Utils.emitEvent(false, 106050)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106050)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CT_STH_INCOMPLETE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CT_STH_INCOMPLETE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CT_STH_INCOMPLETE) {
                          Utils.emitEvent(true, 106060)
                        } else {
                          Utils.emitEvent(false, 106060)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106060)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH) {
                          Utils.emitEvent(true, 106070)
                        } else {
                          Utils.emitEvent(false, 106070)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106070)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED) {
                          Utils.emitEvent(true, 106080)
                        } else {
                          Utils.emitEvent(false, 106080)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106080)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_OBSOLETE_CIPHER': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_OBSOLETE_CIPHER);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_OBSOLETE_CIPHER) {
                          Utils.emitEvent(true, 106090)
                        } else {
                          Utils.emitEvent(false, 106090)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106090)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_WS_UPGRADE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_WS_UPGRADE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_WS_UPGRADE) {
                          Utils.emitEvent(true, 106100)
                        } else {
                          Utils.emitEvent(false, 106100)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106100)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_READ_IF_READY_NOT_IMPLEMENTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_READ_IF_READY_NOT_IMPLEMENTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_READ_IF_READY_NOT_IMPLEMENTED) {
                          Utils.emitEvent(true, 106110)
                        } else {
                          Utils.emitEvent(false, 106110)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106110)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NO_BUFFER_SPACE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NO_BUFFER_SPACE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NO_BUFFER_SPACE) {
                          Utils.emitEvent(true, 106120)
                        } else {
                          Utils.emitEvent(false, 106120)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106120)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS) {
                          Utils.emitEvent(true, 106130)
                        } else {
                          Utils.emitEvent(false, 106130)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106130)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_EARLY_DATA_REJECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_EARLY_DATA_REJECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_EARLY_DATA_REJECTED) {
                          Utils.emitEvent(true, 106140)
                        } else {
                          Utils.emitEvent(false, 106140)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106140)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_WRONG_VERSION_ON_EARLY_DATA': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_WRONG_VERSION_ON_EARLY_DATA);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_WRONG_VERSION_ON_EARLY_DATA) {
                          Utils.emitEvent(true, 106150)
                        } else {
                          Utils.emitEvent(false, 106150)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106150)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_TLS13_DOWNGRADE_DETECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TLS13_DOWNGRADE_DETECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_TLS13_DOWNGRADE_DETECTED) {
                          Utils.emitEvent(true, 106160)
                        } else {
                          Utils.emitEvent(false, 106160)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106160)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_KEY_USAGE_INCOMPATIBLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_KEY_USAGE_INCOMPATIBLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_KEY_USAGE_INCOMPATIBLE) {
                          Utils.emitEvent(true, 106170)
                        } else {
                          Utils.emitEvent(false, 106170)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106170)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_INVALID_ECH_CONFIG_LIST': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_ECH_CONFIG_LIST);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_INVALID_ECH_CONFIG_LIST) {
                          Utils.emitEvent(true, 106180)
                        } else {
                          Utils.emitEvent(false, 106180)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106180)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ECH_NOT_NEGOTIATED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ECH_NOT_NEGOTIATED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ECH_NOT_NEGOTIATED) {
                          Utils.emitEvent(true, 106190)
                        } else {
                          Utils.emitEvent(false, 106190)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106190)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ECH_FALLBACK_CERTIFICATE_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ECH_FALLBACK_CERTIFICATE_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ECH_FALLBACK_CERTIFICATE_INVALID) {
                          Utils.emitEvent(true, 106200)
                        } else {
                          Utils.emitEvent(false, 106200)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106200)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_COMMON_NAME_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_COMMON_NAME_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_COMMON_NAME_INVALID) {
                          Utils.emitEvent(true, 106210)
                        } else {
                          Utils.emitEvent(false, 106210)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106210)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_DATE_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_DATE_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_DATE_INVALID) {
                          Utils.emitEvent(true, 106220)
                        } else {
                          Utils.emitEvent(false, 106220)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106220)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_AUTHORITY_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_AUTHORITY_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_AUTHORITY_INVALID) {
                          Utils.emitEvent(true, 106230)
                        } else {
                          Utils.emitEvent(false, 106230)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106230)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_CONTAINS_ERRORS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_CONTAINS_ERRORS);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_CONTAINS_ERRORS) {
                          Utils.emitEvent(true, 106240)
                        } else {
                          Utils.emitEvent(false, 106240)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106240)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_NO_REVOCATION_MECHANISM': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_NO_REVOCATION_MECHANISM);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_NO_REVOCATION_MECHANISM) {
                          Utils.emitEvent(true, 106250)
                        } else {
                          Utils.emitEvent(false, 106250)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106250)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_UNABLE_TO_CHECK_REVOCATION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_UNABLE_TO_CHECK_REVOCATION);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_UNABLE_TO_CHECK_REVOCATION) {
                          Utils.emitEvent(true, 106260)
                        } else {
                          Utils.emitEvent(false, 106260)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106260)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_REVOKED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_REVOKED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_REVOKED) {
                          Utils.emitEvent(true, 106270)
                        } else {
                          Utils.emitEvent(false, 106270)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106270)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_INVALID) {
                          Utils.emitEvent(true, 106280)
                        } else {
                          Utils.emitEvent(false, 106280)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106280)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_WEAK_SIGNATURE_ALGORITHM': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_WEAK_SIGNATURE_ALGORITHM);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_WEAK_SIGNATURE_ALGORITHM) {
                          Utils.emitEvent(true, 106290)
                        } else {
                          Utils.emitEvent(false, 106290)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106290)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_NON_UNIQUE_NAME': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_NON_UNIQUE_NAME);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_NON_UNIQUE_NAME) {
                          Utils.emitEvent(true, 106300)
                        } else {
                          Utils.emitEvent(false, 106300)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106300)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_WEAK_KEY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_WEAK_KEY);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_WEAK_KEY) {
                          Utils.emitEvent(true, 106310)
                        } else {
                          Utils.emitEvent(false, 106310)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106310)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_NAME_CONSTRAINT_VIOLATION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_NAME_CONSTRAINT_VIOLATION);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_NAME_CONSTRAINT_VIOLATION) {
                          Utils.emitEvent(true, 106320)
                        } else {
                          Utils.emitEvent(false, 106320)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106320)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_VALIDITY_TOO_LONG': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_VALIDITY_TOO_LONG);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_VALIDITY_TOO_LONG) {
                          Utils.emitEvent(true, 106330)
                        } else {
                          Utils.emitEvent(false, 106330)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106330)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERTIFICATE_TRANSPARENCY_REQUIRED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERTIFICATE_TRANSPARENCY_REQUIRED) {
                          Utils.emitEvent(true, 106340)
                        } else {
                          Utils.emitEvent(false, 106340)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106340)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_SYMANTEC_LEGACY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_SYMANTEC_LEGACY);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_SYMANTEC_LEGACY) {
                          Utils.emitEvent(true, 106350)
                        } else {
                          Utils.emitEvent(false, 106350)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106350)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_KNOWN_INTERCEPTION_BLOCKED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_KNOWN_INTERCEPTION_BLOCKED) {
                          Utils.emitEvent(true, 106360)
                        } else {
                          Utils.emitEvent(false, 106360)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106360)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_OBSOLETE_VERSION_OR_CIPHER);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_OBSOLETE_VERSION_OR_CIPHER) {
                          Utils.emitEvent(true, 106370)
                        } else {
                          Utils.emitEvent(false, 106370)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106370)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CERT_END': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_END);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CERT_END) {
                          Utils.emitEvent(true, 106380)
                        } else {
                          Utils.emitEvent(false, 106380)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 106380)
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