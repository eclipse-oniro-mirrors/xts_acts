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
const EVENT_ID_SET_EIMIT_KEY = 100000;

@Entry
@Component
struct webSetNetErrorCode2 {
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
              .key('webSetNetErrorCode2Button')
              .onClick(async () => {
                  await Utils.waitForExist(()=>this.isPageEnd, 'webSetNetErrorCode2ButtonIsPageEnd', 1, 1000);
                  await Utils.waitForExist(()=>this.isReceive, 'webSetNetErrorCode2ButtonIsReceive', 1, 1000);
                  console.info('key==>' + this.emitKey)
                  this.isReceive = -1;
                  switch (this.emitKey) {
                    case 'emitWebSetNetErrorCode_ERR_CONTEXT_SHUT_DOWN': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONTEXT_SHUT_DOWN);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONTEXT_SHUT_DOWN) {
                          Utils.emitEvent(true, 100260)
                        } else {
                          Utils.emitEvent(false, 100260)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100260)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_RESPONSE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_RESPONSE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_RESPONSE) {
                          Utils.emitEvent(true, 100270)
                        } else {
                          Utils.emitEvent(false, 100270)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100270)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CLEARTEXT_NOT_PERMITTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CLEARTEXT_NOT_PERMITTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CLEARTEXT_NOT_PERMITTED) {
                          Utils.emitEvent(true, 100280)
                        } else {
                          Utils.emitEvent(false, 100280)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100280)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_CSP': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_CSP);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_CSP) {
                          Utils.emitEvent(true, 100290)
                        } else {
                          Utils.emitEvent(false, 100290)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100290)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_H2_OR_QUIC_REQUIRED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_H2_OR_QUIC_REQUIRED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_H2_OR_QUIC_REQUIRED) {
                          Utils.emitEvent(true, 100300)
                        } else {
                          Utils.emitEvent(false, 100300)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100300)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BLOCKED_BY_ORB': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_ORB);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BLOCKED_BY_ORB) {
                          Utils.emitEvent(true, 100310)
                        } else {
                          Utils.emitEvent(false, 100310)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100310)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_CLOSED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_CLOSED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_CLOSED) {
                          Utils.emitEvent(true, 100320)
                        } else {
                          Utils.emitEvent(false, 100320)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100320)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_RESET': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_RESET);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_RESET) {
                          Utils.emitEvent(true, 100330)
                        } else {
                          Utils.emitEvent(false, 100330)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100330)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_REFUSED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_REFUSED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_REFUSED) {
                          Utils.emitEvent(true, 100340)
                        } else {
                          Utils.emitEvent(false, 100340)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100340)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_ABORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_ABORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_ABORTED) {
                          Utils.emitEvent(true, 100350)
                        } else {
                          Utils.emitEvent(false, 100350)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100350)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_FAILED) {
                          Utils.emitEvent(true, 100360)
                        } else {
                          Utils.emitEvent(false, 100360)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100360)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NAME_NOT_RESOLVED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NAME_NOT_RESOLVED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NAME_NOT_RESOLVED) {
                          Utils.emitEvent(true, 100370)
                        } else {
                          Utils.emitEvent(false, 100370)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100370)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_INTERNET_DISCONNECTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_INTERNET_DISCONNECTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_INTERNET_DISCONNECTED) {
                          Utils.emitEvent(true, 100380)
                        } else {
                          Utils.emitEvent(false, 100380)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100380)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_PROTOCOL_ERROR': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_PROTOCOL_ERROR);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_PROTOCOL_ERROR) {
                          Utils.emitEvent(true, 100390)
                        } else {
                          Utils.emitEvent(false, 100390)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100390)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ADDRESS_INVALID': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_INVALID);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ADDRESS_INVALID) {
                          Utils.emitEvent(true, 100400)
                        } else {
                          Utils.emitEvent(false, 100400)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100400)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_ADDRESS_UNREACHABLE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_UNREACHABLE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_ADDRESS_UNREACHABLE) {
                          Utils.emitEvent(true, 100410)
                        } else {
                          Utils.emitEvent(false, 100410)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100410)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_CLIENT_AUTH_CERT_NEEDED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NEEDED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NEEDED) {
                          Utils.emitEvent(true, 100420)
                        } else {
                          Utils.emitEvent(false, 100420)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100420)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_TUNNEL_CONNECTION_FAILED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_TUNNEL_CONNECTION_FAILED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_TUNNEL_CONNECTION_FAILED) {
                          Utils.emitEvent(true, 100430)
                        } else {
                          Utils.emitEvent(false, 100430)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100430)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_NO_SSL_VERSIONS_ENABLED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_NO_SSL_VERSIONS_ENABLED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_NO_SSL_VERSIONS_ENABLED) {
                          Utils.emitEvent(true, 100440)
                        } else {
                          Utils.emitEvent(false, 100440)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100440)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_VERSION_OR_CIPHER_MISMATCH': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_VERSION_OR_CIPHER_MISMATCH);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_VERSION_OR_CIPHER_MISMATCH) {
                          Utils.emitEvent(true, 100450)
                        } else {
                          Utils.emitEvent(false, 100450)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100450)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_SSL_RENEGOTIATION_REQUESTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_SSL_RENEGOTIATION_REQUESTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_SSL_RENEGOTIATION_REQUESTED) {
                          Utils.emitEvent(true, 100460)
                        } else {
                          Utils.emitEvent(false, 100460)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100460)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_PROXY_AUTH_UNSUPPORTED': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_UNSUPPORTED);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_PROXY_AUTH_UNSUPPORTED) {
                          Utils.emitEvent(true, 100470)
                        } else {
                          Utils.emitEvent(false, 100470)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100470)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_BAD_SSL_CLIENT_AUTH_CERT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_BAD_SSL_CLIENT_AUTH_CERT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_BAD_SSL_CLIENT_AUTH_CERT) {
                          Utils.emitEvent(true, 100480)
                        } else {
                          Utils.emitEvent(false, 100480)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100480)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_CONNECTION_TIMED_OUT': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_TIMED_OUT);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_CONNECTION_TIMED_OUT) {
                          Utils.emitEvent(true, 100490)
                        } else {
                          Utils.emitEvent(false, 100490)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100490)
                      }
                      break;
                    }
                    case 'emitWebSetNetErrorCode_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_HOST_RESOLVER_QUEUE_TOO_LARGE);
                        let errorCode:number = response.getNetErrorCode();
                        if (errorCode == WebNetErrorList.ERR_HOST_RESOLVER_QUEUE_TOO_LARGE) {
                          Utils.emitEvent(true, 100500)
                        } else {
                          Utils.emitEvent(false, 100500)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 100500)
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
