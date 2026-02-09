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

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION) {
                          Utils.emitEvent(true, 104250)
                        } else {
                          Utils.emitEvent(false, 104250)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104250)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_SERVER_REFUSED_STREAM);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_SERVER_REFUSED_STREAM : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_SERVER_REFUSED_STREAM) {
                          Utils.emitEvent(true, 104260)
                        } else {
                          Utils.emitEvent(false, 104260)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104260)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_PING_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PING_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_PING_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_PING_FAILED) {
                          Utils.emitEvent(true, 104270)
                        } else {
                          Utils.emitEvent(false, 104270)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104270)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONTENT_LENGTH_MISMATCH);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CONTENT_LENGTH_MISMATCH : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CONTENT_LENGTH_MISMATCH) {
                          Utils.emitEvent(true, 104280)
                        } else {
                          Utils.emitEvent(false, 104280)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104280)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INCOMPLETE_CHUNKED_ENCODING);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INCOMPLETE_CHUNKED_ENCODING : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INCOMPLETE_CHUNKED_ENCODING) {
                          Utils.emitEvent(true, 104290)
                        } else {
                          Utils.emitEvent(false, 104290)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104290)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_QUIC_PROTOCOL_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_QUIC_PROTOCOL_ERROR : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_QUIC_PROTOCOL_ERROR) {
                          Utils.emitEvent(true, 104300)
                        } else {
                          Utils.emitEvent(false, 104300)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104300)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_TRUNCATED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_HEADERS_TRUNCATED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_HEADERS_TRUNCATED) {
                          Utils.emitEvent(true, 104310)
                        } else {
                          Utils.emitEvent(false, 104310)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104310)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_QUIC_HANDSHAKE_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_QUIC_HANDSHAKE_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_QUIC_HANDSHAKE_FAILED) {
                          Utils.emitEvent(true, 104320)
                        } else {
                          Utils.emitEvent(false, 104320)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104320)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY) {
                          Utils.emitEvent(true, 104330)
                        } else {
                          Utils.emitEvent(false, 104330)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104330)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_FLOW_CONTROL_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_FLOW_CONTROL_ERROR : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_FLOW_CONTROL_ERROR) {
                          Utils.emitEvent(true, 104340)
                        } else {
                          Utils.emitEvent(false, 104340)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104340)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_FRAME_SIZE_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_FRAME_SIZE_ERROR : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_FRAME_SIZE_ERROR) {
                          Utils.emitEvent(true, 104350)
                        } else {
                          Utils.emitEvent(false, 104350)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104350)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_COMPRESSION_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_COMPRESSION_ERROR : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_COMPRESSION_ERROR) {
                          Utils.emitEvent(true, 104360)
                        } else {
                          Utils.emitEvent(false, 104360)
                        }

                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104360)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION) {
                          Utils.emitEvent(true, 104370)
                        } else {
                          Utils.emitEvent(false, 104370)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104370)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP_1_1_REQUIRED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP_1_1_REQUIRED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP_1_1_REQUIRED) {
                          Utils.emitEvent(true, 104380)
                        } else {
                          Utils.emitEvent(false, 104380)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104380)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_HTTP_1_1_REQUIRED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PROXY_HTTP_1_1_REQUIRED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PROXY_HTTP_1_1_REQUIRED) {
                          Utils.emitEvent(true, 104390)
                        } else {
                          Utils.emitEvent(false, 104390)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104390)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_PAC_SCRIPT_TERMINATED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PAC_SCRIPT_TERMINATED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PAC_SCRIPT_TERMINATED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PAC_SCRIPT_TERMINATED) {
                          Utils.emitEvent(true, 104400)
                        } else {
                          Utils.emitEvent(false, 104400)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104400)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INVALID_HTTP_RESPONSE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_HTTP_RESPONSE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INVALID_HTTP_RESPONSE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INVALID_HTTP_RESPONSE) {
                          Utils.emitEvent(true, 104410)
                        } else {
                          Utils.emitEvent(false, 104410)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104410)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CONTENT_DECODING_INIT_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONTENT_DECODING_INIT_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CONTENT_DECODING_INIT_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CONTENT_DECODING_INIT_FAILED) {
                          Utils.emitEvent(true, 104420)
                        } else {
                          Utils.emitEvent(false, 104420)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104420)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED) {
                          Utils.emitEvent(true, 104430)
                        } else {
                          Utils.emitEvent(false, 104430)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104430)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE) {
                          Utils.emitEvent(true, 104440)
                        } else {
                          Utils.emitEvent(false, 104440)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104440)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER) {
                          Utils.emitEvent(true, 104450)
                        } else {
                          Utils.emitEvent(false, 104450)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104450)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_TOO_MANY_RETRIES': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TOO_MANY_RETRIES);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_TOO_MANY_RETRIES : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_TOO_MANY_RETRIES) {
                          Utils.emitEvent(true, 104460)
                        } else {
                          Utils.emitEvent(false, 104460)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104460)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_STREAM_CLOSED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_STREAM_CLOSED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_STREAM_CLOSED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_STREAM_CLOSED) {
                          Utils.emitEvent(true, 104470)
                        } else {
                          Utils.emitEvent(false, 104470)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104470)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_CLIENT_REFUSED_STREAM': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_CLIENT_REFUSED_STREAM);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_CLIENT_REFUSED_STREAM : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_CLIENT_REFUSED_STREAM) {
                          Utils.emitEvent(true, 104480)
                        } else {
                          Utils.emitEvent(false, 104480)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104480)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH) {
                          Utils.emitEvent(true, 104490)
                        } else {
                          Utils.emitEvent(false, 104490)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104490)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_HTTP_RESPONSE_CODE_FAILURE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP_RESPONSE_CODE_FAILURE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP_RESPONSE_CODE_FAILURE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP_RESPONSE_CODE_FAILURE) {
                          Utils.emitEvent(true, 104500)
                        } else {
                          Utils.emitEvent(false, 104500)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104500)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_QUIC_UNKNOWN_CERT_ROOT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_QUIC_UNKNOWN_CERT_ROOT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_QUIC_UNKNOWN_CERT_ROOT : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_QUIC_UNKNOWN_CERT_ROOT) {
                          Utils.emitEvent(true, 104510)
                        } else {
                          Utils.emitEvent(false, 104510)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104510)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED) {
                          Utils.emitEvent(true, 104520)
                        } else {
                          Utils.emitEvent(false, 104520)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104520)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_TOO_MANY_ACCEPT_CH_RESTARTS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TOO_MANY_ACCEPT_CH_RESTARTS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_TOO_MANY_ACCEPT_CH_RESTARTS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_TOO_MANY_ACCEPT_CH_RESTARTS) {
                          Utils.emitEvent(true, 104530)
                        } else {
                          Utils.emitEvent(false, 104530)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104530)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INCONSISTENT_IP_ADDRESS_SPACE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INCONSISTENT_IP_ADDRESS_SPACE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INCONSISTENT_IP_ADDRESS_SPACE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INCONSISTENT_IP_ADDRESS_SPACE) {
                          Utils.emitEvent(true, 104540)
                        } else {
                          Utils.emitEvent(false, 104540)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104540)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        let lnErr = WebNetErrorList.ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY
                        response.setNetErrorCode(lnErr);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY : ${errorCode}`)
                        if (errorCode == lnErr) {
                          Utils.emitEvent(true, 104550)
                        } else {
                          Utils.emitEvent(false, 104550)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104550)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_MISS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_MISS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_MISS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_MISS) {
                          Utils.emitEvent(true, 104560)
                        } else {
                          Utils.emitEvent(false, 104560)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104560)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_READ_FAILURE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_READ_FAILURE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_READ_FAILURE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_READ_FAILURE) {
                          Utils.emitEvent(true, 104570)
                        } else {
                          Utils.emitEvent(false, 104570)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104570)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_WRITE_FAILURE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_WRITE_FAILURE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_WRITE_FAILURE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_WRITE_FAILURE) {
                          Utils.emitEvent(true, 104580)
                        } else {
                          Utils.emitEvent(false, 104580)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104580)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_OPERATION_UNSUPPORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_OPERATION_UNSUPPORTED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_OPERATION_UNSUPPORTED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_OPERATION_UNSUPPORTED) {
                          Utils.emitEvent(true, 104590)
                        } else {
                          Utils.emitEvent(false, 104590)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104590)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_OPEN_FAILURE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_OPEN_FAILURE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_OPEN_FAILURE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_OPEN_FAILURE) {
                          Utils.emitEvent(true, 104600)
                        } else {
                          Utils.emitEvent(false, 104600)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104600)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_CREATE_FAILURE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_CREATE_FAILURE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_CREATE_FAILURE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_CREATE_FAILURE) {
                          Utils.emitEvent(true, 104610)
                        } else {
                          Utils.emitEvent(false, 104610)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104610)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_RACE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_RACE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_RACE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_RACE) {
                          Utils.emitEvent(true, 104620)
                        } else {
                          Utils.emitEvent(false, 104620)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104620)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_CHECKSUM_READ_FAILURE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_CHECKSUM_READ_FAILURE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_CHECKSUM_READ_FAILURE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_CHECKSUM_READ_FAILURE) {
                          Utils.emitEvent(true, 104630)
                        } else {
                          Utils.emitEvent(false, 104630)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104630)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_CHECKSUM_MISMATCH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_CHECKSUM_MISMATCH);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_CHECKSUM_MISMATCH : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_CHECKSUM_MISMATCH) {
                          Utils.emitEvent(true, 104640)
                        } else {
                          Utils.emitEvent(false, 104640)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104640)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_LOCK_TIMEOUT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_LOCK_TIMEOUT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_LOCK_TIMEOUT : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_LOCK_TIMEOUT) {
                          Utils.emitEvent(true, 104650)
                        } else {
                          Utils.emitEvent(false, 104650)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104650)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_AUTH_FAILURE_AFTER_READ': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_AUTH_FAILURE_AFTER_READ);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_AUTH_FAILURE_AFTER_READ : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_AUTH_FAILURE_AFTER_READ) {
                          Utils.emitEvent(true, 104660)
                        } else {
                          Utils.emitEvent(false, 104660)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104660)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_ENTRY_NOT_SUITABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_ENTRY_NOT_SUITABLE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_ENTRY_NOT_SUITABLE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_ENTRY_NOT_SUITABLE) {
                          Utils.emitEvent(true, 104670)
                        } else {
                          Utils.emitEvent(false, 104670)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104670)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_DOOM_FAILURE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_DOOM_FAILURE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_DOOM_FAILURE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_DOOM_FAILURE) {
                          Utils.emitEvent(true, 104680)
                        } else {
                          Utils.emitEvent(false, 104680)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104680)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_CACHE_OPEN_OR_CREATE_FAILURE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CACHE_OPEN_OR_CREATE_FAILURE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CACHE_OPEN_OR_CREATE_FAILURE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CACHE_OPEN_OR_CREATE_FAILURE) {
                          Utils.emitEvent(true, 104690)
                        } else {
                          Utils.emitEvent(false, 104690)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104690)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INSECURE_RESPONSE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INSECURE_RESPONSE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INSECURE_RESPONSE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INSECURE_RESPONSE) {
                          Utils.emitEvent(true, 104700)
                        } else {
                          Utils.emitEvent(false, 104700)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 104700)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_null': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(null);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`null : ${errorCode}`)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        if (e.code.toString() === '401') {
                          Utils.emitEvent(true, 104710)
                        } else {
                          Utils.emitEvent(false, 104710)
                        }
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_1000': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(-1000);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`null : ${errorCode}`)
                        Utils.emitEvent(true, 104720)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
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