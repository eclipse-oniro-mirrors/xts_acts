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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityConstant from '@ohos.app.ability.AbilityConstant';
import wantConstant from "@ohos.app.ability.wantConstant";
import wantAgent from '@ohos.app.ability.wantAgent';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function EnumerationStaticTest() {
  describe('EnumerationStaticTest', () => {

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_0100
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_0100
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LaunchReason.START_ABILITY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('1').assertEqual(abilityConstant.LaunchReason.START_ABILITY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_0200
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_0200
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LaunchReason.INSIGHT_INTENT.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('9').assertEqual(abilityConstant.LaunchReason.INSIGHT_INTENT + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_0400
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_0400
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LastExitReason.NORMAL.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('2').assertEqual(abilityConstant.LastExitReason.NORMAL + '');
      done();
    })
    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_0500
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_0500
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LastExitReason.CPP_CRASH.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('3').assertEqual(abilityConstant.LastExitReason.CPP_CRASH + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_0600
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_0600
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LastExitReason.JS_ERROR.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('4').assertEqual(abilityConstant.LastExitReason.JS_ERROR + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_0700
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_0700
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LastExitReason.APP_FREEZE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('5').assertEqual(abilityConstant.LastExitReason.APP_FREEZE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_0800
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_0800
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LastExitReason.PERFORMANCE_CONTROL.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('6').assertEqual(abilityConstant.LastExitReason.PERFORMANCE_CONTROL + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_0900
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_0900
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LastExitReason.RESOURCE_CONTROL.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('7').assertEqual(abilityConstant.LastExitReason.RESOURCE_CONTROL + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_1000
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_1000
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LastExitReason.UPGRADE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('8').assertEqual(abilityConstant.LastExitReason.UPGRADE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_1100
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_1100
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant MemoryLevel.MEMORY_LEVEL_MODERATE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_MODERATE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_1200
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_1200
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant MemoryLevel.MEMORY_LEVEL_LOW.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('1').assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_LOW + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_1300
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_1300
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant MemoryLevel.MEMORY_LEVEL_CRITICAL.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('2').assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_CRITICAL + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_1400
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_1400
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LaunchReason.SHARE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('5').assertEqual(abilityConstant.LaunchReason.SHARE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_1500
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_1500
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant ContinueState.ACTIVE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(abilityConstant.ContinueState.ACTIVE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_1600
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_1600
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant ContinueState.INACTIVE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('1').assertEqual(abilityConstant.ContinueState.INACTIVE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_1700
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_1700
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LaunchReason.AUTO_STARTUP.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('8').assertEqual(abilityConstant.LaunchReason.AUTO_STARTUP + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_1800
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_1800
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LastExitReason.USER_REQUEST.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('9').assertEqual(abilityConstant.LastExitReason.USER_REQUEST + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_1900
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_1900
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LastExitReason.SIGNAL.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('10').assertEqual(abilityConstant.LastExitReason.SIGNAL + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_2000
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_2000
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant WindowMode.WINDOW_MODE_FULLSCREEN.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('1').assertEqual(abilityConstant.WindowMode.WINDOW_MODE_FULLSCREEN + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_2100
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_2100
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant WindowMode.WINDOW_MODE_SPLIT_PRIMARY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('100').assertEqual(abilityConstant.WindowMode.WINDOW_MODE_SPLIT_PRIMARY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_2200
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_2200
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant WindowMode.WINDOW_MODE_SPLIT_SECONDARY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('101').assertEqual(abilityConstant.WindowMode.WINDOW_MODE_SPLIT_SECONDARY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_2300
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_2300
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant StateType.CONTINUATION.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(abilityConstant.StateType.CONTINUATION + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_2400
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_2400
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant StateType.APP_RECOVERY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('1').assertEqual(abilityConstant.StateType.APP_RECOVERY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_2500
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_2500
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LaunchReason.UNKNOWN.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(abilityConstant.LaunchReason.UNKNOWN + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_2600
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_2600
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LaunchReason.CALL.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('2').assertEqual(abilityConstant.LaunchReason.CALL + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_2700
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_2700
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LaunchReason.CONTINUATION.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('3').assertEqual(abilityConstant.LaunchReason.CONTINUATION + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_2800
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_2800
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LaunchReason.APP_RECOVERY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('4').assertEqual(abilityConstant.LaunchReason.APP_RECOVERY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_2900
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_2900
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LaunchReason.PREPARE_CONTINUATION.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('10').assertEqual(abilityConstant.LaunchReason.PREPARE_CONTINUATION + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_3000
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_3000
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LastExitReason.UNKNOWN.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(abilityConstant.LastExitReason.UNKNOWN + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_3100
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_3100
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant OnContinueResult.AGREE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(abilityConstant.OnContinueResult.AGREE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_3200
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_3200
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant OnContinueResult.REJECT.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('1').assertEqual(abilityConstant.OnContinueResult.REJECT + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_3300
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_3300
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant OnContinueResult.MISMATCH.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('2').assertEqual(abilityConstant.OnContinueResult.MISMATCH + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_3400
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_3400
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant OnSaveResult.ALL_AGREE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(abilityConstant.OnSaveResult.ALL_AGREE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_3500
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_3500
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant OnSaveResult.CONTINUATION_REJECT.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('1').assertEqual(abilityConstant.OnSaveResult.CONTINUATION_REJECT + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_3600
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_3600
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant OnSaveResult.CONTINUATION_MISMATCH.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('2').assertEqual(abilityConstant.OnSaveResult.CONTINUATION_MISMATCH + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_3700
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_3700
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant OnSaveResult.RECOVERY_AGREE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('3').assertEqual(abilityConstant.OnSaveResult.RECOVERY_AGREE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_3800
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_3800
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant OnSaveResult.RECOVERY_REJECT.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('4').assertEqual(abilityConstant.OnSaveResult.RECOVERY_REJECT + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_3900
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_3900
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant OnSaveResult.ALL_REJECT.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('5').assertEqual(abilityConstant.OnSaveResult.ALL_REJECT + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_4000
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_4000
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant PrepareTermination.TERMINATE_IMMEDIATELY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(abilityConstant.PrepareTermination.TERMINATE_IMMEDIATELY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_4100
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_4100
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant PrepareTermination.CANCEL.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('1').assertEqual(abilityConstant.PrepareTermination.CANCEL + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_0100
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_0100
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.CONTENT_TITLE_KEY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.extra.param.key.contentTitle').assertEqual(wantConstant.Params.CONTENT_TITLE_KEY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_0200
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_0200
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.SHARE_ABSTRACT_KEY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.extra.param.key.shareAbstract').assertEqual(wantConstant.Params.SHARE_ABSTRACT_KEY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_0300
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_0300
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.SHARE_URL_KEY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.extra.param.key.shareUrl').assertEqual(wantConstant.Params.SHARE_URL_KEY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_0400
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_0400
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.ABILITY_RECOVERY_RESTART.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.ability.params.abilityRecoveryRestart').assertEqual(wantConstant.Params.ABILITY_RECOVERY_RESTART + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_0500
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_0500
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.SHOW_MODE_KEY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.extra.param.key.showMode').assertEqual(wantConstant.Params.SHOW_MODE_KEY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_0600
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_0600
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.SUPPORT_CONTINUE_PAGE_STACK_KEY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const result = 'ohos.extra.param.key.supportContinuePageStack';
      expect(result).assertEqual(wantConstant.Params.SUPPORT_CONTINUE_PAGE_STACK_KEY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_0700
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_0700
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const result = 'ohos.extra.param.key.supportContinueSourceExit';
      expect(result).assertEqual(wantConstant.Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_0800
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_0800
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.PARAMS_STREAM.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ability.params.stream').assertEqual(wantConstant.Params.PARAMS_STREAM + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_0900
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_0900
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.LAUNCH_REASON_MESSAGE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.params.launchReasonMessage').assertEqual(wantConstant.Params.LAUNCH_REASON_MESSAGE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_1000
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_1000
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Flags.FLAG_AUTH_WRITE_URI_PERMISSION.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect(String(0x00000002)).assertEqual(wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_1100
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_1100
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect(String(0x00000040)).assertEqual(wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_1200
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_1200
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Flags.FLAG_INSTALL_ON_DEMAND.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_wantConstant_Static_0100 START');
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_wantConstant_Static_0100 FLAG_INSTALL_ON_DEMAND: ' + wantConstant.Flags.FLAG_INSTALL_ON_DEMAND);
      expect(String(0x00000800)).assertEqual(wantConstant.Flags.FLAG_INSTALL_ON_DEMAND + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_1300
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_1300
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.ABILITY_BACK_TO_OTHER_MISSION_STACK.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ability.params.backToOtherMissionStack').assertEqual(wantConstant.Params.ABILITY_BACK_TO_OTHER_MISSION_STACK + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_1400
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_1400
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.APP_CLONE_INDEX_KEY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.extra.param.key.appCloneIndex').assertEqual(wantConstant.Params.APP_CLONE_INDEX_KEY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_1500
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_1500
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.CALLER_REQUEST_CODE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.extra.param.key.callerRequestCode').assertEqual(wantConstant.Params.CALLER_REQUEST_CODE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_1600
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_1600
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.PAGE_PATH.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.param.atomicservice.pagePath').assertEqual(wantConstant.Params.PAGE_PATH + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_1700
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_1700
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.ROUTER_NAME.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.param.atomicservice.routerName').assertEqual(wantConstant.Params.ROUTER_NAME + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_1800
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_1800
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.PAGE_SOURCE_FILE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.param.atomicservice.pageSourceFile').assertEqual(wantConstant.Params.PAGE_SOURCE_FILE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_1900
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_1900
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.BUILD_FUNCTION.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.param.atomicservice.buildFunction').assertEqual(wantConstant.Params.BUILD_FUNCTION + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_2000
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_2000
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Params.SUB_PACKAGE_NAME.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('ohos.param.atomicservice.subpackageName').assertEqual(wantConstant.Params.SUB_PACKAGE_NAME + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_2100
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_2100
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Flags.FLAG_AUTH_READ_URI_PERMISSION.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect(String(0x00000001)).assertEqual(wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_2200
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_2200
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant Flags.FLAG_START_WITHOUT_TIPS.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect(String(0x40000000)).assertEqual(wantConstant.Flags.FLAG_START_WITHOUT_TIPS + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_2300
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_2300
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant ShowMode.WINDOW.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(wantConstant.ShowMode.WINDOW + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_Static_2400
     * @tc.name    SUB_Ability_AbilityBase_wantConstant_Static_2400
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantConstant ShowMode.EMBEDDED_FULL.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('1').assertEqual(wantConstant.ShowMode.EMBEDDED_FULL + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_0100
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_0100
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent OperationType.UNKNOWN_TYPE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(wantAgent.OperationType.UNKNOWN_TYPE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_0200
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_0200
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent OperationType.SEND_COMMON_EVENT.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('4').assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_0300
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_0300
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent OperationType.START_ABILITY.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('1').assertEqual(wantAgent.OperationType.START_ABILITY + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_0400
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_0400
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent OperationType.START_ABILITIES.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('2').assertEqual(wantAgent.OperationType.START_ABILITIES + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_0500
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_0500
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent OperationType.START_SERVICE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('3').assertEqual(wantAgent.OperationType.START_SERVICE + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_0600
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_0600
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent WantAgentFlags.ONE_TIME_FLAG.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(wantAgent.WantAgentFlags.ONE_TIME_FLAG + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_0700
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_0700
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent WantAgentFlags.NO_BUILD_FLAG.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('1').assertEqual(wantAgent.WantAgentFlags.NO_BUILD_FLAG + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_0800
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_0800
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent WantAgentFlags.CANCEL_PRESENT_FLAG.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('2').assertEqual(wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_0900
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_0900
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent WantAgentFlags.UPDATE_PRESENT_FLAG.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('3').assertEqual(wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_1000
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_1000
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent WantAgentFlags.CONSTANT_FLAG.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('4').assertEqual(wantAgent.WantAgentFlags.CONSTANT_FLAG + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_1100
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_1100
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent WantAgentFlags.REPLACE_ELEMENT.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('5').assertEqual(wantAgent.WantAgentFlags.REPLACE_ELEMENT + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_1200
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_1200
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent WantAgentFlags.REPLACE_ACTION.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('6').assertEqual(wantAgent.WantAgentFlags.REPLACE_ACTION + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_1300
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_1300
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent WantAgentFlags.REPLACE_URI.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('7').assertEqual(wantAgent.WantAgentFlags.REPLACE_URI + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_1400
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_1400
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent WantAgentFlags.REPLACE_ENTITIES.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('8').assertEqual(wantAgent.WantAgentFlags.REPLACE_ENTITIES + '');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_Static_1500
     * @tc.name    SUB_Ability_AbilityBase_WantAgent_Static_1500
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test wantAgent WantAgentFlags.REPLACE_BUNDLE.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_WantAgent_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('9').assertEqual(wantAgent.WantAgentFlags.REPLACE_BUNDLE + '');
      done();
    })
  })
}
