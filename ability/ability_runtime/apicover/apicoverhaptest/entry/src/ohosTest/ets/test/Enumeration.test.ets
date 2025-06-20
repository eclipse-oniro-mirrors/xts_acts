/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, afterEach, it, expect, beforeAll, Level } from '@ohos/hypium';
import abilityConstant from '@ohos.app.ability.AbilityConstant';
import wantConstant from "@ohos.app.ability.wantConstant";
import { Driver } from '@ohos.UiTest';
import errorCode from '@ohos.ability.errorCode';
import wantAgent from '@ohos.app.ability.wantAgent';
import { ConfigurationConstant } from '@kit.AbilityKit';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

let driver1:Driver;
export default function ApiCoverTest() {
  describe('EnumerationTest', () => {
    beforeAll(async()=>{
      try{
        driver1 = await Driver.create();
      }catch{
        console.info("EnumerationTest beforeAll create driver error" );
      }
    })
    afterEach(async (done: Function) => {
      try{
        await driver1.delayMs(100);
        done();
      }catch{
        console.info("EnumerationTest afterEach delayMs error" );
      }
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_0100
     * @tc.name    Test abilityConstant LaunchReason.START_ABILITY.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_Test_AbilityConstant_0100', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.LaunchReason.START_ABILITY);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_0200
     * @tc.name    Test abilityConstant LaunchReason.INSIGHT_INTENT.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0200', Level.LEVEL0, async (done: Function) => {
      expect(9).assertEqual(abilityConstant.LaunchReason.INSIGHT_INTENT);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_0300
     * @tc.name    Test abilityConstant LastExitReason.ABILITY_NOT_RESPONDING.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0300', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.LastExitReason.ABILITY_NOT_RESPONDING);
      done();
    })
    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_0400
     * @tc.name    Test abilityConstant LastExitReason.NORMAL.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0400', Level.LEVEL0, async (done: Function) => {
      expect(2).assertEqual(abilityConstant.LastExitReason.NORMAL);
      done();
    })
    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_0500
     * @tc.name    Test abilityConstant LastExitReason.CPP_CRASH.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0500', Level.LEVEL0, async (done: Function) => {
      expect(3).assertEqual(abilityConstant.LastExitReason.CPP_CRASH);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_0600
     * @tc.name    Test abilityConstant LastExitReason.JS_ERROR.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0600', Level.LEVEL0, async (done: Function) => {
      expect(4).assertEqual(abilityConstant.LastExitReason.JS_ERROR);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_0700
     * @tc.name    Test abilityConstant LastExitReason.APP_FREEZE.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0700', Level.LEVEL0, async (done: Function) => {
      expect(5).assertEqual(abilityConstant.LastExitReason.APP_FREEZE);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_0800
     * @tc.name    Test abilityConstant LastExitReason.PERFORMANCE_CONTROL.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0800', Level.LEVEL0, async (done: Function) => {
      expect(6).assertEqual(abilityConstant.LastExitReason.PERFORMANCE_CONTROL);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_0900
     * @tc.name    Test abilityConstant LastExitReason.RESOURCE_CONTROL.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0900', Level.LEVEL0, async (done: Function) => {
      expect(7).assertEqual(abilityConstant.LastExitReason.RESOURCE_CONTROL);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_1000
     * @tc.name    Test abilityConstant LastExitReason.UPGRADE.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1000', Level.LEVEL0, async (done: Function) => {
      expect(8).assertEqual(abilityConstant.LastExitReason.UPGRADE);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_1100
     * @tc.name    Test abilityConstant MemoryLevel.MEMORY_LEVEL_MODERATE.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1100', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_MODERATE);

      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_1200
     * @tc.name    Test abilityConstant MemoryLevel.MEMORY_LEVEL_LOW.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1200', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_LOW);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_1300
     * @tc.name    Test abilityConstant MemoryLevel.MEMORY_LEVEL_CRITICAL.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1300', Level.LEVEL0, async (done: Function) => {
      expect(2).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_CRITICAL);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_1400
     * @tc.name    Test abilityConstant LaunchReason.SHARE.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1400', Level.LEVEL0, async (done: Function) => {
      expect(5).assertEqual(abilityConstant.LaunchReason.SHARE);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_1500
     * @tc.name    Test abilityConstant ContinueState.ACTIVE.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1500', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(abilityConstant.ContinueState.ACTIVE);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_1600
     * @tc.name    Test abilityConstant ContinueState.INACTIVE.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1600', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.ContinueState.INACTIVE);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_1700
     * @tc.name    Test abilityConstant LaunchReason.AUTO_STARTUP.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1700', Level.LEVEL0, async (done: Function) => {
      expect(8).assertEqual(abilityConstant.LaunchReason.AUTO_STARTUP);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_1800
     * @tc.name    Test abilityConstant LastExitReason.USER_REQUEST.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1800', Level.LEVEL0, async (done: Function) => {
      expect(9).assertEqual(abilityConstant.LastExitReason.USER_REQUEST);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_1900
     * @tc.name    Test abilityConstant LastExitReason.SIGNAL.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1900', Level.LEVEL0, async (done: Function) => {
      expect(10).assertEqual(abilityConstant.LastExitReason.SIGNAL);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_2000
     * @tc.name    Test abilityConstant WindowMode.WINDOW_MODE_FULLSCREEN.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2000', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.WindowMode.WINDOW_MODE_FULLSCREEN);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_2100
     * @tc.name    Test abilityConstant WindowMode.WINDOW_MODE_SPLIT_PRIMARY.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2100', Level.LEVEL0, async (done: Function) => {
      expect(100).assertEqual(abilityConstant.WindowMode.WINDOW_MODE_SPLIT_PRIMARY);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_2200
     * @tc.name    Test abilityConstant WindowMode.WINDOW_MODE_SPLIT_SECONDARY.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2200', Level.LEVEL0, async (done: Function) => {
      expect(101).assertEqual(abilityConstant.WindowMode.WINDOW_MODE_SPLIT_SECONDARY);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_2300
     * @tc.name    Test abilityConstant StateType.CONTINUATION.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2300', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(abilityConstant.StateType.CONTINUATION);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_2400
     * @tc.name    Test abilityConstant StateType.APP_RECOVERY.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2400', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.StateType.APP_RECOVERY);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_2500
     * @tc.name    Test abilityConstant LaunchReason.INSIGHT_INTENT.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2500', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.StateType.APP_RECOVERY);
      done();
    })


    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_0100
     * @tc.name    Test wantConstant Params.CONTENT_TITLE_KEY.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0100', Level.LEVEL0, async (done: Function) => {
      expect('ohos.extra.param.key.contentTitle').assertEqual(wantConstant.Params.CONTENT_TITLE_KEY);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_0200
     * @tc.name    Test wantConstant Params.SHARE_ABSTRACT_KEY.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0200', Level.LEVEL0, async (done: Function) => {
      expect('ohos.extra.param.key.shareAbstract').assertEqual(wantConstant.Params.SHARE_ABSTRACT_KEY);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_0300
     * @tc.name    Test wantConstant Params.SHARE_URL_KEY.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0300', Level.LEVEL0, async (done: Function) => {
      expect('ohos.extra.param.key.shareUrl').assertEqual(wantConstant.Params.SHARE_URL_KEY);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_0400
     * @tc.name    Test wantConstant Params.ABILITY_RECOVERY_RESTART.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0400', Level.LEVEL0, async (done: Function) => {
      expect('ohos.ability.params.abilityRecoveryRestart').assertEqual(wantConstant.Params.ABILITY_RECOVERY_RESTART);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_0500
     * @tc.name    Test wantConstant Params.SHOW_MODE_KEY.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0500', Level.LEVEL0, async (done: Function) => {
      expect('ohos.extra.param.key.showMode').assertEqual(wantConstant.Params.SHOW_MODE_KEY);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_0600
     * @tc.name    Test wantConstant Params.SUPPORT_CONTINUE_PAGE_STACK_KEY.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0600', Level.LEVEL0, async (done: Function) => {
      const result = 'ohos.extra.param.key.supportContinuePageStack';
      expect(result).assertEqual(wantConstant.Params.SUPPORT_CONTINUE_PAGE_STACK_KEY);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_0700
     * @tc.name    Test wantConstant Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0700', Level.LEVEL0, async (done: Function) => {
      const result = 'ohos.extra.param.key.supportContinueSourceExit';
      expect(result).assertEqual(wantConstant.Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_0800
     * @tc.name    Test wantConstant Params.PARAMS_STREAM.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0800', Level.LEVEL0, async (done: Function) => {
      expect('ability.params.stream').assertEqual(wantConstant.Params.PARAMS_STREAM);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_0900
     * @tc.name    Test wantConstant Params.LAUNCH_REASON_MESSAGE.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0900', Level.LEVEL0, async (done: Function) => {
      expect('ohos.params.launchReasonMessage').assertEqual(wantConstant.Params.LAUNCH_REASON_MESSAGE);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_1000
     * @tc.name    Test wantConstant Flags.FLAG_AUTH_WRITE_URI_PERMISSION.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1000', Level.LEVEL0, async (done: Function) => {
      expect(0x00000002).assertEqual(wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_1100
     * @tc.name    Test wantConstant Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1100', Level.LEVEL0, async (done: Function) => {
      expect(0x00000040).assertEqual(wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_1200
     * @tc.name    Test wantConstant Flags.FLAG_INSTALL_ON_DEMAND.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1200', Level.LEVEL0, async (done: Function) => {
      expect(0x00000800).assertEqual(wantConstant.Flags.FLAG_INSTALL_ON_DEMAND);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_wantConstant_1300
     * @tc.name    Test wantConstant Params.APP_LAUNCH_TRUSTLIST.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_wantConstant_1300', Level.LEVEL3, async (done: Function) => {
      expect('ohos.params.appLaunchTrustList').assertEqual(wantConstant.Params.APP_LAUNCH_TRUSTLIST);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_0100
     * @tc.name    Test wantAgent OperationType.UNKNOWN_TYPE.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_WantAgent_0100', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(wantAgent.OperationType.UNKNOWN_TYPE);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_WantAgent_0200
     * @tc.name    Test wantAgent OperationType.SEND_COMMON_EVENT.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_WantAgent_0200', Level.LEVEL0, async (done: Function) => {
      expect(4).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_ConfigurationConstant_0100
     * @tc.name    Test ConfigurationConstant ScreenDensity.SCREEN_DENSITY_NOT_SET.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0100', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_NOT_SET);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_ConfigurationConstant_0200
     * @tc.name    Test ConfigurationConstant ScreenDensity.SCREEN_DENSITY_SDPI.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0200', Level.LEVEL0, async (done: Function) => {
      expect(120).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_SDPI);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_ConfigurationConstant_0300
     * @tc.name    Test ConfigurationConstant ScreenDensity.SCREEN_DENSITY_MDPI.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0300', Level.LEVEL0, async (done: Function) => {
      expect(160).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_MDPI);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_ConfigurationConstant_0400
     * @tc.name    Test ConfigurationConstant ScreenDensity.SCREEN_DENSITY_LDPI.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0400', Level.LEVEL0, async (done: Function) => {
      expect(240).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_LDPI);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_ConfigurationConstant_0500
     * @tc.name    Test ConfigurationConstant ScreenDensity.SCREEN_DENSITY_XLDPI.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0500', Level.LEVEL0, async (done: Function) => {
      expect(320).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XLDPI);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_ConfigurationConstant_0600
     * @tc.name    Test ConfigurationConstant ScreenDensity.SCREEN_DENSITY_XXLDPI.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0600', Level.LEVEL0, async (done: Function) => {
      expect(480).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XXLDPI);
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_ConfigurationConstant_0700
     * @tc.name    Test ConfigurationConstant ScreenDensity.SCREEN_DENSITY_XXXLDPI.
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0700', Level.LEVEL0, async (done: Function) => {
      expect(640).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XXXLDPI);
      done();
    })
  })
}
