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