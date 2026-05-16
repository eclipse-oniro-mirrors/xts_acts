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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach } from "../../../hypium/index";
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

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';
const TEST_SUITE_NAME: string = 'ActsUIExtensionContentSessionTest';
const BUNDLE_NAME: string = 'com.example.uiextensioncontentsessionerrorcode.static';
const ABILITY_NAME: string = 'TestEntryAbility';
const WAIT_TIME2000: int = 2000;
const WAIT_TIME500: int = 500;
const PARAM_0: int = 0;
const PARAM_FAIL: string = 'fail';
const PARAM_TRUE: string = 'true';
const PARAM_FALSE: string = 'false';
const EVENT_TERMINATE: string = 'terminate';
const ERROR_CODE_201: int = 201;
const ERROR_CODE_1600050: int = 16000050;
const TEST_RESULT_KEY: string = 'result';

async function msSleep(count: int) {
  await Utils.msSleep(count);
}

let sub: commonEventManager.CommonEventSubscriber;
let testAbilityContext: common.UIAbilityContext|null = null;
let mpEnable: string = PARAM_FAIL;

export default function ActsUIExtensionContentSessionErrorCodeTest() {
  describe('ActsUIExtensionContentSessionErrorCodeTest', () => {
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
     * @tc.number  Sub_UIExtensionContentSession_errorCode_static_0400
     * @tc.name    Sub_UIExtensionContentSession_errorCode_static_0400
     * @tc.desc    Test setWindowPrivacyMode promise with 201 error code
     */
    it('Sub_UIExtensionContentSession_errorCode_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'Sub_UIExtensionContentSession_errorCode_static_0400';
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
            expect(result).assertEqual(ERROR_CODE_201);
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
     * @tc.number  Sub_UIExtensionContentSession_errorCode_static_0500
     * @tc.name    Sub_UIExtensionContentSession_errorCode_static_0500
     * @tc.desc    Test setWindowPrivacyMode callback with 401 error code
     */
    it('Sub_UIExtensionContentSession_errorCode_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME: string = 'Sub_UIExtensionContentSession_errorCode_static_0500';
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
            expect(result).assertEqual(ERROR_CODE_201);
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