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
struct webSetNetErrorCodeFly {
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
              Button('webSetNetErrorCodeFly')
              .key('webSetNetErrorCodeFly')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.sleep(3000);
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_ERR_UNKNOWN_URL_SCHEME': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_UNKNOWN_URL_SCHEME);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_UNKNOWN_URL_SCHEME : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_UNKNOWN_URL_SCHEME) {
                          Utils.emitEvent(true, 1301)
                        } else {
                          Utils.emitEvent(false, 1301)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1301)
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
                          Utils.emitEvent(true, 1302)
                        } else {
                          Utils.emitEvent(false, 1302)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1302)
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
                          Utils.emitEvent(true, 1303)
                        } else {
                          Utils.emitEvent(false, 1303)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1303)
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
                          Utils.emitEvent(true, 1304)
                        } else {
                          Utils.emitEvent(false, 1304)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1304)
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
                          Utils.emitEvent(true, 1305)
                        } else {
                          Utils.emitEvent(false, 1305)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1305)
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
                          Utils.emitEvent(true, 1306)
                        } else {
                          Utils.emitEvent(false, 1306)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1306)
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
                          Utils.emitEvent(true, 1307)
                        } else {
                          Utils.emitEvent(false, 1307)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1307)
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
                          Utils.emitEvent(true, 1308)
                        } else {
                          Utils.emitEvent(false, 1308)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1308)
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
                          Utils.emitEvent(true, 1309)
                        } else {
                          Utils.emitEvent(false, 1309)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 1309)
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
