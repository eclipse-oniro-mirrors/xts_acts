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
import { CommonConstants } from '../../test/constant'
import business_error from '@ohos.base'
import buffer from '@ohos.buffer'
import { WebNetErrorList } from '@ohos.web.netErrorList'
@Entry
@Component
struct webAdsBlockManager {
  controller: webview.WebviewController = new webview.WebviewController();
  main_url: string = 'hao123.com';
  src_url: string = CommonConstants.ADS_URL1;

  @State testIsOnAdsBlocked: boolean = false;
  @State testOnAdsBlockedDetails: boolean = false;
  @State emitKey: string = '';
  @State errorCode: number = 0

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
              .key('webViewSdkSchemeHandler')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.sleep(3000);
                  switch (this.emitKey) {
                    case 'emitEnableAdsBlock': {
                      try {
                        this.controller.enableAdsBlock(true);
                        console.log(' enableAdsBlock:  true');

                        this.controller.refresh();

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1001)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitEnableAdsBlock The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1001)
                        } else {
                          Utils.emitEvent(false, 1001)
                        }

                      }
                      break;
                    }

                    case 'emitIsAdsBlockEnabled': {
                      try {
                        let isBlocked: boolean = this.controller.isAdsBlockEnabled();
                        console.log(' isAdsBlockEnabled:  ', isBlocked);

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1002)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitIsAdsBlockEnabled The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1002)
                        } else {
                          Utils.emitEvent(false, 1002)
                        }
                      }
                      break;
                    }

                    case 'emitIsAdsBlockEnabledForCurPage': {
                      try {
                        let isBlockedCurPage: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' isAdsBlockEnabledForCurPage:  ', isBlockedCurPage);

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1003)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitIsAdsBlockEnabledForCurPage The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1003)
                        } else {
                          Utils.emitEvent(false, 1003)
                        }
                      }
                      break;
                    }

                    case 'emitSetAdsBlockRules': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();

                        let rulePath: string = Utils.copyRawFileToSandbox('custom_easylist.txt');
                        await Utils.sleep(1000)
                        webview.AdsBlockManager.setAdsBlockRules(rulePath, true);
                        await Utils.sleep(15000)
                        Utils.deleteFile(rulePath);
                        this.controller.refresh()

                        await Utils.sleep(1000)
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' setAdsBlockRules true:  ');
                        console.log(' isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1004)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitSetAdsBlockRules The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1004)
                        } else {
                          Utils.emitEvent(false, 1004)
                        }
                      }
                      break;
                    }

                    case 'emitSetAdsBlockRulesFalse': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();

                        let rulePath: string = Utils.copyRawFileToSandbox('custom_easylist.txt');
                        await Utils.sleep(1000)
                        webview.AdsBlockManager.setAdsBlockRules(rulePath, false);
                        await Utils.sleep(15000)
                        Utils.deleteFile(rulePath);
                        this.controller.refresh()

                        await Utils.sleep(1000)
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' setAdsBlockRules false:  ');
                        console.log(' isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1005)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitSetAdsBlockRulesFalse The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1005)
                        } else {
                          Utils.emitEvent(false, 1005)
                        }
                      }
                      break;
                    }

                    case 'emitAddAdsBlockDisallowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();

                        await Utils.sleep(1000)

                        let arrDomainSuffixes = new Array<string>();
                        arrDomainSuffixes.push(this.main_url);
                        webview.AdsBlockManager.addAdsBlockDisallowedList(arrDomainSuffixes);
                        await Utils.sleep(1000)
                        this.controller.loadUrl(this.src_url)
                        await Utils.sleep(1000)
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' addAdsBlockDisallowedList:  ' + this.main_url);
                        console.log(' addAdsBlockDisallowedList: isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' addAdsBlockDisallowedList: isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1006)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitAddAdsBlockDisallowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1006)
                        } else {
                          Utils.emitEvent(false, 1006)
                        }
                      }
                      break;
                    }

                    case 'emitRemoveAdsBlockDisallowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();

                        await Utils.sleep(1000)

                        let arrDomainSuffixes = new Array<string>();
                        arrDomainSuffixes.push(this.main_url);
                        webview.AdsBlockManager.removeAdsBlockDisallowedList(arrDomainSuffixes);
                        await Utils.sleep(1000)
                        this.controller.loadUrl(this.src_url)
                        await Utils.sleep(1000)
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' removeAdsBlockDisallowedList:  ' + this.main_url);
                        console.log(' removeAdsBlockDisallowedList isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' removeAdsBlockDisallowedList isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1007)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitRemoveAdsBlockDisallowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1007)
                        } else {
                          Utils.emitEvent(false, 1007)
                        }
                      }
                      break;
                    }

                    case 'emitClearAdsBlockDisallowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        await Utils.sleep(1000)
                        webview.AdsBlockManager.clearAdsBlockDisallowedList();
                        await Utils.sleep(1000)
                        this.controller.loadUrl(this.src_url)
                        await Utils.sleep(1000)
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log('clearAdsBlockDisallowedList:  ' + this.main_url);
                        console.log('clearAdsBlockDisallowedList: isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log('clearAdsBlockDisallowedList: isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1008)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitClearAdsBlockDisallowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1008)
                        } else {
                          Utils.emitEvent(false, 1008)
                        }
                      }
                      break;
                    }

                    case 'emitAddAdsBlockAllowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();

                        await Utils.sleep(1000)

                        let arrDomainSuffixes = new Array<string>();
                        arrDomainSuffixes.push(this.main_url);
                        webview.AdsBlockManager.addAdsBlockAllowedList(arrDomainSuffixes);
                        await Utils.sleep(1000)
                        this.controller.loadUrl(this.src_url)
                        await Utils.sleep(1000)
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' addAdsBlockAllowedList:  ' + this.main_url);
                        console.log(' addAdsBlockAllowedList: isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' addAdsBlockAllowedList: isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1009)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitAddAdsBlockAllowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1009)
                        } else {
                          Utils.emitEvent(false, 1009)
                        }
                      }
                      break;
                    }

                    case 'emitRemoveAdsBlockAllowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();

                        await Utils.sleep(1000)

                        let arrDomainSuffixes = new Array<string>();
                        arrDomainSuffixes.push(this.main_url);
                        webview.AdsBlockManager.removeAdsBlockAllowedList(arrDomainSuffixes);
                        await Utils.sleep(1000)
                        this.controller.loadUrl(this.src_url)
                        await Utils.sleep(1000)
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' removeAdsBlockAllowedList:  ' + this.main_url);
                        console.log(' removeAdsBlockAllowedList isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' removeAdsBlockAllowedList isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1010)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitRemoveAdsBlockAllowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1010)
                        } else {
                          Utils.emitEvent(false, 1010)
                        }
                      }
                      break;
                    }

                    case 'emitClearAdsBlockAllowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();

                        await Utils.sleep(1000)
                        webview.AdsBlockManager.clearAdsBlockAllowedList();
                        await Utils.sleep(1000)
                        this.controller.loadUrl(this.src_url)
                        await Utils.sleep(1000)
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' clearAdsBlockAllowedList:  ' + this.main_url);
                        console.log(' clearAdsBlockAllowedList isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' clearAdsBlockAllowedList isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        this.controller.loadUrl(CommonConstants.ADS_URL1);
                        await Utils.sleep(1000)

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1011)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitRemoveAdsBlockAllowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1011)
                        } else {
                          Utils.emitEvent(false, 1011)
                        }
                      }
                      break;
                    }

                    case 'emitOnAdsBlocked': {

                      this.controller.loadUrl(CommonConstants.ADS_URL1);
                      Utils.sleep(4000);
                      this.controller.loadUrl(CommonConstants.ADS_URL2);
                      this.controller.refresh();
                      Utils.sleep(4000);
                      this.controller.loadUrl(CommonConstants.ADS_URL3);
                      this.controller.refresh();
                      Utils.sleep(4000);
                      this.controller.loadUrl(CommonConstants.ADS_URL4);
                      this.controller.refresh();
                      Utils.sleep(2000);

                      if (this.testIsOnAdsBlocked || this.errorCode == 801) {
                        Utils.emitEvent(true, 1012)
                      } else {
                        Utils.emitEvent(false, 1012)
                      }

                      break;
                    }

                    case 'emitEnableAdsBlockFalse': {
                      try {
                        this.controller.enableAdsBlock(false);
                        console.log(' enableAdsBlock:  true');

                        this.controller.refresh();

                        await Utils.sleep(1000)
                        Utils.emitEvent(true, 1013)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitEnableAdsBlockFalse The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1013)
                        } else {
                          Utils.emitEvent(false, 1013)
                        }
                      }
                      break;
                    }

                    case 'emitIsAdsBlockEnabledCheck': {
                      try {
                        let isBlocked: boolean = this.controller.isAdsBlockEnabled();
                        console.log(' isAdsBlockEnabled:  ', isBlocked);

                        await Utils.sleep(1000)
                        Utils.emitEvent(!isBlocked, 1014)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        await Utils.sleep(1000)
                        if(e.code == 801) {
                          console.log(`emitIsAdsBlockEnabledCheck The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 1014)
                        } else {
                          Utils.emitEvent(false, 1014)
                        }
                      }
                      break;
                    }

                    case 'emitOnAdsBlockedTest': {
                      if (this.testOnAdsBlockedDetails || this.errorCode == 801) {
                        Utils.emitEvent(true, 1015)
                      } else {
                        Utils.emitEvent(false, 1015)
                      }

                      break;
                    }

                  }
              })
          }
          Web({ src: this.src_url, controller: this.controller })
            .onAdsBlocked(( details: AdsBlockedDetails) => {
              this.testIsOnAdsBlocked = true;
              if (details) {
                this.testOnAdsBlockedDetails = true;
                console.log(' Blocked ' + details.adsBlocked.length + ' in ' + details.url);
              }
              return false;
            })
      }
  }
}
