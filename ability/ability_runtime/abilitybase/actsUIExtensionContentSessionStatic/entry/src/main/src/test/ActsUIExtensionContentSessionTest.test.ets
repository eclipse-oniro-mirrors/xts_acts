/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Component, Driver, ON } from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import bundle from '@ohos.bundle.bundleManager';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';
const TEST_SUITE_NAME: string = 'ActsUIExtensionContentSessionTest';
const BUNDLE_NAME: string = 'com.example.uiextensioncontentsession.static';
const MODULE_NAME: string = 'entry';
const ABILITY_NAME: string = 'TestEntryAbility';
const EXT_ABILITY_NAME: string = 'EntryEmbeddedUIExtAbility';
const WAIT_TIME2000: int = 2000;
const WAIT_TIME500: int = 500;
const PARAM_0: int = 0;
const PARAM_1: int = 1;
const PARAM_NEGATIVE_1: int = -1;
const PARAM_FAIL: string = 'fail';
const PARAM_TRUE: string = 'true';
const PARAM_FALSE: string = 'false';
const EVENT_TERMINATE: string = 'terminate';
const SUCCESS: int = 0;
const ERROR_CODE_401: int = 401;
const ERROR_CODE_1600050: int = 16000050;
const TEST_RESULT_KEY: string = 'result';

async function msSleep(count: int) {
  await Utils.msSleep(count);
}

let sub: commonEventManager.CommonEventSubscriber;
let testAbilityContext: common.UIAbilityContext|null = null;
let mpEnable: string = PARAM_FAIL;

export default function ActsUIExtensionContentSessionTest() {
  describe('ActsUIExtensionContentSessionTest', () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll start`);
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await msSleep(WAIT_TIME2000);
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
      await msSleep(WAIT_TIME2000);
      
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = PARAM_FAIL;
      }

      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll end`);
    })
    
    afterEach(async () => {
      await Utils.msSleep(WAIT_TIME500);
    })

    /**
      * @tc.number  Sub_UIExtensionContentSession_errorCode_static_0700
      * @tc.name    Sub_UIExtensionContentSession_errorCode_static_0700
      * @tc.desc    Test startAbilityByType callback with 16000050 error code
      */
    it('Sub_UIExtensionContentSession_errorCode_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'Sub_UIExtensionContentSession_errorCode_static_0700';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err: BusinessError|null,
            eventData: commonEventManager.CommonEventData|undefined ) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB result:` + result);
            expect(result).assertEqual(ERROR_CODE_1600050);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.number  Sub_UIExtensionContentSession_errorCode_static_0800
     * @tc.name    Sub_UIExtensionContentSession_errorCode_static_0800
     * @tc.desc    Test startAbilityByType promise with 16000050 error code
     */
    it('Sub_UIExtensionContentSession_errorCode_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'Sub_UIExtensionContentSession_errorCode_static_0800';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err: BusinessError|null,
            eventData: commonEventManager.CommonEventData|undefined ) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB result:` + result);
            expect(result).assertEqual(ERROR_CODE_1600050);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.number  SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_static_0600
     * @tc.name    SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_static_0600
     * @tc.desc    Test load content by empty name and valid storage.
     */
    it('SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_static_0600';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err: BusinessError|null,
            eventData: commonEventManager.CommonEventData|undefined ) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB result:` + result);
            expect(result).assertEqual(SUCCESS);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.number  SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_static_0800
     * @tc.name    SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_static_0800
     * @tc.desc    Test load content by valid name only.
     */
    it('SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_UIExtension_LoadContentByName_static_0800';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err: BusinessError|null,
            eventData: commonEventManager.CommonEventData|undefined ) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB result:` + result);
            expect(result).assertEqual(SUCCESS);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.number  Sub_UIExtensionContentSession_errorCode_static_1300
     * @tc.name    Sub_UIExtensionContentSession_errorCode_static_1300
     * @tc.desc    getUIExtensionWindowProxy function test with rect values validation (width>0, height>0)
     */
    it('Sub_UIExtensionContentSession_errorCode_static_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'Sub_UIExtensionContentSession_errorCode_static_1300';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err: BusinessError|null,
            eventData: commonEventManager.CommonEventData|undefined ) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            let left: int = 0;
            let top: int = 0;
            let width: int = 0;
            let height: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY] === PARAM_0) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
              left = eventData?.parameters?.['left'] as int;
              top = eventData?.parameters?.['top'] as int;
              width = eventData?.parameters?.['width'] as int;
              height = eventData?.parameters?.['height'] as int;
            }
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB result:` + result);
            expect(result).assertEqual(SUCCESS);
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} Rect values - 
              left: ${left}, top: ${top}, width: ${width}, height: ${height}`);
            expect(left).assertLarger(0);
            expect(top).assertLarger(0);
            expect(width).assertLarger(0);
            expect(height).assertLarger(0);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.number  Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0100
     * @tc.name    Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0100
     * @tc.desc    Test setWindowPrivacyMode promise 
     */
    it('Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0100', TestType.FUNCTION | Size.MEDIUMTEST
      | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0100';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err, eventData) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            expect(result).assertEqual(SUCCESS);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.number  Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0200
     * @tc.name    Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0200
     * @tc.desc    Test setWindowPrivacyMode callback 
     */
    it('Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0200', TestType.FUNCTION | Size.MEDIUMTEST
      | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0200';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err, eventData) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            expect(result).assertEqual(SUCCESS);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.number  Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0300
     * @tc.name    Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0300
     * @tc.desc    Test setWindowPrivacyMode callback & false
     */
    it('Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0300', TestType.FUNCTION | Size.MEDIUMTEST
      | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0300';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err, eventData) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            expect(result).assertEqual(SUCCESS);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });
  
    /**
     * @tc.number  Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0400
     * @tc.name    Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0400
     * @tc.desc    Test setWindowPrivacyMode promise & false
     */
    it('Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0400', TestType.FUNCTION | Size.MEDIUMTEST
      | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'Sub_UIExtensionContentSession_SetWindowPrivacyMode_static_0400';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err, eventData) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = 0;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            expect(result).assertEqual(SUCCESS);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });

    /**
     * @tc.number  Acts_ActionExtensionAbility_static_2100
     * @tc.name    Acts_ActionExtensionAbility_static_2100
     * @tc.desc    Test extensionAbilityInfo in context
     */
    it('Acts_ActionExtensionAbility_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'Acts_ActionExtensionAbility_static_2100';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      if (mpEnable === PARAM_TRUE) {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [TEST_CASE_NAME + '_event']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success`);
          commonEventManager.subscribe(sub, (err, eventData) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribeCB` + JSON.stringify(eventData));
            let result: int = PARAM_NEGATIVE_1;
            if (eventData?.parameters?.[TEST_RESULT_KEY]) {
              result = eventData?.parameters?.[TEST_RESULT_KEY] as int;
            }
            expect(result).assertEqual(PARAM_1);
            commonEventManager.publish(EVENT_TERMINATE,() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });
          testAbilityContext?.startAbility({
            bundleName: BUNDLE_NAME,
            abilityName: ABILITY_NAME,
            parameters:{
              'caseTag': TEST_CASE_NAME
            } as Record<string, RecordData>
          }, (err: BusinessError | null, data)=>{
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbility ${err?.code}`);
          })
        });
      } else if (mpEnable === PARAM_FALSE) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} function not enable.`);
        expect(mpEnable).assertEqual(PARAM_FALSE);
        done();
      } else {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wrong param.`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    });
  })
}