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
              .key('webSetNetErrorCode')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.sleep(1000);
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_ERR_EMPTY_RESPONSE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_EMPTY_RESPONSE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_EMPTY_RESPONSE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_EMPTY_RESPONSE) {
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

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TOO_BIG': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_TOO_BIG);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_HEADERS_TOO_BIG : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_HEADERS_TOO_BIG) {
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

                    case 'emitWebSetNetErrorCode_ERR_PAC_SCRIPT_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PAC_SCRIPT_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PAC_SCRIPT_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PAC_SCRIPT_FAILED) {
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

                    case 'emitWebSetNetErrorCode_ERR_REQUEST_RANGE_NOT_SATISFIABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_REQUEST_RANGE_NOT_SATISFIABLE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_REQUEST_RANGE_NOT_SATISFIABLE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_REQUEST_RANGE_NOT_SATISFIABLE) {
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

                    case 'emitWebSetNetErrorCode_ERR_MALFORMED_IDENTITY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_MALFORMED_IDENTITY);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_MALFORMED_IDENTITY : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_MALFORMED_IDENTITY) {
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

                    case 'emitWebSetNetErrorCode_ERR_CONTENT_DECODING_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONTENT_DECODING_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_MALFORMED_IDENTITY : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CONTENT_DECODING_FAILED) {
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

                    case 'emitWebSetNetErrorCode_ERR_NETWORK_IO_SUSPENDED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_IO_SUSPENDED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_NETWORK_IO_SUSPENDED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_NETWORK_IO_SUSPENDED) {
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

                    case 'emitWebSetNetErrorCode_ERR_SYN_REPLY_NOT_RECEIVED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SYN_REPLY_NOT_RECEIVED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_SYN_REPLY_NOT_RECEIVED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_SYN_REPLY_NOT_RECEIVED) {
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

                    case 'emitWebSetNetErrorCode_ERR_ENCODING_CONVERSION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ENCODING_CONVERSION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_ENCODING_CONVERSION_FAILED : ${errorCode}`)

                        if (errorCode == WebNetErrorList.ERR_ENCODING_CONVERSION_FAILED) {
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

                    case 'emitWebSetNetErrorCode_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT) {
                          Utils.emitEvent(true, 1010)
                        } else {
                          Utils.emitEvent(false, 1010)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 1010)
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
                          Utils.emitEvent(true, 1011)
                        } else {
                          Utils.emitEvent(false, 1011)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 1011)
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

                    case 'emitWebSetNetErrorCode_ERR_INVALID_AUTH_CREDENTIALS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_AUTH_CREDENTIALS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INVALID_AUTH_CREDENTIALS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INVALID_AUTH_CREDENTIALS) {
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

                    case 'emitWebSetNetErrorCode_ERR_UNSUPPORTED_AUTH_SCHEME': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNSUPPORTED_AUTH_SCHEME);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INVALID_AUTH_CREDENTIALS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNSUPPORTED_AUTH_SCHEME) {
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

                    case 'emitWebSetNetErrorCode_ERR_ENCODING_DETECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ENCODING_DETECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_ENCODING_DETECTION_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_ENCODING_DETECTION_FAILED) {
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

                    case 'emitWebSetNetErrorCode_ERR_MISSING_AUTH_CREDENTIALS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_MISSING_AUTH_CREDENTIALS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_MISSING_AUTH_CREDENTIALS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_MISSING_AUTH_CREDENTIALS) {
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

                    case 'emitWebSetNetErrorCode_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS) {
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

                    case 'emitWebSetNetErrorCode_ERR_MISCONFIGURED_AUTH_ENVIRONMENT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_MISCONFIGURED_AUTH_ENVIRONMENT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_MISCONFIGURED_AUTH_ENVIRONMENT : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_MISCONFIGURED_AUTH_ENVIRONMENT) {
                          Utils.emitEvent(true, 1018)
                        } else {
                          Utils.emitEvent(false, 1018)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        Utils.emitEvent(false, 1018)
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

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN) {
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

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN) {
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

                    case 'emitWebSetNetErrorCode_ERR_INCOMPLETE_HTTP2_HEADERS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INCOMPLETE_HTTP2_HEADERS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INCOMPLETE_HTTP2_HEADERS : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INCOMPLETE_HTTP2_HEADERS) {
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

                    case 'emitWebSetNetErrorCode_ERR_PAC_NOT_IN_DHCP': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PAC_NOT_IN_DHCP);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PAC_NOT_IN_DHCP : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PAC_NOT_IN_DHCP) {
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

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION) {
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

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION) {
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

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_SERVER_REFUSED_STREAM': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_SERVER_REFUSED_STREAM);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_SERVER_REFUSED_STREAM : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_SERVER_REFUSED_STREAM) {
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

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_PING_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PING_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_PING_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_PING_FAILED) {
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

                    case 'emitWebSetNetErrorCode_ERR_CONTENT_LENGTH_MISMATCH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONTENT_LENGTH_MISMATCH);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_CONTENT_LENGTH_MISMATCH : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_CONTENT_LENGTH_MISMATCH) {
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

                    case 'emitWebSetNetErrorCode_ERR_INCOMPLETE_CHUNKED_ENCODING': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INCOMPLETE_CHUNKED_ENCODING);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INCOMPLETE_CHUNKED_ENCODING : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INCOMPLETE_CHUNKED_ENCODING) {
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

                    case 'emitWebSetNetErrorCode_ERR_QUIC_PROTOCOL_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_QUIC_PROTOCOL_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_QUIC_PROTOCOL_ERROR : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_QUIC_PROTOCOL_ERROR) {
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

                    case 'emitWebSetNetErrorCode_ERR_RESPONSE_HEADERS_TRUNCATED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_TRUNCATED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_RESPONSE_HEADERS_TRUNCATED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_RESPONSE_HEADERS_TRUNCATED) {
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

                    case 'emitWebSetNetErrorCode_ERR_QUIC_HANDSHAKE_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_QUIC_HANDSHAKE_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_QUIC_HANDSHAKE_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_QUIC_HANDSHAKE_FAILED) {
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

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY) {
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

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_FLOW_CONTROL_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_FLOW_CONTROL_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_FLOW_CONTROL_ERROR : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_FLOW_CONTROL_ERROR) {
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

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_FRAME_SIZE_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_FRAME_SIZE_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_FRAME_SIZE_ERROR : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_FRAME_SIZE_ERROR) {
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

                    case 'emitWebSetNetErrorCode_ERR_HTTP2_COMPRESSION_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_COMPRESSION_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP2_COMPRESSION_ERROR : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP2_COMPRESSION_ERROR) {
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

                    case 'emitWebSetNetErrorCode_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION) {
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

                    case 'emitWebSetNetErrorCode_ERR_HTTP_1_1_REQUIRED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HTTP_1_1_REQUIRED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_HTTP_1_1_REQUIRED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_HTTP_1_1_REQUIRED) {
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

                    case 'emitWebSetNetErrorCode_ERR_PROXY_HTTP_1_1_REQUIRED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_HTTP_1_1_REQUIRED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PROXY_HTTP_1_1_REQUIRED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PROXY_HTTP_1_1_REQUIRED) {
                          Utils.emitEvent(true, 1039)
                        } else {
                          Utils.emitEvent(false, 1039)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1039)
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
                          Utils.emitEvent(true, 1040)
                        } else {
                          Utils.emitEvent(false, 1040)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1040)
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
                          Utils.emitEvent(true, 1041)
                        } else {
                          Utils.emitEvent(false, 1041)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1041)
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
                          Utils.emitEvent(true, 1042)
                        } else {
                          Utils.emitEvent(false, 1042)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1042)
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
                          Utils.emitEvent(true, 1043)
                        } else {
                          Utils.emitEvent(false, 1043)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1043)
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
                          Utils.emitEvent(true, 1044)
                        } else {
                          Utils.emitEvent(false, 1044)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1044)
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
                          Utils.emitEvent(true, 1045)
                        } else {
                          Utils.emitEvent(false, 1045)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1045)
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
                          Utils.emitEvent(true, 1046)
                        } else {
                          Utils.emitEvent(false, 1046)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1046)
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
                          Utils.emitEvent(true, 1047)
                        } else {
                          Utils.emitEvent(false, 1047)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1047)
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
                          Utils.emitEvent(true, 1048)
                        } else {
                          Utils.emitEvent(false, 1048)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1048)
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
                          Utils.emitEvent(true, 1049)
                        } else {
                          Utils.emitEvent(false, 1049)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1049)
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
                          Utils.emitEvent(true, 1050)
                        } else {
                          Utils.emitEvent(false, 1050)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1050)
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
                          Utils.emitEvent(true, 1051)
                        } else {
                          Utils.emitEvent(false, 1051)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1051)
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
                          Utils.emitEvent(true, 1052)
                        } else {
                          Utils.emitEvent(false, 1052)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1052)
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
                          Utils.emitEvent(true, 1053)
                        } else {
                          Utils.emitEvent(false, 1053)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1053)
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
                          Utils.emitEvent(true, 1054)
                        } else {
                          Utils.emitEvent(false, 1054)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1054)
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
                          Utils.emitEvent(true, 1055)
                        } else {
                          Utils.emitEvent(false, 1055)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1055)
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
                          Utils.emitEvent(true, 1056)
                        } else {
                          Utils.emitEvent(false, 1056)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1056)
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
                          Utils.emitEvent(true, 1057)
                        } else {
                          Utils.emitEvent(false, 1057)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1057)
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
                          Utils.emitEvent(true, 1058)
                        } else {
                          Utils.emitEvent(false, 1058)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1058)
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
                          Utils.emitEvent(true, 1059)
                        } else {
                          Utils.emitEvent(false, 1059)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1059)
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
                          Utils.emitEvent(true, 1060)
                        } else {
                          Utils.emitEvent(false, 1060)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1060)
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
                          Utils.emitEvent(true, 1061)
                        } else {
                          Utils.emitEvent(false, 1061)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1061)
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
                          Utils.emitEvent(true, 1062)
                        } else {
                          Utils.emitEvent(false, 1062)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1062)
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
                          Utils.emitEvent(true, 1063)
                        } else {
                          Utils.emitEvent(false, 1063)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1063)
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
                          Utils.emitEvent(true, 1064)
                        } else {
                          Utils.emitEvent(false, 1064)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1064)
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
                          Utils.emitEvent(true, 1065)
                        } else {
                          Utils.emitEvent(false, 1065)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1065)
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
                          Utils.emitEvent(true, 1066)
                        } else {
                          Utils.emitEvent(false, 1066)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1066)
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
                          Utils.emitEvent(true, 1067)
                        } else {
                          Utils.emitEvent(false, 1067)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1067)
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
                          Utils.emitEvent(true, 1068)
                        } else {
                          Utils.emitEvent(false, 1068)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1068)
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
                          Utils.emitEvent(true, 1069)
                        } else {
                          Utils.emitEvent(false, 1069)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1069)
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
                          Utils.emitEvent(true, 1070)
                        } else {
                          Utils.emitEvent(false, 1070)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1070)
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
                          Utils.emitEvent(true, 1071)
                        } else {
                          Utils.emitEvent(false, 1071)
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
                        Utils.emitEvent(true, 1072)
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
      }
  }
}
