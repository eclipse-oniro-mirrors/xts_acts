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
const EVENT_ID_SET_EIMIT_KEY = 108000;

@Entry
@Component
struct webSetNetErrorCodeFly {
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
              Button('webSetNetErrorCodeFly')
              .key('webSetNetErrorCodeFly')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.waitForExist(()=>this.isPageEnd, 'webSetNetErrorCodeFlyIsPageEnd', 1, 1000);
                  await Utils.waitForExist(()=>this.isReceive, 'webSetNetErrorCodeFlyIsPageEnd', 1, 1000);
                  this.isReceive = -1;
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNKNOWN_URL_SCHEME);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_UNKNOWN_URL_SCHEME : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNKNOWN_URL_SCHEME) {
                          Utils.emitEvent(true, 108010)
                        } else {
                          Utils.emitEvent(false, 108010)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 108010)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INVALID_REDIRECT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_REDIRECT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_INVALID_REDIRECT : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INVALID_REDIRECT) {
                          Utils.emitEvent(true, 108020)
                        } else {
                          Utils.emitEvent(false, 108020)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 108020)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_TOO_MANY_REDIRECTS': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TOO_MANY_REDIRECTS);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PAC_SCRIPT_FAILED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_TOO_MANY_REDIRECTS) {
                          Utils.emitEvent(true, 108030)
                        } else {
                          Utils.emitEvent(false, 108030)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 108030)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_UNSAFE_REDIRECT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNSAFE_REDIRECT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_REQUEST_RANGE_NOT_SATISFIABLE : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNSAFE_REDIRECT) {
                          Utils.emitEvent(true, 108040)
                        } else {
                          Utils.emitEvent(false, 108040)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 108040)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_UNSAFE_PORT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNSAFE_PORT);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_MALFORMED_IDENTITY : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNSAFE_PORT) {
                          Utils.emitEvent(true, 108050)
                        } else {
                          Utils.emitEvent(false, 108050)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 108050)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INVALID_RESPONSE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_RESPONSE);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_MALFORMED_IDENTITY : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INVALID_RESPONSE) {
                          Utils.emitEvent(true, 108060)
                        } else {
                          Utils.emitEvent(false, 108060)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 108060)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_INVALID_CHUNKED_ENCODING': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INVALID_CHUNKED_ENCODING);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_NETWORK_IO_SUSPENDED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_INVALID_CHUNKED_ENCODING) {
                          Utils.emitEvent(true, 108070)
                        } else {
                          Utils.emitEvent(false, 108070)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 108070)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_METHOD_UNSUPPORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_METHOD_UNSUPPORTED);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_SYN_REPLY_NOT_RECEIVED : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_METHOD_UNSUPPORTED) {
                          Utils.emitEvent(true, 108080)
                        } else {
                          Utils.emitEvent(false, 108080)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 108080)
                      }
                      break;
                    }

                    case 'emitWebSetNetErrorCode_ERR_UNEXPECTED_PROXY_AUTH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNEXPECTED_PROXY_AUTH);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_ENCODING_CONVERSION_FAILED : ${errorCode}`)

                        if (errorCode == WebNetErrorList.ERR_UNEXPECTED_PROXY_AUTH) {
                          Utils.emitEvent(true, 108090)
                        } else {
                          Utils.emitEvent(false, 108090)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 108090)
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