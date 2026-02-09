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