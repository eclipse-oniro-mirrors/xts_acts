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
const EVENT_ID_SET_EIMIT_KEY = 104000;

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
              .key('webSetNetErrorCode')
              .onClick(async () => {
                  await Utils.waitForExist(()=>this.isPageEnd, 'webSetNetErrorCodeButtonIsPageEnd', 1, 1000);
                  await Utils.waitForExist(()=>this.isReceive, 'webSetNetErrorCodeButtonIsReceive', 1, 1000);
                  console.info('key==>' + this.emitKey)
                  this.isReceive = -1;
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_ERR_EMPTY_RESPONSE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_EMPTY_RESPONSE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_EMPTY_RESPONSE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_EMPTY_RESPONSE) {
                          Utils.emitEvent(true, 104010)
                        } else {
                          Utils.emitEvent(false, 104010)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104010)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_TOO_BIG);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_HEADERS_TOO_BIG : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_HEADERS_TOO_BIG) {
                          Utils.emitEvent(true, 104020)
                        } else {
                          Utils.emitEvent(false, 104020)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104020)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PAC_SCRIPT_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PAC_SCRIPT_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PAC_SCRIPT_FAILED) {
                          Utils.emitEvent(true, 104030)
                        } else {
                          Utils.emitEvent(false, 104030)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104030)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_REQUEST_RANGE_NOT_SATISFIABLE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_REQUEST_RANGE_NOT_SATISFIABLE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_REQUEST_RANGE_NOT_SATISFIABLE) {
                          Utils.emitEvent(true, 104040)
                        } else {
                          Utils.emitEvent(false, 104040)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104040)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_MALFORMED_IDENTITY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_MALFORMED_IDENTITY);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_MALFORMED_IDENTITY : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_MALFORMED_IDENTITY) {
                          Utils.emitEvent(true, 104050)
                        } else {
                          Utils.emitEvent(false, 104050)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104050)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONTENT_DECODING_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_MALFORMED_IDENTITY : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CONTENT_DECODING_FAILED) {
                          Utils.emitEvent(true, 104060)
                        } else {
                          Utils.emitEvent(false, 104060)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104060)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_IO_SUSPENDED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_NETWORK_IO_SUSPENDED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_NETWORK_IO_SUSPENDED) {
                          Utils.emitEvent(true, 104070)
                        } else {
                          Utils.emitEvent(false, 104070)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104070)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SYN_REPLY_NOT_RECEIVED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_SYN_REPLY_NOT_RECEIVED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_SYN_REPLY_NOT_RECEIVED) {
                          Utils.emitEvent(true, 104080)
                        } else {
                          Utils.emitEvent(false, 104080)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104080)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ENCODING_CONVERSION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_ENCODING_CONVERSION_FAILED : ${errorCode}`)

                        if (errorCode == WebNetErrorList.ERR_ENCODING_CONVERSION_FAILED) {
                          Utils.emitEvent(true, 104090)
                        } else {
                          Utils.emitEvent(false, 104090)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104090)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT) {
                          Utils.emitEvent(true, 104100)
                        } else {
                          Utils.emitEvent(false, 104100)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 104100)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_NO_SUPPORTED_PROXIES': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT) {
                          Utils.emitEvent(true, 104110)
                        } else {
                          Utils.emitEvent(false, 104110)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 104110)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_PROTOCOL_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PROTOCOL_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_PROTOCOL_ERROR : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_PROTOCOL_ERROR) {
                          Utils.emitEvent(true, 104120)
                        } else {
                          Utils.emitEvent(false, 104120)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104120)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_AUTH_CREDENTIALS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INVALID_AUTH_CREDENTIALS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INVALID_AUTH_CREDENTIALS) {
                          Utils.emitEvent(true, 104130)
                        } else {
                          Utils.emitEvent(false, 104130)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104130)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNSUPPORTED_AUTH_SCHEME);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INVALID_AUTH_CREDENTIALS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNSUPPORTED_AUTH_SCHEME) {
                          Utils.emitEvent(true, 104140)
                        } else {
                          Utils.emitEvent(false, 104140)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104140)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ENCODING_DETECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_ENCODING_DETECTION_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_ENCODING_DETECTION_FAILED) {
                          Utils.emitEvent(true, 104150)
                        } else {
                          Utils.emitEvent(false, 104150)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104150)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_MISSING_AUTH_CREDENTIALS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_MISSING_AUTH_CREDENTIALS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_MISSING_AUTH_CREDENTIALS) {
                          Utils.emitEvent(true, 104160)
                        } else {
                          Utils.emitEvent(false, 104160)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104160)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS) {
                          Utils.emitEvent(true, 104170)
                        } else {
                          Utils.emitEvent(false, 104170)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104170)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_MISCONFIGURED_AUTH_ENVIRONMENT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_MISCONFIGURED_AUTH_ENVIRONMENT : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_MISCONFIGURED_AUTH_ENVIRONMENT) {
                          Utils.emitEvent(true, 104180)
                        } else {
                          Utils.emitEvent(false, 104180)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 104180)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS) {
                          Utils.emitEvent(true, 104190)
                        } else {
                          Utils.emitEvent(false, 104190)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104190)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN) {
                          Utils.emitEvent(true, 104200)
                        } else {
                          Utils.emitEvent(false, 104200)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104200)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN) {
                          Utils.emitEvent(true, 104210)
                        } else {
                          Utils.emitEvent(false, 104210)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104210)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INCOMPLETE_HTTP2_HEADERS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INCOMPLETE_HTTP2_HEADERS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INCOMPLETE_HTTP2_HEADERS) {
                          Utils.emitEvent(true, 104220)
                        } else {
                          Utils.emitEvent(false, 104220)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104220)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PAC_NOT_IN_DHCP);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PAC_NOT_IN_DHCP : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PAC_NOT_IN_DHCP) {
                          Utils.emitEvent(true, 104230)
                        } else {
                          Utils.emitEvent(false, 104230)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104230)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION) {
                          Utils.emitEvent(true, 104240)
                        } else {
                          Utils.emitEvent(false, 104240)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104240)
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