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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct webViewContCookieToGeoLocationError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitGetCookieInitErr";
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
  origin: string = "";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewContCookieToGeoLocationError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("CookieToGeoLocationErrorTest").key('webViewContCookieToGeoLocationError').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitGetCookieInitErr": {
              try {
                web_webview.WebCookieManager.getCookie('[1,2]');
              } catch (error) {
                console.error(`emitGetCookieInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code;
                this.errorMsg = error.message;
              }
              Utils.emitEvent(this.errorCode, 752)
              Utils.emitEvent(this.errorMsg, 753)
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
              Utils.emitEvent(this.errorCode, 754)
              Utils.emitEvent(this.errorMsg, 755)
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
              Utils.emitEvent(this.errorCode, 756)
              Utils.emitEvent(this.errorMsg, 757)
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
              Utils.emitEvent(this.errorCode, 758)
              Utils.emitEvent(this.errorMsg, 759)
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
              Utils.emitEvent(this.errorCode, 760)
              Utils.emitEvent(this.errorMsg, 761)
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
              Utils.emitEvent(this.errorCode, 762)
              Utils.emitEvent(this.errorMsg, 763)
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
                    console.error("emitGetOriginsCallbackUnAPIErr getOrigins return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 764)
                    Utils.emitEvent(this.errorMsg, 765)
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
                  .catch(error => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetOriginsPromiseUnAPIErr getOrigins return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 766)
                    Utils.emitEvent(this.errorMsg, 767)
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
                    console.error("emitGetOriginQuotaCallbackValueErr getOriginQuota return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 768)
                    Utils.emitEvent(this.errorMsg, 769)
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
                    console.error("emitGetOriginQuotaCallbackValueIllegalErr getOriginQuota return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 770)
                    Utils.emitEvent(this.errorMsg, 771)
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
                    console.error("emitGetOriginQuotaCallbackValueNullErr getOriginQuota return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 772)
                    Utils.emitEvent(this.errorMsg, 773)
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
                  .catch(error => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetOriginQuotaPromiseValueErr getOriginQuota return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 774)
                    Utils.emitEvent(this.errorMsg, 775)
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
                  .catch(error => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetOriginQuotaPromiseValueIllegalErr getOriginQuota return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 776)
                    Utils.emitEvent(this.errorMsg, 777)
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
                  .catch(error => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetOriginQuotaPromiseValueNullErr getOriginQuota return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 778)
                    Utils.emitEvent(this.errorMsg, 779)
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
                    console.error("emitGetOriginUsageCallbackValueErr getOriginUsage return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 780)
                    Utils.emitEvent(this.errorMsg, 781)
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
                    console.error("emitGetOriginUsageCallbackValueIllegalErr getOriginUsage return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 782)
                    Utils.emitEvent(this.errorMsg, 783)
                    return;
                  }
                  console.log('usage: ' + usage);
                })
              } catch (error) {
                console.error(`emitGetOriginUsageCallbackValueIllegalErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
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
                    console.error("emitGetOriginUsageCallbackValueNullErr getOriginUsage return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 784)
                    Utils.emitEvent(this.errorMsg, 785)
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
                  .catch(error => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetOriginUsagePromiseValueErr getOriginUsage return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 786)
                    Utils.emitEvent(this.errorMsg, 787)
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
                  .catch(error => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetOriginUsagePromiseValueIllegalErr getOriginUsage return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 788)
                    Utils.emitEvent(this.errorMsg, 789)
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
                  .catch(error => {
                    console.log('error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetOriginUsagePromiseValueNullErr getOriginUsage return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 790)
                    Utils.emitEvent(this.errorMsg, 791)
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
              Utils.emitEvent(this.errorCode, 792)
              Utils.emitEvent(this.errorMsg, 793)
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
              Utils.emitEvent(this.errorCode, 794)
              Utils.emitEvent(this.errorMsg, 795)
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
              Utils.emitEvent(this.errorCode, 796)
              Utils.emitEvent(this.errorMsg, 797)
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
              Utils.emitEvent(this.errorCode, 798)
              Utils.emitEvent(this.errorMsg, 799)
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
              Utils.emitEvent(this.errorCode, 800)
              Utils.emitEvent(this.errorMsg, 801)
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
              Utils.emitEvent(this.errorCode, 802)
              Utils.emitEvent(this.errorMsg, 803)
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
                    console.error("emitGetAccessibleGeolocationCallbackValueErr getAccessibleGeolocation return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 804)
                    Utils.emitEvent(this.errorMsg, 805)
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
                    console.error("emitGetAccessibleGeolocationCallbackValueIllegalErr getAccessibleGeolocation return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 806)
                    Utils.emitEvent(this.errorMsg, 807)
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
                    console.error("emitGetAccessibleGeolocationCallbackValueNullErr getAccessibleGeolocation return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 808)
                    Utils.emitEvent(this.errorMsg, 809)
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
                  .catch(error => {
                    console.log('getAccessibleGeolocationPromise error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetAccessibleGeolocationPromiseValueErr getAccessibleGeolocation return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 810)
                    Utils.emitEvent(this.errorMsg, 811)
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
                  .catch(error => {
                    console.log('getAccessibleGeolocationPromise error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetAccessibleGeolocationPromiseValueIllegalErr getAccessibleGeolocation return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 812)
                    Utils.emitEvent(this.errorMsg, 813)
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
                  .catch(error => {
                    console.log('getAccessibleGeolocationPromise error: ' + JSON.stringify(error));
                    this.errorTestCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetAccessibleGeolocationPromiseValueNullErr getAccessibleGeolocation return result is :" + this.errorTestCode + this.errorMsg);
                    Utils.emitEvent(this.errorTestCode, 814)
                    Utils.emitEvent(this.errorMsg, 815)
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
    }
  }
}