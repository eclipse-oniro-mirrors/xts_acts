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
                    case 'emitWebSetNetErrorCode_ERR_PKCS12_IMPORT_INVALID_MAC': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_MAC);
                        let errorCode:number = response.getNetErrorCode();
                        console.log(`ERR_PKCS12_IMPORT_INVALID_MAC : ${errorCode}`)
                        if (errorCode == WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_MAC) {
                          Utils.emitEvent(true, 105200)
                        } else {
                          Utils.emitEvent(false, 105200)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105200)
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
                          Utils.emitEvent(true, 105210)
                        } else {
                          Utils.emitEvent(false, 105210)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105210)
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
                          Utils.emitEvent(true, 105220)
                        } else {
                          Utils.emitEvent(false, 105220)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105220)
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
                          Utils.emitEvent(true, 105230)
                        } else {
                          Utils.emitEvent(false, 105230)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105230)
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
                          Utils.emitEvent(true, 105240)
                        } else {
                          Utils.emitEvent(false, 105240)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105240)
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
                          Utils.emitEvent(true, 105250)
                        } else {
                          Utils.emitEvent(false, 105250)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105250)
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
                          Utils.emitEvent(true, 105260)
                        } else {
                          Utils.emitEvent(false, 105260)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105260)
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
                          Utils.emitEvent(true, 105270)
                        } else {
                          Utils.emitEvent(false, 105270)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105270)
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
                          Utils.emitEvent(true, 105280)
                        } else {
                          Utils.emitEvent(false, 105280)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105280)
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
                          Utils.emitEvent(true, 105290)
                        } else {
                          Utils.emitEvent(false, 105290)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105290)
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
                          Utils.emitEvent(true, 105300)
                        } else {
                          Utils.emitEvent(false, 105300)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105300)
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
                          Utils.emitEvent(true, 105310)
                        } else {
                          Utils.emitEvent(false, 105310)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105310)
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
                          Utils.emitEvent(true, 105320)
                        } else {
                          Utils.emitEvent(false, 105320)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105320)
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
                          Utils.emitEvent(true, 105330)
                        } else {
                          Utils.emitEvent(false, 105330)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105330)
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
                          Utils.emitEvent(true, 105340)
                        } else {
                          Utils.emitEvent(false, 105340)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105340)
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
                          Utils.emitEvent(true, 105350)
                        } else {
                          Utils.emitEvent(false, 105350)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105350)
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
                          Utils.emitEvent(true, 105360)
                        } else {
                          Utils.emitEvent(false, 105360)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105360)
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
                          Utils.emitEvent(true, 105370)
                        } else {
                          Utils.emitEvent(false, 105370)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105370)
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
                          Utils.emitEvent(true, 105380)
                        } else {
                          Utils.emitEvent(false, 105380)
                        }
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(false, 105380)
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