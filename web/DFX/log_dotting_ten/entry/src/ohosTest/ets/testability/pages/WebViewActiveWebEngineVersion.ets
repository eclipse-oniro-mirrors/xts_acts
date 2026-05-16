/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { webview } from '@kit.ArkWeb'
import { hilog } from '@kit.PerformanceAnalysisKit';
import test_ndk from 'libentry.so'
import business_error from '@ohos.base'
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { Driver, ON, On  } from '@ohos.UiTest';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  aboutToAppear() {
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info('start run testcase in index!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    RelativeContainer() {
      Column( { space: 20 } ) {
        Button('web click')
          .key('WebViewActiveWebEngineVersionButton')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isReceive, 'GeolocationPermissionsErrorCodeButtonIsReceive', 1, 1000);
            console.info("key==>" + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitActiveWebEngineVersion001': {
                try {
                  if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    test_ndk.test_ndk_setActiveWebEngineVersion(webview.ArkWebEngineVersion.SYSTEM_DEFAULT);
                    let tmp_result = test_ndk.test_ndk_getActiveWebEngineVersion();
                    Utils.emitEvent(tmp_result, 20250903);
                  } else {
                    Utils.emitEvent(webview.ArkWebEngineVersion.M132, 20250903);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitActiveWebEngineVersion002': {
                try {
                  if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    test_ndk.test_ndk_setActiveWebEngineVersion(webview.ArkWebEngineVersion.M114);
                    let tmp_result = test_ndk.test_ndk_getActiveWebEngineVersion();
                    if(tmp_result) {
                      Utils.emitEvent(true, 20250904);
                    }

                  } else {
                    Utils.emitEvent(true, 20250904);
                  }

                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitActiveWebEngineVersion003': {
                try {
                  if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    test_ndk.test_ndk_setActiveWebEngineVersion(webview.ArkWebEngineVersion.M132);
                    let tmp_result = test_ndk.test_ndk_getActiveWebEngineVersion();
                    Utils.emitEvent(tmp_result, 20250905);
                  } else {
                    Utils.emitEvent(webview.ArkWebEngineVersion.M132, 20250905);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitActiveWebEngineVersion004': {
                try {
                  if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    test_ndk.test_ndk_setActiveWebEngineVersion(webview.ArkWebEngineVersion.ARKWEB_EVERGREEN);
                    let tmp_result = test_ndk.test_ndk_getActiveWebEngineVersion();
                    Utils.emitEvent(tmp_result, 20250940);
                  } else {
                    Utils.emitEvent(webview.ArkWebEngineVersion.M132, 20250940);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitActiveWebEngineVersion005': {
                try {
                  if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    test_ndk.test_ndk_setActiveWebEngineVersionEvergreen();
                    let tmp_result = test_ndk.test_ndk_getActiveWebEngineVersion();
                    console.log('emitActiveWebEngineVersion005' + tmp_result);
                    Utils.emitEvent(tmp_result, 20251218);
                  } else {
                    Utils.emitEvent(webview.ArkWebEngineVersion.M132, 20251218);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitActiveWebEngineVersion006': {
                try {
                  if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    test_ndk.test_ndk_setActiveWebEngineVersionEvergreen132();
                    let tmp_result = test_ndk.test_ndk_getActiveWebEngineVersion();
                    console.log('emitActiveWebEngineVersion006' + tmp_result);
                    Utils.emitEvent(tmp_result, 20251219);
                  } else {
                    Utils.emitEvent(webview.ArkWebEngineVersion.M132, 20251219);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitActiveWebEngineVersion007': {
                try {
                  if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    test_ndk.test_ndk_setActiveWebEngineVersionEvergreen114();
                    let tmp_result = test_ndk.test_ndk_getActiveWebEngineVersion();
                    console.log('emitActiveWebEngineVersion007' + tmp_result);
                    if(tmp_result) {
                      Utils.emitEvent(true, 20251220);
                    }
                  } else {
                    Utils.emitEvent(true, 20251220);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitActiveWebEngineVersion008': {
                try {
                  if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    test_ndk.IsActiveWebEngineEvergreen_c();
                    let tmp_result = test_ndk.test_ndk_getActiveWebEngineVersion();
                    console.log('emitActiveWebEngineVersion008' + tmp_result);
                    if(tmp_result == 1 || tmp_result == 2) {
                      Utils.emitEvent(true, 20251221);
                    } else {
                      Utils.emitEvent(false, 20251221);
                    }
                  } else {
                    Utils.emitEvent(true, 20251221);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case "emitIsActiveWebEngineEvergreen009": {
                await Utils.sleep(2000);
                if(webview.WebviewController.isActiveWebEngineEvergreen() == true || webview.WebviewController.isActiveWebEngineEvergreen() == false )
                Utils.emitEvent(true, 20251226)
                break;
              }


            }
          })
      }
      .height('100%')
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .height('100%')
    .width('100%')
  }
}
