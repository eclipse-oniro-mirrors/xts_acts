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
import Utils from '../../test/Utils.test'
import business_error from '@ohos.base'
import { WebNetErrorList } from '@ohos.web.netErrorList'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
const EVENT_ID_SET_EIMIT_KEY = 105000;

@Entry
@Component
struct webSetNetErrorCode {
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

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
      Column() {
          Row() {
              Button('web click')
              .key('ActsAceWebSetNetErrorCode3Button')
              .onClick(async () => {
                  await Utils.waitForExist(()=>this.isPageEnd, 'ActsAceWebSetNetErrorCode3ButtonIsPageEnd', 1, 1000);
                  await Utils.waitForExist(()=>this.isReceive, 'ActsAceWebSetNetErrorCode3ButtonIsReceive', 1, 1000);
                  console.info('key==>' + this.emitKey)
                  this.isReceive = -1;
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_ERR_NO_PRIVATE_KEY_FOR_CERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NO_PRIVATE_KEY_FOR_CERT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_NO_PRIVATE_KEY_FOR_CERT : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_NO_PRIVATE_KEY_FOR_CERT) {
                          Utils.emitEvent(true, 105010)
                        } else {
                          Utils.emitEvent(false, 105010)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105010)
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
                          Utils.emitEvent(true, 105020)
                        } else {
                          Utils.emitEvent(false, 105020)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105020)
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
                          Utils.emitEvent(true, 105030)
                        } else {
                          Utils.emitEvent(false, 105030)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105030)
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
                          Utils.emitEvent(true, 105040)
                        } else {
                          Utils.emitEvent(false, 105040)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105040)
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
                          Utils.emitEvent(true, 105050)
                        } else {
                          Utils.emitEvent(false, 105050)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105050)
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
                          Utils.emitEvent(true, 105060)
                        } else {
                          Utils.emitEvent(false, 105060)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105060)
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
                          Utils.emitEvent(true, 105070)
                        } else {
                          Utils.emitEvent(false, 105070)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105070)
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
                          Utils.emitEvent(true, 105080)
                        } else {
                          Utils.emitEvent(false, 105080)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105080)
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
                          Utils.emitEvent(true, 105090)
                        } else {
                          Utils.emitEvent(false, 105090)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105090)
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
                          Utils.emitEvent(true, 105100)
                        } else {
                          Utils.emitEvent(false, 105100)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105100)
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
                          Utils.emitEvent(true, 105110)
                        } else {
                          Utils.emitEvent(false, 105110)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105110)
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
                          Utils.emitEvent(true, 105120)
                        } else {
                          Utils.emitEvent(false, 105120)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105120)
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
                          Utils.emitEvent(true, 105130)
                        } else {
                          Utils.emitEvent(false, 105130)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105130)
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
                          Utils.emitEvent(true, 105140)
                        } else {
                          Utils.emitEvent(false, 105140)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105140)
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
                          Utils.emitEvent(true, 105150)
                        } else {
                          Utils.emitEvent(false, 105150)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105150)
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
                          Utils.emitEvent(true, 105160)
                        } else {
                          Utils.emitEvent(false, 105160)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105160)
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
                          Utils.emitEvent(true, 105170)
                        } else {
                          Utils.emitEvent(false, 105170)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105170)
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
                          Utils.emitEvent(true, 105180)
                        } else {
                          Utils.emitEvent(false, 105180)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105180)
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
                          Utils.emitEvent(true, 105190)
                        } else {
                          Utils.emitEvent(false, 105190)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105190)
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