/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  OnRenderExitedEvent,
  OnPageBeginEvent,
  RenderProcessNotRespondingReason,
  RenderProcessNotRespondingData,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  UIContext,
  LargestContentfulPaint,
  AdsBlockedDetails
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import events_emitter from '@ohos.events.emitter'
import emitter from '@ohos.events.emitter'
import webview from '@ohos.web.webview'
import Utils from '../../src/test/Utils.test';
import { BusinessError, Callback, RecordData } from '@ohos.base'
import buffer from '@ohos.buffer'
class StringFields {
  public str: string = '';
}
@Entry
@Component
struct webAdsBlockManager {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  main_url: string = 'hao123.com';
  src_url: string = 'https://www.hao123.com/'
  @State testIsOnAdsBlocked: boolean = false;
  @State testOnAdsBlockedDetails: boolean = false;
  @State emitKey: string = '';
  @State errorCode: number = 0
  stringObj: StringFields  = new StringFields ();

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION vaclue: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column(undefined) {
      Row() {
        Button('web click')
          .key('webViewSdkSchemeHandler')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitEnableAdsBlock': {
                try {
                  this.controller.enableAdsBlock(true);
                  console.log(' enableAdsBlock:  true');

                  this.controller.refresh();
                  Utils.emitEvent(true, 1001)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitEnableAdsBlock The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
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

                  Utils.emitEvent(true, 1002)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitIsAdsBlockEnabled The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
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

                  Utils.emitEvent(true, 1003)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitIsAdsBlockEnabledForCurPage The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
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
                  webview.AdsBlockManager.setAdsBlockRules(rulePath, true);
                  Utils.deleteFile(rulePath);
                  this.controller.refresh()

                  let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                  console.log(' setAdsBlockRules true:  ');
                  console.log(' isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                  console.log(' isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                  Utils.emitEvent(true, 1004)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitSetAdsBlockRules The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
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
                  webview.AdsBlockManager.setAdsBlockRules(rulePath, false);
                  Utils.deleteFile(rulePath);
                  this.controller.refresh()

                  let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                  console.log(' setAdsBlockRules false:  ');
                  console.log(' isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                  console.log(' isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                  Utils.emitEvent(true, 1005)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitSetAdsBlockRulesFalse The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
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


                  let arrDomainSuffixes = new Array<string>();
                  arrDomainSuffixes.push(this.main_url);
                  webview.AdsBlockManager.addAdsBlockDisallowedList(arrDomainSuffixes);
                  this.controller.loadUrl(this.src_url)
                  let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                  console.log(' addAdsBlockDisallowedList:  ' + this.main_url);
                  console.log(' addAdsBlockDisallowedList: isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                  console.log(' addAdsBlockDisallowedList: isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                  Utils.emitEvent(true, 1006)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitAddAdsBlockDisallowedList The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
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


                  let arrDomainSuffixes = new Array<string>();
                  arrDomainSuffixes.push(this.main_url);
                  webview.AdsBlockManager.removeAdsBlockDisallowedList(arrDomainSuffixes);
                  this.controller.loadUrl(this.src_url)
                  let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                  console.log(' removeAdsBlockDisallowedList:  ' + this.main_url);
                  console.log(' removeAdsBlockDisallowedList isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                  console.log(' removeAdsBlockDisallowedList isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                  Utils.emitEvent(true, 1007)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitRemoveAdsBlockDisallowedList The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
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
                  webview.AdsBlockManager.clearAdsBlockDisallowedList();
                  this.controller.loadUrl(this.src_url)
                  let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                  console.log('clearAdsBlockDisallowedList:  ' + this.main_url);
                  console.log('clearAdsBlockDisallowedList: isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                  console.log('clearAdsBlockDisallowedList: isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                  Utils.emitEvent(true, 1008)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitClearAdsBlockDisallowedList The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
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


                  let arrDomainSuffixes = new Array<string>();
                  arrDomainSuffixes.push(this.main_url);
                  webview.AdsBlockManager.addAdsBlockAllowedList(arrDomainSuffixes);
                  this.controller.loadUrl(this.src_url)
                  let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                  console.log(' addAdsBlockAllowedList:  ' + this.main_url);
                  console.log(' addAdsBlockAllowedList: isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                  console.log(' addAdsBlockAllowedList: isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                  Utils.emitEvent(true, 1009)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitAddAdsBlockAllowedList The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
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


                  let arrDomainSuffixes = new Array<string>();
                  arrDomainSuffixes.push(this.main_url);
                  webview.AdsBlockManager.removeAdsBlockAllowedList(arrDomainSuffixes);
                  this.controller.loadUrl(this.src_url)
                  let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                  console.log(' removeAdsBlockAllowedList:  ' + this.main_url);
                  console.log(' removeAdsBlockAllowedList isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                  console.log(' removeAdsBlockAllowedList isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                  Utils.emitEvent(true, 1010)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitRemoveAdsBlockAllowedList The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
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

                  webview.AdsBlockManager.clearAdsBlockAllowedList();
                  this.controller.loadUrl(this.src_url)
                  let isBlockedCurPageAfter: boolean = this.controller.isAdsBlockEnabledForCurPage();
                  console.log(' clearAdsBlockAllowedList:  ' + this.main_url);
                  console.log(' clearAdsBlockAllowedList isBlockedCurPageBefore :  ' + isBlockedCurPageBefore);
                  console.log(' clearAdsBlockAllowedList isBlockedCurPageAfter :  ' + isBlockedCurPageAfter);

                  this.controller.loadUrl('https://www.hao123.com/');

                  Utils.emitEvent(true, 1011)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitRemoveAdsBlockAllowedList The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
                    this.errorCode = 801
                    Utils.emitEvent(true, 1011)
                  } else {
                    Utils.emitEvent(false, 1011)
                  }
                }
                break;
              }



              case 'emitEnableAdsBlockFalse': {
                try {
                  this.controller.enableAdsBlock(false);
                  console.log(' enableAdsBlock:  true');

                  this.controller.refresh();

                  Utils.emitEvent(true, 1013)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitEnableAdsBlockFalse The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
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

                  Utils.emitEvent(!isBlocked, 1014)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  if(error.code == 801) {
                    console.log(`emitIsAdsBlockEnabledCheck The current device type does not support Cause code:${error.code},  Message: ${error.message}`)
                    this.errorCode = 801
                    Utils.emitEvent(true, 1014)
                  } else {
                    Utils.emitEvent(false, 1014)
                  }
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
          return ;
        })
    }
  }
}
