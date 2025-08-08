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
struct webSetNetErrorCode {
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
              .key('ActsAceWebSetNetErrorCode3Button')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.sleep(1000);
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NO_PRIVATE_KEY_FOR_CERT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_NO_PRIVATE_KEY_FOR_CERT : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_NO_PRIVATE_KEY_FOR_CERT) {
                          Utils.emitEvent(true, 1001)
                        } else {
                          Utils.emitEvent(false, 1001)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1001)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_ADD_USER_CERT_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ADD_USER_CERT_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_ADD_USER_CERT_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_ADD_USER_CERT_FAILED) {
                          Utils.emitEvent(true, 1002)
                        } else {
                          Utils.emitEvent(false, 1002)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1002)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INVALID_SIGNED_EXCHANGE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_SIGNED_EXCHANGE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INVALID_SIGNED_EXCHANGE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INVALID_SIGNED_EXCHANGE) {
                          Utils.emitEvent(true, 1003)
                        } else {
                          Utils.emitEvent(false, 1003)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1003)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INVALID_WEB_BUNDLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_WEB_BUNDLE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INVALID_WEB_BUNDLE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INVALID_WEB_BUNDLE) {
                          Utils.emitEvent(true, 1004)
                        } else {
                          Utils.emitEvent(false, 1004)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1004)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TRUST_TOKEN_OPERATION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_TRUST_TOKEN_OPERATION_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_TRUST_TOKEN_OPERATION_FAILED) {
                          Utils.emitEvent(true, 1005)
                        } else {
                          Utils.emitEvent(false, 1005)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1005)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        let lnErr = WebNetErrorList.ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST
                        response.setNetErrorCode(lnErr);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST : ${errorCode}`)
                        if (errorCode == lnErr) {
                          Utils.emitEvent(true, 1006)
                        } else {
                          Utils.emitEvent(false, 1006)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1006)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FTP_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FTP_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_FTP_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_FTP_FAILED) {
                          Utils.emitEvent(true, 1007)
                        } else {
                          Utils.emitEvent(false, 1007)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1007)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FTP_SERVICE_UNAVAILABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FTP_SERVICE_UNAVAILABLE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_FTP_SERVICE_UNAVAILABLE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_FTP_SERVICE_UNAVAILABLE) {
                          Utils.emitEvent(true, 1008)
                        } else {
                          Utils.emitEvent(false, 1008)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1008)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FTP_TRANSFER_ABORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FTP_TRANSFER_ABORTED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_FTP_TRANSFER_ABORTED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_FTP_TRANSFER_ABORTED) {
                          Utils.emitEvent(true, 1009)
                        } else {
                          Utils.emitEvent(false, 1009)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1009)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FTP_FILE_BUSY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FTP_FILE_BUSY);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_FTP_FILE_BUSY : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_FTP_FILE_BUSY) {
                          Utils.emitEvent(true, 1010)
                        } else {
                          Utils.emitEvent(false, 1010)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1010)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FTP_SYNTAX_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FTP_SYNTAX_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_FTP_SYNTAX_ERROR : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_FTP_SYNTAX_ERROR) {
                          Utils.emitEvent(true, 1011)
                        } else {
                          Utils.emitEvent(false, 1011)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1011)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FTP_COMMAND_UNSUPPORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FTP_COMMAND_UNSUPPORTED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_FTP_COMMAND_UNSUPPORTED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_FTP_COMMAND_UNSUPPORTED) {
                          Utils.emitEvent(true, 1012)
                        } else {
                          Utils.emitEvent(false, 1012)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1012)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_FTP_BAD_COMMAND_SEQUENCE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_FTP_BAD_COMMAND_SEQUENCE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_FTP_BAD_COMMAND_SEQUENCE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_FTP_BAD_COMMAND_SEQUENCE) {
                          Utils.emitEvent(true, 1013)
                        } else {
                          Utils.emitEvent(false, 1013)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1013)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_BAD_PASSWORD': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_BAD_PASSWORD);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PKCS12_IMPORT_BAD_PASSWORD : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PKCS12_IMPORT_BAD_PASSWORD) {
                          Utils.emitEvent(true, 1014)
                        } else {
                          Utils.emitEvent(false, 1014)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1014)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PKCS12_IMPORT_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PKCS12_IMPORT_FAILED) {
                          Utils.emitEvent(true, 1015)
                        } else {
                          Utils.emitEvent(false, 1015)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1015)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_IMPORT_CA_CERT_NOT_CA': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_CA_CERT_NOT_CA);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_IMPORT_CA_CERT_NOT_CA : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_IMPORT_CA_CERT_NOT_CA) {
                          Utils.emitEvent(true, 1016)
                        } else {
                          Utils.emitEvent(false, 1016)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1016)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_IMPORT_CERT_ALREADY_EXISTS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_CERT_ALREADY_EXISTS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_IMPORT_CERT_ALREADY_EXISTS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_IMPORT_CERT_ALREADY_EXISTS) {
                          Utils.emitEvent(true, 1017)
                        } else {
                          Utils.emitEvent(false, 1017)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1017)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_IMPORT_CA_CERT_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_CA_CERT_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_IMPORT_CA_CERT_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_IMPORT_CA_CERT_FAILED) {
                          Utils.emitEvent(true, 1018)
                        } else {
                          Utils.emitEvent(false, 1018)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1018)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_IMPORT_SERVER_CERT_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_SERVER_CERT_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_IMPORT_SERVER_CERT_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_IMPORT_SERVER_CERT_FAILED) {
                          Utils.emitEvent(true, 1019)
                        } else {
                          Utils.emitEvent(false, 1019)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1019)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_MAC);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PKCS12_IMPORT_INVALID_MAC : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_MAC) {
                          Utils.emitEvent(true, 1020)
                        } else {
                          Utils.emitEvent(false, 1020)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1020)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_FILE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_MAC);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PKCS12_IMPORT_INVALID_MAC : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_MAC) {
                          Utils.emitEvent(true, 1021)
                        } else {
                          Utils.emitEvent(false, 1021)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1021)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_UNSUPPORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_UNSUPPORTED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PKCS12_IMPORT_UNSUPPORTED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PKCS12_IMPORT_UNSUPPORTED) {
                          Utils.emitEvent(true, 1022)
                        } else {
                          Utils.emitEvent(false, 1022)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1022)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_KEY_GENERATION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_KEY_GENERATION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_KEY_GENERATION_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_KEY_GENERATION_FAILED) {
                          Utils.emitEvent(true, 1023)
                        } else {
                          Utils.emitEvent(false, 1023)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1023)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_PRIVATE_KEY_EXPORT_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PRIVATE_KEY_EXPORT_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PRIVATE_KEY_EXPORT_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PRIVATE_KEY_EXPORT_FAILED) {
                          Utils.emitEvent(true, 1024)
                        } else {
                          Utils.emitEvent(false, 1024)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1024)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_SELF_SIGNED_CERT_GENERATION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SELF_SIGNED_CERT_GENERATION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_SELF_SIGNED_CERT_GENERATION_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_SELF_SIGNED_CERT_GENERATION_FAILED) {
                          Utils.emitEvent(true, 1025)
                        } else {
                          Utils.emitEvent(false, 1025)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1025)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CERT_DATABASE_CHANGED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_DATABASE_CHANGED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CERT_DATABASE_CHANGED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CERT_DATABASE_CHANGED) {
                          Utils.emitEvent(true, 1026)
                        } else {
                          Utils.emitEvent(false, 1026)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1026)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CERT_VERIFIER_CHANGED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CERT_VERIFIER_CHANGED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CERT_VERIFIER_CHANGED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CERT_VERIFIER_CHANGED) {
                          Utils.emitEvent(true, 1027)
                        } else {
                          Utils.emitEvent(false, 1027)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1027)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_DNS_MALFORMED_RESPONSE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_DNS_MALFORMED_RESPONSE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_DNS_MALFORMED_RESPONSE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_DNS_MALFORMED_RESPONSE) {
                          Utils.emitEvent(true, 1028)
                        } else {
                          Utils.emitEvent(false, 1028)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1028)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_DNS_SERVER_REQUIRES_TCP': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_DNS_SERVER_REQUIRES_TCP);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_DNS_SERVER_REQUIRES_TCP : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_DNS_SERVER_REQUIRES_TCP) {
                          Utils.emitEvent(true, 1029)
                        } else {
                          Utils.emitEvent(false, 1029)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1029)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_DNS_SERVER_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_DNS_SERVER_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_DNS_SERVER_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_DNS_SERVER_FAILED) {
                          Utils.emitEvent(true, 1030)
                        } else {
                          Utils.emitEvent(false, 1030)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1030)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_DNS_TIMED_OUT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_DNS_TIMED_OUT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_DNS_TIMED_OUT : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_DNS_TIMED_OUT) {
                          Utils.emitEvent(true, 1031)
                        } else {
                          Utils.emitEvent(false, 1031)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1031)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_DNS_CACHE_MISS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_DNS_CACHE_MISS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_DNS_CACHE_MISS' : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_DNS_CACHE_MISS) {
                          Utils.emitEvent(true, 1032)
                        } else {
                          Utils.emitEvent(false, 1032)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1032)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_DNS_SEARCH_EMPTY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_DNS_SEARCH_EMPTY);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_DNS_SEARCH_EMPTY : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_DNS_SEARCH_EMPTY) {
                          Utils.emitEvent(true, 1033)
                        } else {
                          Utils.emitEvent(false, 1033)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1033)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_DNS_SORT_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_DNS_SORT_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_DNS_SORT_ERROR : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_DNS_SORT_ERROR) {
                          Utils.emitEvent(true, 1034)
                        } else {
                          Utils.emitEvent(false, 1034)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1034)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED) {
                          Utils.emitEvent(true, 1035)
                        } else {
                          Utils.emitEvent(false, 1035)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1035)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_DNS_NAME_HTTPS_ONLY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_DNS_NAME_HTTPS_ONLY);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_DNS_NAME_HTTPS_ONLY : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_DNS_NAME_HTTPS_ONLY) {
                          Utils.emitEvent(true, 1036)
                        } else {
                          Utils.emitEvent(false, 1036)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1036)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_DNS_REQUEST_CANCELED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_DNS_REQUEST_CANCELED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_DNS_REQUEST_CANCELED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_DNS_REQUEST_CANCELED) {
                          Utils.emitEvent(true, 1037)
                        } else {
                          Utils.emitEvent(false, 1037)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1037)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_DNS_NO_MATCHING_SUPPORTED_ALPN);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_DNS_NO_MATCHING_SUPPORTED_ALPN : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_DNS_NO_MATCHING_SUPPORTED_ALPN) {
                          Utils.emitEvent(true, 1038)
                        } else {
                          Utils.emitEvent(false, 1038)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1038)
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
