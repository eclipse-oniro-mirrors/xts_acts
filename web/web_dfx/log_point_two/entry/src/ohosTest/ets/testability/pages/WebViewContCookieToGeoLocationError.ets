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
            case "emitGetCookieInitErr": {
              try {
                web_webview.WebCookieManager.getCookie('[1,2]');
              } catch (error) {
                console.error(`emitGetCookieInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110020)
              Utils.emitEvent(this.errorMsg, 110030)
              break;
            }
            case "emitSetCookieInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                web_webview.WebCookieManager.setCookie('[1,2]', 'a=b');
              } catch (error) {
                console.error(`emitSetCookieInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110040)
              Utils.emitEvent(this.errorMsg, 110050)
              break;
            }
            case "emitSetCookieValueErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                web_webview.WebCookieManager.setCookie('https://www.example.com', '');
              } catch (error) {
                console.error(`emitSetCookieValueErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110060)
              Utils.emitEvent(this.errorMsg, 110070)
              break;
            }
            case "emitDeleteOriginValueNullErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                web_webview.WebStorage.deleteOrigin(this.origin);
              } catch (error) {
                console.error(`emitDeleteOriginValueNullErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110080)
              Utils.emitEvent(this.errorMsg, 110090)
              break;
            }
            case "emitDeleteOriginValueIllegalErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.origin = "[1,a]"
                web_webview.WebStorage.deleteOrigin(this.origin);
              } catch (error) {
                console.error(`emitDeleteOriginValueIllegalErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110100)
              Utils.emitEvent(this.errorMsg, 110110)
              break;
            }
            case "emitDeleteOriginValueErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.origin = "/wrongPath%*"
                web_webview.WebStorage.deleteOrigin(this.origin);
              } catch (error) {
                console.error(`emitDeleteOriginValueErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 110120)
              Utils.emitEvent(this.errorMsg, 110130)
              break;
            }
            case "emitGetOriginsCallbackUnAPIErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.databaseAccess = false;
                this.controller.refresh();
                web_webview.WebStorage.getOrigins((error, origins) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginsCallbackUnAPIErr getOrigins return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110140)
                    Utils.emitEvent(this.errorMsg, 110150)
                    return;
                  }
                  for (let i = 0; i < origins.length; i++) {
                    console.log('origin: ' + origins[i].origin);
                    console.log('usage: ' + origins[i].usage);
                    console.log('quota: ' + origins[i].quota);
                  }
                })
              } catch (error) {
                console.error(`emitGetOriginsCallbackUnAPIErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.databaseAccess = true;
              break;
            }
            case "emitGetOriginsPromiseUnAPIErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.databaseAccess = false;
                this.controller.refresh();
                web_webview.WebStorage.getOrigins()
                  .then(origins => {
                    for (let i = 0; i < origins.length; i++) {
                      console.log('origin: ' + origins[i].origin);
                      console.log('usage: ' + origins[i].usage);
                      console.log('quota: ' + origins[i].quota);
                    }
                  })
                  .catch((error:objectCss) => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginsPromiseUnAPIErr getOrigins return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110160)
                    Utils.emitEvent(this.errorMsg, 110170)
                  })
              } catch (error) {
                console.error(`emitGetOriginsPromiseUnAPIErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.databaseAccess = true;
              break;
            }
            case "emitGetOriginQuotaCallbackValueErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "/wrongPath%*"
                web_webview.WebStorage.getOriginQuota(this.origin, (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginQuotaCallbackValueErr getOriginQuota return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110180)
                    Utils.emitEvent(this.errorMsg, 110190)
                    return;
                  }
                  console.log('quota: ' + quota);
                })
              } catch (error) {
                console.error(`emitGetOriginQuotaCallbackValueErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetOriginQuotaCallbackValueIllegalErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "[1,a]"
                web_webview.WebStorage.getOriginQuota(this.origin, (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginQuotaCallbackValueIllegalErr getOriginQuota return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110200)
                    Utils.emitEvent(this.errorMsg, 110210)
                    return;
                  }
                  console.log('quota: ' + quota);
                })
              } catch (error) {
                console.error(`emitGetOriginQuotaCallbackValueIllegalErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetOriginQuotaCallbackValueNullErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = ""
                web_webview.WebStorage.getOriginQuota(this.origin, (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginQuotaCallbackValueNullErr getOriginQuota return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110220)
                    Utils.emitEvent(this.errorMsg, 110230)
                    return;
                  }
                  console.log('quota: ' + quota);
                })
              } catch (error) {
                console.error(`emitGetOriginQuotaCallbackValueNullErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetOriginQuotaPromiseValueErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "/wrongPath%*"
                web_webview.WebStorage.getOriginQuota(this.origin)
                  .then(quota => {
                    console.log('quota: ' + quota);
                  })
                  .catch((error:objectCss) => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginQuotaPromiseValueErr getOriginQuota return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110240)
                    Utils.emitEvent(this.errorMsg, 110250)
                  })
              } catch (error) {
                console.error(`emitGetOriginQuotaPromiseValueErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetOriginQuotaPromiseValueIllegalErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "[1,a]"
                web_webview.WebStorage.getOriginQuota(this.origin)
                  .then(quota => {
                    console.log('quota: ' + quota);
                  })
                  .catch((error:objectCss) => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginQuotaPromiseValueIllegalErr getOriginQuota return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110260)
                    Utils.emitEvent(this.errorMsg, 110270)
                  })
              } catch (error) {
                console.error(`emitGetOriginQuotaPromiseValueIllegalErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetOriginQuotaPromiseValueNullErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = ""
                web_webview.WebStorage.getOriginQuota(this.origin)
                  .then(quota => {
                    console.log('quota: ' + quota);
                  })
                  .catch((error:objectCss) => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginQuotaPromiseValueNullErr getOriginQuota return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110280)
                    Utils.emitEvent(this.errorMsg, 110290)
                  })
              } catch (error) {
                console.error(`emitGetOriginQuotaPromiseValueNullErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetOriginUsageCallbackValueErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "/wrongPath%*"
                web_webview.WebStorage.getOriginUsage(this.origin, (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginUsageCallbackValueErr getOriginUsage return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110300)
                    Utils.emitEvent(this.errorMsg, 110310)
                    return;
                  }
                  console.log('usage: ' + usage);
                })
              } catch (error) {
                console.error(`emitGetOriginUsageCallbackValueErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetOriginUsageCallbackValueIllegalErr": {
              try {
                this.errorTestCode = 0;
                this.errorMsg = 'failed';
                this.origin = "[1,a]"
                web_webview.WebStorage.getOriginUsage(this.origin, (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error('emitGetOriginUsageCallbackValueIllegalErr getOriginUsage return result is :' + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 110320)
                    Utils.emitEvent(this.errorMsg, 110330)
                    return;
                  }
                  console.log('usage: ' + usage);
                })
              } catch (error) {
                console.error(`emitGetOriginUsageCallbackValueIllegalErr ErrorCode: ${error.code},  Message: ${error.message}`);
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