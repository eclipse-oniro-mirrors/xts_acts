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
import hilog from '@ohos.hilog';
import { beforeAll, describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import autoStartupManager from '@ohos.app.ability.autoStartupManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';

export default function GetAutoStartupStatusForSelfStaticTest() {
  describe('GetAutoStartupStatusForSelfStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: 'MainAbility', bundleName: 'com.acts.ability.actsgetautostartupstatusforself.static'
      }).then(async (): Promise<void> => {
        hilog.info(0x0000, 'testTag', 'startAbility success');
        await Utils.msSleep(2000);
      }).catch(() => {
        hilog.info(0x0000, 'testTag', 'startAbility fail');
      })
    });
    /**
     * @tc.name   Sub_Ability_AbilityRuntime_GetAutoStartupStatus_Static_0100
     * @tc.number Sub_Ability_AbilityRuntime_GetAutoStartupStatus_Static_0100
     * @tc.desc   getAutoStartupStatusForSelf return false or throw 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Ability_AbilityRuntime_GetAutoStartupStatus_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const tcNumber = `Sub_Ability_AbilityRuntime_GetAutoStartupStatus_Static_0100 `;
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
        try {
          autoStartupManager.getAutoStartupStatusForSelf()
            .then((data: boolean) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} getAutoStartupStatusForSelf success`);
              expect(data).assertFalse();
              done();
            })
            .catch((e) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} getAutoStartupStatusForSelf error: ${e.code}, ${e.message}`);
              if (e.code !== 801) {
                expect().assertFail();
              }
              done();
            })
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} getAutoStartupStatusForSelf failed: ${err.code}, ${err.message}`);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_IsAutoStartupSupported_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_IsAutoStartupSupported_Static_0100
     * @tc.desc   Test isAutoStartupSupported returns boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_IsAutoStartupSupported_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const tcNumber = `SUB_Ability_AbilityRuntime_IsAutoStartupSupported_Static_0100 `;
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
        try {
          let result: boolean = autoStartupManager.isAutoStartupSupported();
          hilog.info(0x0000, 'testTag', `${tcNumber} isAutoStartupSupported result: ${result}`);
          expect(typeof result === 'boolean').assertTrue();
          done();
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} isAutoStartupSupported failed: ${err}`);
          expect().assertFail();
          done();
        }
      })
  })
}