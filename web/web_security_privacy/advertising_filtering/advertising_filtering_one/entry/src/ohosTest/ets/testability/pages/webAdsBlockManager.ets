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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import {waitForExist} from '../../test/WaitTest';

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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isEnableAdsBlock: number = -1;
  @State isSetAdsBlockRules: number = -1;

  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 161050,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(161050)
  }


  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
              this.isReceive = 0;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('web click')
              .key('webViewSdkSchemeHandler')
              .onClick(async () => {
                await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                await waitForExist(() => this.isReceive, this.emitKey, 0);
                this.isReceive = -1;
                  console.info('key==>' + this.emitKey)
                  switch (this.emitKey) {
                    case 'emitEnableAdsBlock': {
                      try {
                        this.controller.enableAdsBlock(true);
                        this.isEnableAdsBlock = 1;
                        console.log(' enableAdsBlock:  true');
                        this.isPageEnd = -1;
                        this.controller.refresh();
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        Utils.emitEvent(true, 161060)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitEnableAdsBlock The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161060)
                        } else {
                          Utils.emitEvent(false, 161060)
                        }
                      }
                      break;
                    }

                    case 'emitIsAdsBlockEnabled': {
                      try {
                        let isBlocked: boolean = this.controller.isAdsBlockEnabled();
                        console.log(' isAdsBlockEnabled:  ', isBlocked);
                        Utils.emitEvent(true, 161070)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitIsAdsBlockEnabled The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161070)
                        } else {
                          Utils.emitEvent(false, 161070)
                        }
                      }
                      break;
                    }

                    case 'emitIsAdsBlockEnabledForCurPage': {
                      try {
                        let isBlockedCurPage: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' isAdsBlockEnabledForCurPage:  ', isBlockedCurPage);
                        Utils.emitEvent(true, 161080)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitIsAdsBlockEnabledForCurPage The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161080)
                        } else {
                          Utils.emitEvent(false, 161080)
                        }
                      }
                      break;
                    }

                    case 'emitSetAdsBlockRules': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();

                        let rulePath: string = Utils.copyRawFileToSandbox('custom_easylist.txt');
                        try {
                          let context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
                          let content = context.resourceManager.getRawFileContentSync('custom_easylist.txt');
                          let text = buffer.from(content).toString('utf8');
                          let lines = text.split('\n');
                          console.log("lines no:", lines.length);
                        } catch (e) {
                          console.error("read txt faild:", e);
                        }
       
                        this.isSetAdsBlockRules = -1;
                        webview.AdsBlockManager.setAdsBlockRules(rulePath, true);
                        await waitForExist(() => this.isSetAdsBlockRules, this.emitKey, 0);
                        console.log("set block success");
                        Utils.deleteFile(rulePath);
                        this.isPageEnd = -1;
                        this.controller.refresh();
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' setAdsBlockRules true:  ');
                        console.log(' isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        Utils.emitEvent(true, 161090)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitSetAdsBlockRules The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161090)
                        } else {
                          Utils.emitEvent(false, 161090)
                        }
                      }
                      break;
                    }

                    case 'emitSetAdsBlockRulesFalse': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();

                        let rulePath: string = Utils.copyRawFileToSandbox('custom_easylist.txt');
                        this.isSetAdsBlockRules = -1;
                        webview.AdsBlockManager.setAdsBlockRules(rulePath, true);
                        await waitForExist(() => this.isSetAdsBlockRules, this.emitKey, 0);
                        Utils.deleteFile(rulePath);
                        this.isPageEnd = -1;
                        this.controller.refresh();
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' setAdsBlockRules false:  ');
                        console.log(' isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        Utils.emitEvent(true, 161100)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitSetAdsBlockRulesFalse The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161100)
                        } else {
                          Utils.emitEvent(false, 161100)
                        }
                      }
                      break;
                    }

                    case 'emitAddAdsBlockDisallowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();


                        let arrDomainSuffixes = new Array<string>();
                        arrDomainSuffixes.push(this.main_url);
                        webview.AdsBlockManager.addAdsBlockDisallowedList(arrDomainSuffixes);
                        this.isPageEnd = -1;
                        this.controller.loadUrl(this.src_url)
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' addAdsBlockDisallowedList:  ' + this.main_url);
                        console.log(' addAdsBlockDisallowedList: isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' addAdsBlockDisallowedList: isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        Utils.emitEvent(true, 161110)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitAddAdsBlockDisallowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161110)
                        } else {
                          Utils.emitEvent(false, 161110)
                        }
                      }
                      break;
                    }

                    case 'emitRemoveAdsBlockDisallowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();


                        let arrDomainSuffixes = new Array<string>();
                        arrDomainSuffixes.push(this.main_url);
                        webview.AdsBlockManager.removeAdsBlockDisallowedList(arrDomainSuffixes);
                        this.isPageEnd = -1;
                        this.controller.loadUrl(this.src_url)
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' removeAdsBlockDisallowedList:  ' + this.main_url);
                        console.log(' removeAdsBlockDisallowedList isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' removeAdsBlockDisallowedList isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        Utils.emitEvent(true, 161120)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitRemoveAdsBlockDisallowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161120)
                        } else {
                          Utils.emitEvent(false, 161120)
                        }
                      }
                      break;
                    }

                    case 'emitClearAdsBlockDisallowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        webview.AdsBlockManager.clearAdsBlockDisallowedList();
                        this.isPageEnd = -1;
                        this.controller.loadUrl(this.src_url)
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log('clearAdsBlockDisallowedList:  ' + this.main_url);
                        console.log('clearAdsBlockDisallowedList: isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log('clearAdsBlockDisallowedList: isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);
                        Utils.emitEvent(true, 161130)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitClearAdsBlockDisallowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161130)
                        } else {
                          Utils.emitEvent(false, 161130)
                        }
                      }
                      break;
                    }

                    case 'emitAddAdsBlockAllowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();


                        let arrDomainSuffixes = new Array<string>();
                        arrDomainSuffixes.push(this.main_url);
                        webview.AdsBlockManager.addAdsBlockAllowedList(arrDomainSuffixes);
                        this.isPageEnd = -1;
                        this.controller.loadUrl(this.src_url)
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' addAdsBlockAllowedList:  ' + this.main_url);
                        console.log(' addAdsBlockAllowedList: isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' addAdsBlockAllowedList: isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        Utils.emitEvent(true, 161140)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitAddAdsBlockAllowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161140)
                        } else {
                          Utils.emitEvent(false, 161140)
                        }
                      }
                      break;
                    }

                    case 'emitRemoveAdsBlockAllowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();


                        let arrDomainSuffixes = new Array<string>();
                        arrDomainSuffixes.push(this.main_url);
                        webview.AdsBlockManager.removeAdsBlockAllowedList(arrDomainSuffixes);
                        this.isPageEnd = -1;
                        this.controller.loadUrl(this.src_url)
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' removeAdsBlockAllowedList:  ' + this.main_url);
                        console.log(' removeAdsBlockAllowedList isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' removeAdsBlockAllowedList isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                        Utils.emitEvent(true, 161150)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitRemoveAdsBlockAllowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161150)
                        } else {
                          Utils.emitEvent(false, 161150)
                        }
                      }
                      break;
                    }

                    case 'emitClearAdsBlockAllowedList': {
                      try {
                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();


                        webview.AdsBlockManager.clearAdsBlockAllowedList();
                        this.isPageEnd = -1;
                        this.controller.loadUrl(this.src_url)
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log(' clearAdsBlockAllowedList:  ' + this.main_url);
                        console.log(' clearAdsBlockAllowedList isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log(' clearAdsBlockAllowedList isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);
                        this.isPageEnd = -1;
                        this.controller.loadUrl(CommonConstants.ADS_URL1);
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);

                        Utils.emitEvent(true, 161160)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitRemoveAdsBlockAllowedList The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161160)
                        } else {
                          Utils.emitEvent(false, 161160)
                        }
                      }
                      break;
                    }

                    case 'emitOnAdsBlocked': {
                      if( this.isEnableAdsBlock == -1) {
                        this.controller.enableAdsBlock(true);
                        console.log(' enableAdsBlock:  true');


                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log("start set block rules");
                        let rulePath: string = Utils.copyRawFileToSandbox('custom_easylist.txt');
                        console.log("rules path:", rulePath);

                        try {
                          let context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
                          let content = context.resourceManager.getRawFileContentSync('custom_easylist.txt');
                          let text = buffer.from(content).toString('utf8');
                          let lines = text.split('\n');
                          console.log("lines no:", lines.length);
                        } catch (e) {
                          console.error("read txt faild:", e);
                        }
                        this.isSetAdsBlockRules = -1;
                        webview.AdsBlockManager.setAdsBlockRules(rulePath, true);
                        await waitForExist(() => this.isSetAdsBlockRules, this.emitKey, 0);
                        console.log("set block rules success");
                        Utils.deleteFile(rulePath);
                        this.isPageEnd = -1;
                        this.controller.refresh()
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        console.log('setAdsBlockRules true:  ');
                        console.log('isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                        console.log('isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);
                      }

                      console.log("emitOnAdsBlocked case started - start callback");

                      console.log("start text URLs...");
                      this.isPageEnd = -1;
                      this.controller.loadUrl(CommonConstants.ADS_URL1);
                      await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                      console.log("URL1 success");

                      this.isPageEnd = -1;
                      this.controller.loadUrl(CommonConstants.ADS_URL2);
                      await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                      console.log("URL2 success");

                      this.isPageEnd = -1;
                      this.controller.loadUrl(CommonConstants.ADS_URL3);
                      await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                      console.log("URL3 success");
                      this.controller.loadUrl(CommonConstants.ADS_URL4);

                      if (this.testIsOnAdsBlocked || this.errorCode == 801) {
                        console.log("emitOnAdsBlocked: success");
                        Utils.emitEvent(true, 161170)
                      } else {
                        console.log("emitOnAdsBlocked: faild no callback");
                        Utils.emitEvent(false, 161170)
                      }

                      break;
                    }

                    case 'emitEnableAdsBlockFalse': {
                      try {
                        this.controller.enableAdsBlock(false);
                        console.log(' enableAdsBlock:  true');
                        this.isPageEnd = -1;
                        this.controller.refresh();
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        Utils.emitEvent(true, 161180)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitEnableAdsBlockFalse The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161180)
                        } else {
                          Utils.emitEvent(false, 161180)
                        }
                      }
                      break;
                    }

                    case 'emitIsAdsBlockEnabledCheck': {
                      try {
                        let isBlocked: boolean = this.controller.isAdsBlockEnabled();
                        console.log(' isAdsBlockEnabled:  ', isBlocked);

                        Utils.emitEvent(!isBlocked, 161190)
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        if(e.code == 801) {
                          console.log(`emitIsAdsBlockEnabledCheck The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                          this.errorCode = 801
                          Utils.emitEvent(true, 161190)
                        } else {
                          Utils.emitEvent(false, 161190)
                        }
                      }
                      break;
                    }

                    case 'emitOnAdsBlockedTest': {
                      if( this.isEnableAdsBlock == -1) {
                        this.controller.enableAdsBlock(true);
                        console.log(' enableAdsBlock:  true');

                        let isBlockedCurPageBefore: boolean = this.controller.isAdsBlockEnabledForCurPage();
                        let rulePath: string = Utils.copyRawFileToSandbox('custom_easylist.txt');

                        try {
                          let context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
                          let content = context.resourceManager.getRawFileContentSync('custom_easylist.txt');
                          let text = buffer.from(content).toString('utf8');
                          let lines = text.split('\n');
                          console.log("lines no:", lines.length);
                        } catch (e) {
                          console.error("read block rules faild:", e);
                        }
                        this.isSetAdsBlockRules = -1;
                        webview.AdsBlockManager.setAdsBlockRules(rulePath, true);
                        await waitForExist(() => this.isSetAdsBlockRules, this.emitKey, 0);
                        console.log("set block rules success");

                        Utils.deleteFile(rulePath);
                        this.isPageEnd = -1;
                        this.controller.refresh()
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();

                        console.log("start test URLs...");
                        this.isPageEnd = -1;
                        this.controller.loadUrl(CommonConstants.ADS_URL1);
                        await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                        console.log("URL1 success");
                      }
                      if (this.testOnAdsBlockedDetails || this.errorCode == 801) {
                        Utils.emitEvent(true, 161200)
                      } else {
                        Utils.emitEvent(false, 161200)
                      }

                      break;
                    }

                  }
              })
          }
          Web({ src: this.src_url, controller: this.controller })
            .onAdsBlocked(( details: AdsBlockedDetails) => {
              console.log("onAdsBlocked callback!");
              console.log("callback :", JSON.stringify(details));
              this.isSetAdsBlockRules = 0;

              this.testIsOnAdsBlocked = true;
              if (details) {
                this.testOnAdsBlockedDetails = true;
                console.log('blocked ' + details.adsBlocked.length + ' URL: ' + details.url);
                if (details.adsBlocked.length > 0) {
                  console.log("blocked info:", details.adsBlocked);
                }
              } else {
                console.log("details is null or undefined");
              }
              return false;
            })
            .onPageEnd(()=>{
              this.isPageEnd = 0;
            })
      }
  }
}
