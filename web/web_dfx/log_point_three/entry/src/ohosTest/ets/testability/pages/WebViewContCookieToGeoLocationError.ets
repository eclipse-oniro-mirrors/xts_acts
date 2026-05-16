/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import web_webview from '@ohos.web.webview';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
const EVENT_ID_SET_EMIT_KEY = 110010;
interface objectCss {
  code: number;
  message: string;
}

@Entry
@Component
struct webViewContCookieToGeoLocationError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "";
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State errorCode: string = '0';
  @State errorTestCode: number = 0;
  @State errorMsg: string = 'failed';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  origin: string = "";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('webViewContCookieToGeoLocationError page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }
  interface() {
    ErrorEvent1: this.errorCode
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments =  AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("CookieToGeoLocationErrorTest").key('webViewContCookieToGeoLocationError').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'webViewContCookieToGeoLocationErrorIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'webViewContCookieToGeoLocationErrorIsReceive', 1, 1000);
          console.info('key==>' + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitGetOriginUsageCallbackValueNullErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = ""
                web_webview.WebStorage.getOriginUsage(this.origin, (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginUsageCallbackValueNullErr getOriginUsage return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110340)
                    Utils.emitEvent(this.errorMsg, 110350)
                    return;
                  }
                  console.log('usage: ' + usage);
                })
              } catch (error) {
                console.error(`emitGetOriginUsageCallbackValueNullErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetOriginUsagePromiseValueErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "/wrongPath%*"
                web_webview.WebStorage.getOriginUsage(this.origin)
                  .then(usage => {
                    console.log('usage: ' + usage);
                  })
                  .catch((error:objectCss) => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginUsagePromiseValueErr getOriginUsage return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110360)
                    Utils.emitEvent(this.errorMsg, 110370)
                  })
              } catch (error) {
                console.error(`emitGetOriginUsagePromiseValueErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetOriginUsagePromiseValueIllegalErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "[1,a]"
                web_webview.WebStorage.getOriginUsage(this.origin)
                  .then(usage => {
                    console.log('usage: ' + usage);
                  })
                  .catch((error:objectCss) => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginUsagePromiseValueIllegalErr getOriginUsage return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110380)
                    Utils.emitEvent(this.errorMsg, 110390)
                  })
              } catch (error) {
                console.error(`emitGetOriginUsagePromiseValueIllegalErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetOriginUsagePromiseValueNullErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = ""
                web_webview.WebStorage.getOriginUsage(this.origin)
                  .then(usage => {
                    console.log('usage: ' + usage);
                  })
                  .catch((error:objectCss) => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginUsagePromiseValueNullErr getOriginUsage return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110400)
                    Utils.emitEvent(this.errorMsg, 110410)
                  })
              } catch (error) {
                console.error(`emitGetOriginUsagePromiseValueNullErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitAllowGeolocationValueErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.origin = "/wrongPath%*"
                web_webview.GeolocationPermissions.allowGeolocation(this.origin);
              } catch (error) {
                console.error(`emitAllowGeolocationValueErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110420)
              Utils.emitEvent(this.errorMsg, 110430)
              break;
            }
            case "emitAllowGeolocationValueIllegalErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.origin = "[1,a]"
                web_webview.GeolocationPermissions.allowGeolocation(this.origin);
              } catch (error) {
                console.error(`emitAllowGeolocationValueIllegalErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110440)
              Utils.emitEvent(this.errorMsg, 110450)
              break;
            }
            case "emitAllowGeolocationValueNullErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.origin = ""
                web_webview.GeolocationPermissions.allowGeolocation(this.origin);
              } catch (error) {
                console.error(`emitAllowGeolocationValueNullErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110460)
              Utils.emitEvent(this.errorMsg, 110470)
              break;
            }
            case "emitDeleteGeolocationValueErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.origin = "/wrongPath%*"
                web_webview.GeolocationPermissions.deleteGeolocation(this.origin);
              } catch (error) {
                console.error(`emitDeleteGeolocationValueErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110480)
              Utils.emitEvent(this.errorMsg, 110490)
              break;
            }
            case "emitDeleteGeolocationValueIllegalErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.origin = "[1,a]"
                web_webview.GeolocationPermissions.deleteGeolocation(this.origin);
              } catch (error) {
                console.error(`emitDeleteGeolocationValueIllegalErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110500)
              Utils.emitEvent(this.errorMsg, 110510)
              break;
            }
            case "emitDeleteGeolocationValueNullErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.origin = ""
                web_webview.GeolocationPermissions.deleteGeolocation(this.origin);
              } catch (error) {
                console.error(`emitDeleteGeolocationValueNullErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110520)
              Utils.emitEvent(this.errorMsg, 110530)
              break;
            }
            case "emitGetAccessibleGeolocationCallbackValueErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "/wrongPath%*"
                web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                  if (error) {
                    console.log('getAccessibleGeolocationAsync error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetAccessibleGeolocationCallbackValueErr getAccessibleGeolocation return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110540)
                    Utils.emitEvent(this.errorMsg, 110550)
                    return;
                  }
                  console.log('getAccessibleGeolocationAsync result: ' + result);
                });
              } catch (error) {
                console.error(`emitGetAccessibleGeolocationCallbackValueErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetAccessibleGeolocationCallbackValueIllegalErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "[1,a]"
                web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                  if (error) {
                    console.log('getAccessibleGeolocationAsync error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetAccessibleGeolocationCallbackValueIllegalErr getAccessibleGeolocation return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110560)
                    Utils.emitEvent(this.errorMsg, 110570)
                    return;
                  }
                  console.log('getAccessibleGeolocationAsync result: ' + result);
                });
              } catch (error) {
                console.error(`emitGetAccessibleGeolocationCallbackValueIllegalErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetAccessibleGeolocationCallbackValueNullErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = ""
                web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                  if (error) {
                    console.log('getAccessibleGeolocationAsync error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetAccessibleGeolocationCallbackValueNullErr getAccessibleGeolocation return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110580)
                    Utils.emitEvent(this.errorMsg, 110590)
                    return;
                  }
                  console.log('getAccessibleGeolocationAsync result: ' + result);
                });
              } catch (error) {
                console.error(`emitGetAccessibleGeolocationCallbackValueNullErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetAccessibleGeolocationPromiseValueErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "/wrongPath%*"
                web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin)
                  .then(result => {
                    console.log('getAccessibleGeolocationPromise result: ' + result);
                  })
                  .catch((error:objectCss) => {
                    console.log('getAccessibleGeolocationPromise error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetAccessibleGeolocationPromiseValueErr getAccessibleGeolocation return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110600)
                    Utils.emitEvent(this.errorMsg, 110610)
                  });
              } catch (error) {
                console.error(`emitGetAccessibleGeolocationPromiseValueErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetAccessibleGeolocationPromiseValueIllegalErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "[1,a]"
                web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin)
                  .then(result => {
                    console.log('getAccessibleGeolocationPromise result: ' + result);
                  })
                  .catch((error:objectCss) => {
                    console.log('getAccessibleGeolocationPromise error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetAccessibleGeolocationPromiseValueIllegalErr getAccessibleGeolocation return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110620)
                    Utils.emitEvent(this.errorMsg, 110630)
                  });
              } catch (error) {
                console.error(`emitGetAccessibleGeolocationPromiseValueIllegalErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetAccessibleGeolocationPromiseValueNullErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = ""
                web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin)
                  .then(result => {
                    console.log('getAccessibleGeolocationPromise result: ' + result);
                  })
                  .catch((error:objectCss) => {
                    console.log('getAccessibleGeolocationPromise error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetAccessibleGeolocationPromiseValueNullErr getAccessibleGeolocation return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110640)
                    Utils.emitEvent(this.errorMsg, 110650)
                  });
              } catch (error) {
                console.error(`emitGetAccessibleGeolocationPromiseValueNullErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}