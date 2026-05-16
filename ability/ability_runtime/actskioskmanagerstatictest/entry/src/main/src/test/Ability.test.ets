/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import kioskManager from '@ohos.app.ability.kioskManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';
const TEST_SUITE_NAME: string = 'KioskModeStaticTest';
const BUNDLE_NAME: string = 'com.example.actskioskmanagertest.static';
const WAIT_TIME2000: int = 2000;
const ERROR_CODE801: int = 801;
const ERROR_CODE16000110: int = 16000110;
const ERROR_CODE16000113: int = 16000113;
const ERROR_CODE16000061: int = 16000061;

async function msSleep(count: int) {
  await Utils.msSleep(count);
}

export default function KioskModeStaticTest() {
  describe('KioskModeStaticTest', () => {
    let context: common.UIAbilityContext | undefined;
  
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll start`);
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await msSleep(WAIT_TIME2000);
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
      await msSleep(WAIT_TIME2000);
      context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll end`);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_static_0300
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_static_0300
     * @tc.desc   Test enterKioskMode(UIAbilityContext) when application is not in kiosk app list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_KIOSK_static_0300';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        kioskManager.enterKioskMode(context as common.UIAbilityContext)
          .then(() => {
            hilog.info(DOMAIN, TAG, '%{public}s', `enterKioskMode(UIAbilityContext) success`);
          })
          .catch((err: Error) => {
            let error: BusinessError = err as BusinessError;
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} enterKioskMode code:${error.code}`);
            let result: boolean = (error.code === ERROR_CODE801) || (error.code === ERROR_CODE16000110);
            expect(result).assertTrue();
            done();
          });
      } catch (error) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} enterKioskMode
          code:${(error as BusinessError).code}`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    })
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_static_0400
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_static_0400
     * @tc.desc   Test enterKioskMode(UIAbilityContext) when current ability is not in foreground.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_KIOSK_static_0400';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      context?.moveAbilityToBackground()
        .then(() => {
          hilog.info(DOMAIN, TAG, '%{public}s', `moveAbilityToBackground success`);
        })
        .catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} moveAbilityToBackground code:${error.code}`);
          if (error.code === ERROR_CODE16000061) {
            done();
          }
        });

      await msSleep(WAIT_TIME2000);
      try {
        kioskManager.enterKioskMode(context as common.UIAbilityContext)
          .then(() => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} enterKioskMode success`);
            expect().assertFail();
            done();
          })
          .catch((err: Error) => {
            let error: BusinessError = err as BusinessError;
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} enterKioskMode code:${error.code}`);
            let result: boolean = (error.code === ERROR_CODE801) || (error.code === ERROR_CODE16000113);
            expect(result).assertTrue();
            done();
          });
      } catch (error) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} enterKioskMode
          code:${(error as BusinessError).code}`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_static_1000
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_static_1000
     * @tc.desc   Test exitKioskMode(UIAbilityContext) when application is not in kiosk app list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_KIOSK_static_1000';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
      try {
        kioskManager.exitKioskMode(context as common.UIAbilityContext)
          .then(() => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} exitKioskMode success`);
            expect().assertFail();
            done();
          })
          .catch((err: Error) => {
            let error: BusinessError = err as BusinessError;
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} exitKioskMode code:${error.code}`);
            let result: boolean = (error.code === ERROR_CODE801) || (error.code === ERROR_CODE16000110);
            expect(result).assertTrue();
            done();
          });
      } catch (error) {
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} exitKioskMode
          code:${(error as BusinessError).code}`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    })
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_static_1100
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_static_1100
     * @tc.desc   Test kioskManager.KioskStatus.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_KIOSK_static_1100';
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);

      const UID = 123;
      let kioskStatus: kioskManager.KioskStatus = {
        isKioskMode: true,
        kioskBundleName: BUNDLE_NAME,
        kioskBundleUid: UID
      }

      expect(kioskStatus.isKioskMode).assertTrue();
      expect(kioskStatus.kioskBundleName).assertEqual(BUNDLE_NAME);
      expect(kioskStatus.kioskBundleUid).assertEqual(UID);
      done();
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
    })
  })
}