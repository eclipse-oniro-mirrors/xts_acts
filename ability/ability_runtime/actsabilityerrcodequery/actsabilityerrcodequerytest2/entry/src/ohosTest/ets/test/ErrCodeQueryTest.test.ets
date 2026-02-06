/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common, UIAbility, Want, dialogRequest, StartOptions, InsightIntentContext,
  OpenLinkOptions, bundleManager } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';

let TAG = 'RunTimeTest';
let uiAbilityContext = getContext(this) as common.UIAbilityContext;
let uiExtentionContext = getContext(this) as common.UIExtensionContext;
let insightIntentContext: InsightIntentContext;
let testAbilityContext: common.UIAbilityContext;
let sub : commonEventManager.CommonEventSubscriber;
let mpEnable: string;
let targetVersion: number = 12;

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function errCodeQueryTest() {
  describe('errCodeQueryTest', () => {
    beforeAll(() => {
      uiAbilityContext = globalThis.context;
      uiExtentionContext = globalThis.context;
      insightIntentContext = globalThis.context;
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = 'fail';
      }
      bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT)
        .then(data => {
          console.log(`getBundleInfoForSelf data: ${JSON.stringify(data)}`);
          targetVersion = data.targetVersion;
          console.log(`getBundleInfoForSelf targetVersion: ${JSON.stringify(targetVersion)}`);
        })
        .catch((err: BusinessError) => {
          console.error(`getBundleInfoForSelf error: ${JSON.stringify(err)}`);
        })
    })

    beforeEach(() => {

    })

    afterEach(async () => {
      console.log(`[${TAG}] sleep start`);
      await sleep(1500);
      console.log(`[${TAG}] sleep over`);
    })

    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_setColorMode_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_setColorMode_0100
     * @tc.desc   Pass the parameter wrongly as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_setColorMode_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_setColorMode_0100';
      try {
        let applicationContext = uiAbilityContext.getApplicationContext();
        applicationContext.setColorMode(undefined);
        expect().assertFail();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_RequestCallback_setRequestResult_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_RequestCallback_setRequestResult_0100
     * @tc.desc   Pass the parameter wrongly as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_RequestCallback_setRequestResult_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_RequestCallback_setRequestResult_0100';
      try {
        let want: Want = {
          deviceId: '',
          bundleName: 'com.test.actsabilityerrcodequerysecondtest',
          abilityName: 'TestAbility',
          moduleName: 'entry_test'
        };
        let requestCallback = dialogRequest.getRequestCallback(want);
        console.log(`[${TAG}] 00000`);
        console.log(`[${TAG}] requestCallback: ${JSON.stringify(requestCallback)}`);
        requestCallback.setRequestResult(undefined);
        expect().assertFail();
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestInfo_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestInfo_0100
     * @tc.desc   Pass the parameter wrongly as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestInfo_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestInfo_0100';
      try {
        let requestInfo = dialogRequest.getRequestInfo(undefined);
        console.log(`[${TAG}] requestInfo: ${JSON.stringify(requestInfo)}`);
        expect().assertFail();
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestCallback_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestCallback_0100
     * @tc.desc   Pass the parameter wrongly as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestCallback_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_dialogRequest_getRequestCallback_0100';
      try {
        let requestCallback = dialogRequest.getRequestCallback(undefined);
        console.log(`[${TAG}] requestCallback: ${JSON.stringify(requestCallback)}`);
        expect().assertFail();
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0100
     * @tc.desc   startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000004, configure exported as false in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0100';
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        let want: Want = {
          bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
          abilityName: 'AbilityE',
        };
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        console.log(`[${TAG}] abilityDelegator: ${abilityDelegator}`);
        abilityDelegator.startAbility(want, (err: BusinessError, data: void) => {
          console.info(`[${TAG}] startAbility callback`);
          if (err) {
            console.log(`[${TAG}] err: ${JSON.stringify(err)}`);
            if (targetVersion >= 20) {
              expect(err.code).assertEqual(16000004);
            } else {
              expect(err.code).assertEqual(2097179);
            }
            done();
          } else {
            console.log(`[${TAG}] startAbility data: ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000004);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0200
     * @tc.desc   startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000005, Configure permission in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0200';
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        let want: Want = {
          bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
          abilityName: 'AbilityB',
        };
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        console.log(`[${TAG}] abilityDelegator: ${abilityDelegator}`);
        abilityDelegator.startAbility(want, (err: BusinessError, data: void) => {
          console.info(`[${TAG}] startAbility callback`);
          if (err) {
            console.log(`[${TAG}] err: ${JSON.stringify(err)}`);
            if (targetVersion >= 20) {
              expect(err.code).assertEqual(16000005);
            } else {
              expect(err.code).assertEqual(2097208);
            }
            done();
          } else {
            console.log(`[${TAG}] startAbility data: ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000005);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0300
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0300
     * @tc.desc   startAbility(want: Want): Promise<void>; Errcode 16000004, configure exported as false in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0300';
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        let want: Want = {
          bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
          abilityName: 'AbilityE',
        };
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        console.log(`[${TAG}] abilityDelegator: ${abilityDelegator}`);
        let errObject = {} as BusinessError;
        await abilityDelegator.startAbility(want)
          .then((data: void) => {
            console.log(`[${TAG}] startAbility promise`);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] err: ${JSON.stringify(err)}`);
            errObject = err;
          })
        if (targetVersion >= 20) {
          expect(errObject.code).assertEqual(16000004);
        } else {
          expect(errObject.code).assertEqual(2097179);  ///sdk18: 2097179
        }
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000004);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0400
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0400
     * @tc.desc   startAbility(want: Want): Promise<void>; Errcode 16000005, configure permission in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0400', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_AbilityDelegator_startAbility_0400';
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        let want: Want = {
          bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
          abilityName: 'AbilityB',
        };
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        console.log(`[${TAG}] abilityDelegator: ${abilityDelegator}`);
        let errObject = {} as BusinessError;
        await abilityDelegator.startAbility(want)
          .then((data: void) => {
            console.log(`[${TAG}] startAbility promise`);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] err: ${JSON.stringify(err)}`);
            errObject = err;
          })
        if (targetVersion >= 20) {
          expect(errObject.code).assertEqual(16000005);
        } else {
          expect(errObject.code).assertEqual(2097208);  ///sdk18: 2097208
        }
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000005);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200
     * @tc.desc   startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000005, Configure permission in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200';
      if (mpEnable === 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo) // 创建订阅SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0200_event事件的Subscriber
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            sub = commonEventSubscriber;
            console.info(`[${TAG}] createSubscriber succeed`);
            commonEventManager.subscribe(sub, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => { // 接收公共事件数据的回调函数
              console.info(`[${TAG}] subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(16000005);
              } catch {
              }
              commonEventManager.publish("terminateEntryAbility1",() => {});
              commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
                console.info(`[${TAG}] unsubscribe succeed`);
                done();
              });
            })
            // 启动测试用的入口ability
            let entryWant: Want = {
              bundleName: "com.test.actsabilityerrcodequerysecondtest",
              abilityName: "EntryAbility1",
              parameters: {
                "case": TAG
              }
            }
            testAbilityContext.startAbility(entryWant, (err: BusinessError) => {
              if (err.code) {
                console.error(`[${TAG}] startEntryAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
              } else {
                console.info(`[${TAG}] startEntryAbility succeed`);
              }
            })
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch {
            }
            done();
          })
      } else if (mpEnable === 'false') {
        console.info(`${TAG} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      } else {
        console.info(`${TAG} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300
     * @tc.desc   startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000010, set flags to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300';
      if (mpEnable === 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0300_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            sub = commonEventSubscriber;
            console.info(`[${TAG}] createSubscriber succeed`);
            commonEventManager.subscribe(sub, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
              console.info(`[${TAG}] subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(16000010);
              } catch {
              }
              commonEventManager.publish("terminateEntryAbility1",() => {});
              commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
                console.info(`[${TAG}] unsubscribe succeed`);
                done();
              });
            })
            let entryWant: Want = {
              bundleName: "com.test.actsabilityerrcodequerysecondtest",
              abilityName: "EntryAbility1",
              parameters: {
                "case": TAG
              }
            }
            testAbilityContext.startAbility(entryWant, (err: BusinessError) => {
              if (err.code) {
                console.error(`[${TAG}] startEntryAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
              } else {
                console.info(`[${TAG}] startEntryAbility succeed`);
              }
            })
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch {
            }
            done();
          })
      } else if (mpEnable === 'false') {
        console.info(`${TAG} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      } else {
        console.info(`${TAG} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500
     * @tc.desc   startAbility(want: Want, options: StartOptions, callback: AsyncCallback<void>): void; Errcode 16000005, Configure permission in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500';
      if (mpEnable === 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0500_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            sub = commonEventSubscriber;
            console.info(`[${TAG}] createSubscriber succeed`);
            commonEventManager.subscribe(sub, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
              console.info(`[${TAG}] subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(16000005);
              } catch {
              }
              commonEventManager.publish("terminateEntryAbility1",() => {});
              commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
                console.info(`[${TAG}] unsubscribe succeed`);
                done();
              });
            })
            let entryWant: Want = {
              bundleName: "com.test.actsabilityerrcodequerysecondtest",
              abilityName: "EntryAbility1",
              parameters: {
                "case": TAG
              }
            }
            testAbilityContext.startAbility(entryWant, (err: BusinessError) => {
              if (err.code) {
                console.error(`[${TAG}] startEntryAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
              } else {
                console.info(`[${TAG}] startEntryAbility succeed`);
              }
            })
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch {
            }
            done();
          })
      } else if (mpEnable === 'false') {
        console.info(`${TAG} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      } else {
        console.info(`${TAG} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700
     * @tc.desc   startAbility(want: Want, options?: StartOptions): Promise<void>; Errcode 16000005, Configure permission in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700';
      if (mpEnable === 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0700_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            sub = commonEventSubscriber;
            console.info(`[${TAG}] createSubscriber succeed`);
            commonEventManager.subscribe(sub, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
              console.info(`[${TAG}] subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(16000005);
              } catch {
              }
              commonEventManager.publish("terminateEntryAbility1",() => {});
              commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
                console.info(`[${TAG}] unsubscribe succeed`);
                done();
              });
            })
            let entryWant: Want = {
              bundleName: "com.test.actsabilityerrcodequerysecondtest",
              abilityName: "EntryAbility1",
              parameters: {
                "case": TAG
              }
            }
            testAbilityContext.startAbility(entryWant, (err: BusinessError) => {
              if (err.code) {
                console.error(`[${TAG}] startEntryAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
              } else {
                console.info(`[${TAG}] startEntryAbility succeed`);
              }
            })
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch {
            }
            done();
          })
      } else if (mpEnable === 'false') {
        console.info(`${TAG} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      } else {
        console.info(`${TAG} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800
     * @tc.desc   startAbility(want: Want, options?: StartOptions): Promise<void>; Errcode 16000010, set flags to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800';
      if (mpEnable === 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbility_0800_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            sub = commonEventSubscriber;
            console.info(`[${TAG}] createSubscriber succeed`);
            commonEventManager.subscribe(sub, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
              console.info(`[${TAG}] subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(16000010);
              } catch {
              }
              commonEventManager.publish("terminateEntryAbility1",() => {});
              commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
                console.info(`[${TAG}] unsubscribe succeed`);
                done();
              });
            })
            let entryWant: Want = {
              bundleName: "com.test.actsabilityerrcodequerysecondtest",
              abilityName: "EntryAbility1",
              parameters: {
                "case": TAG
              }
            }
            testAbilityContext.startAbility(entryWant, (err: BusinessError) => {
              if (err.code) {
                console.error(`[${TAG}] startEntryAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
              } else {
                console.info(`[${TAG}] startEntryAbility succeed`);
              }
            })
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch {
            }
            done();
          })
      } else if (mpEnable === 'false') {
        console.info(`${TAG} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      } else {
        console.info(`${TAG} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200
     * @tc.desc   startAbilityForResult(want: Want, callback: AsyncCallback<AbilityResult>): void; Errcode 16000005, Configure permission in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200';
      if (mpEnable === 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0200_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            sub = commonEventSubscriber;
            console.info(`[${TAG}] createSubscriber succeed`);
            commonEventManager.subscribe(sub, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
              console.info(`[${TAG}] subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(16000005);
              } catch {
              }
              commonEventManager.publish("terminateEntryAbility1",() => {});
              commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
                console.info(`[${TAG}] unsubscribe succeed`);
                done();
              });
            })
            let entryWant: Want = {
              bundleName: "com.test.actsabilityerrcodequerysecondtest",
              abilityName: "EntryAbility1",
              parameters: {
                "case": TAG
              }
            }
            testAbilityContext.startAbility(entryWant, (err: BusinessError) => {
              if (err.code) {
                console.error(`[${TAG}] startEntryAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
              } else {
                console.info(`[${TAG}] startEntryAbility succeed`);
              }
            })
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch {
            }
            done();
          })
      } else if (mpEnable === 'false') {
        console.info(`${TAG} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      } else {
        console.info(`${TAG} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300
     * @tc.desc   startAbility(want: Want, callback: AsyncCallback<void>): void. Errcode 16000010, set flags to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300';
      if (mpEnable === 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0300_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            sub = commonEventSubscriber;
            console.info(`[${TAG}] createSubscriber succeed`);
            commonEventManager.subscribe(sub, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
              console.info(`[${TAG}] subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(16000010);
              } catch {
              }
              commonEventManager.publish("terminateEntryAbility1",() => {});
              commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
                console.info(`[${TAG}] unsubscribe succeed`);
                done();
              });
            })
            let entryWant: Want = {
              bundleName: "com.test.actsabilityerrcodequerysecondtest",
              abilityName: "EntryAbility1",
              parameters: {
                "case": TAG
              }
            }
            testAbilityContext.startAbility(entryWant, (err: BusinessError) => {
              if (err.code) {
                console.error(`[${TAG}] startEntryAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
              } else {
                console.info(`[${TAG}] startEntryAbility succeed`);
              }
            })
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch {
            }
            done();
          })
      } else if (mpEnable === 'false') {
        console.info(`${TAG} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      } else {
        console.info(`${TAG} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500
     * @tc.desc   startAbilityForResult(want: Want, options: StartOptions, callback: AsyncCallback<AbilityResult>): void; Errcode 16000005, Configure permission in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500';
      if (mpEnable === 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0500_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            sub = commonEventSubscriber;
            console.info(`[${TAG}] createSubscriber succeed`);
            commonEventManager.subscribe(sub, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
              console.info(`[${TAG}] subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(16000005);
              } catch {
              }
              commonEventManager.publish("terminateEntryAbility1",() => {});
              commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
                console.info(`[${TAG}] unsubscribe succeed`);
                done();
              });
            })
            let entryWant: Want = {
              bundleName: "com.test.actsabilityerrcodequerysecondtest",
              abilityName: "EntryAbility1",
              parameters: {
                "case": TAG
              }
            }
            testAbilityContext.startAbility(entryWant, (err: BusinessError) => {
              if (err.code) {
                console.error(`[${TAG}] startEntryAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
              } else {
                console.info(`[${TAG}] startEntryAbility succeed`);
              }
            })
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch {
            }
            done();
          })
      } else if (mpEnable === 'false') {
        console.info(`${TAG} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      } else {
        console.info(`${TAG} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700
     * @tc.desc   startAbilityForResult(want: Want, options?: StartOptions): Promise<AbilityResult>; Errcode 16000005, Configure permission in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700';
      if (mpEnable === 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0700_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            sub = commonEventSubscriber;
            console.info(`[${TAG}] createSubscriber succeed`);
            commonEventManager.subscribe(sub, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
              console.info(`[${TAG}] subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(16000005);
              } catch {
              }
              commonEventManager.publish("terminateEntryAbility1",() => {});
              commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
                console.info(`[${TAG}] unsubscribe succeed`);
                done();
              });
            })
            let entryWant: Want = {
              bundleName: "com.test.actsabilityerrcodequerysecondtest",
              abilityName: "EntryAbility1",
              parameters: {
                "case": TAG
              }
            }
            testAbilityContext.startAbility(entryWant, (err: BusinessError) => {
              if (err.code) {
                console.error(`[${TAG}] startEntryAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
              } else {
                console.info(`[${TAG}] startEntryAbility succeed`);
              }
            })
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch {
            }
            done();
          })
      } else if (mpEnable === 'false') {
        console.info(`${TAG} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      } else {
        console.info(`${TAG} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800
     * @tc.desc   startAbilityForResult(want: Want, options?: StartOptions): Promise<AbilityResult>; Errcode 16000010, set flags to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800';
      if (mpEnable === 'true') {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_ErrorCode_UIExtensionContext_startAbilityForResult_0800_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
            sub = commonEventSubscriber;
            console.info(`[${TAG}] createSubscriber succeed`);
            commonEventManager.subscribe(sub, (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
              console.info(`[${TAG}] subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(16000010);
              } catch {
              }
              commonEventManager.publish("terminateEntryAbility1",() => {});
              commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
                console.info(`[${TAG}] unsubscribe succeed`);
                done();
              });
            })
            let entryWant: Want = {
              bundleName: "com.test.actsabilityerrcodequerysecondtest",
              abilityName: "EntryAbility1",
              parameters: {
                "case": TAG
              }
            }
            testAbilityContext.startAbility(entryWant, (err: BusinessError) => {
              if (err.code) {
                console.error(`[${TAG}] startEntryAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
              } else {
                console.info(`[${TAG}] startEntryAbility succeed`);
              }
            })
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch {
            }
            done();
          })
      } else if (mpEnable === 'false') {
        console.info(`${TAG} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      } else {
        console.info(`${TAG} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0200
     * @tc.desc   startAbility(want: Want, callback: AsyncCallback<void>): void; Errcode 16000001, set the ability name wrongly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0200';
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityAbility',
      };
      try {
        insightIntentContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            expect(err.code).assertEqual(16000001);
            done();
          } else {
            console.info(`[${TAG}] startAbility succeed`);
            expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000001);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0300
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0300
     * @tc.desc   startAbility(want: Want, callback: AsyncCallback<void>): void; Errcode 16000004, configure exported as false in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0300';
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityE',
      };
      try {
        insightIntentContext.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            expect(err.code).assertEqual(16000004);
            done();
          } else {
            console.info(`[${TAG}] startAbility succeed`);
            expect().assertFail();
            done();
          }
        })
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000004);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0500
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0500
     * @tc.desc   startAbility(want: Want): Promise<void>; Errcode 16000001, set the ability name wrongly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0500', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0500';
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityAbility',
      };
      let errObject = {} as BusinessError;
      try {
        await insightIntentContext.startAbility(want)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        expect(errObject.code).assertEqual(16000001);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000001);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0600
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0600
     * @tc.desc   startAbility(want: Want): Promise<void>; Errcode 16000004, configure exported as false in the target ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0600', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_Ability_AbilityRuntime_ErrorCode_InsightIntentContext_startAbility_0600';
      let want: Want = {
        bundleName: 'com.rely.actsabilityerrcodequerytestrely2',
        abilityName: 'AbilityE',
      };
      let errObject = {} as BusinessError;
      try {
        await insightIntentContext.startAbility(want)
          .then(() => {
            console.info(`[${TAG}] startAbility succeed`);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`[${TAG}] startAbility failed, err: ${JSON.stringify(err)}, message: ${err.message}`);
            errObject = err;
          })
        expect(errObject.code).assertEqual(16000004);
        done();
      } catch (paramError) {
        console.log(`[${TAG}] paramError: ${JSON.stringify(paramError)}`);
        expect(paramError.code).assertEqual(16000004);
        done();
      }
    })

  })
}