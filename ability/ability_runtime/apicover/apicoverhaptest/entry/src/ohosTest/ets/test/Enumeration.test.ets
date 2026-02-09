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
import application from '@ohos.app.ability.application';
import insightIntent from '@ohos.app.ability.insightIntent';

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

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_0100
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_0100
     * @tc.desc   Test abilityConstant LaunchReason.START_ABILITY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0100', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.LaunchReason.START_ABILITY);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_0200
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_0200
     * @tc.desc   Test abilityConstant LaunchReason.INSIGHT_INTENT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0200', Level.LEVEL0, async (done: Function) => {
      expect(9).assertEqual(abilityConstant.LaunchReason.INSIGHT_INTENT);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_0300
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_0300
     * @tc.desc   Test abilityConstant LastExitReason.ABILITY_NOT_RESPONDING.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0300', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.LastExitReason.ABILITY_NOT_RESPONDING);
      done();
    })
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_0400
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_0400
     * @tc.desc   Test abilityConstant LastExitReason.NORMAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0400', Level.LEVEL0, async (done: Function) => {
      expect(2).assertEqual(abilityConstant.LastExitReason.NORMAL);
      done();
    })
    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_0500
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_0500
     * @tc.desc   Test abilityConstant LastExitReason.CPP_CRASH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0500', Level.LEVEL0, async (done: Function) => {
      expect(3).assertEqual(abilityConstant.LastExitReason.CPP_CRASH);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_0600
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_0600
     * @tc.desc   Test abilityConstant LastExitReason.JS_ERROR.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0600', Level.LEVEL0, async (done: Function) => {
      expect(4).assertEqual(abilityConstant.LastExitReason.JS_ERROR);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_0700
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_0700
     * @tc.desc   Test abilityConstant LastExitReason.APP_FREEZE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0700', Level.LEVEL0, async (done: Function) => {
      expect(5).assertEqual(abilityConstant.LastExitReason.APP_FREEZE);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_0800
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_0800
     * @tc.desc   Test abilityConstant LastExitReason.PERFORMANCE_CONTROL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0800', Level.LEVEL0, async (done: Function) => {
      expect(6).assertEqual(abilityConstant.LastExitReason.PERFORMANCE_CONTROL);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_0900
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_0900
     * @tc.desc   Test abilityConstant LastExitReason.RESOURCE_CONTROL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_0900', Level.LEVEL0, async (done: Function) => {
      expect(7).assertEqual(abilityConstant.LastExitReason.RESOURCE_CONTROL);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_1000
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_1000
     * @tc.desc   Test abilityConstant LastExitReason.UPGRADE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1000', Level.LEVEL0, async (done: Function) => {
      expect(8).assertEqual(abilityConstant.LastExitReason.UPGRADE);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_1100
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_1100
     * @tc.desc   Test abilityConstant MemoryLevel.MEMORY_LEVEL_MODERATE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1100', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_MODERATE);

      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_1200
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_1200
     * @tc.desc   Test abilityConstant MemoryLevel.MEMORY_LEVEL_LOW.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1200', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_LOW);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_1300
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_1300
     * @tc.desc   Test abilityConstant MemoryLevel.MEMORY_LEVEL_CRITICAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1300', Level.LEVEL0, async (done: Function) => {
      expect(2).assertEqual(abilityConstant.MemoryLevel.MEMORY_LEVEL_CRITICAL);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_1400
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_1400
     * @tc.desc   Test abilityConstant LaunchReason.SHARE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1400', Level.LEVEL0, async (done: Function) => {
      expect(5).assertEqual(abilityConstant.LaunchReason.SHARE);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_1500
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_1500
     * @tc.desc   Test abilityConstant ContinueState.ACTIVE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1500', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(abilityConstant.ContinueState.ACTIVE);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_1600
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_1600
     * @tc.desc   Test abilityConstant ContinueState.INACTIVE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1600', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.ContinueState.INACTIVE);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_1700
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_1700
     * @tc.desc   Test abilityConstant LaunchReason.AUTO_STARTUP.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1700', Level.LEVEL0, async (done: Function) => {
      expect(8).assertEqual(abilityConstant.LaunchReason.AUTO_STARTUP);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_1800
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_1800
     * @tc.desc   Test abilityConstant LastExitReason.USER_REQUEST.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1800', Level.LEVEL0, async (done: Function) => {
      expect(9).assertEqual(abilityConstant.LastExitReason.USER_REQUEST);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_1900
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_1900
     * @tc.desc   Test abilityConstant LastExitReason.SIGNAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_1900', Level.LEVEL0, async (done: Function) => {
      expect(10).assertEqual(abilityConstant.LastExitReason.SIGNAL);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_2000
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_2000
     * @tc.desc   Test abilityConstant WindowMode.WINDOW_MODE_FULLSCREEN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2000', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.WindowMode.WINDOW_MODE_FULLSCREEN);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_2100
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_2100
     * @tc.desc   Test abilityConstant WindowMode.WINDOW_MODE_SPLIT_PRIMARY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2100', Level.LEVEL0, async (done: Function) => {
      expect(100).assertEqual(abilityConstant.WindowMode.WINDOW_MODE_SPLIT_PRIMARY);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_2200
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_2200
     * @tc.desc   Test abilityConstant WindowMode.WINDOW_MODE_SPLIT_SECONDARY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2200', Level.LEVEL0, async (done: Function) => {
      expect(101).assertEqual(abilityConstant.WindowMode.WINDOW_MODE_SPLIT_SECONDARY);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_2300
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_2300
     * @tc.desc   Test abilityConstant StateType.CONTINUATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2300', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(abilityConstant.StateType.CONTINUATION);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_2400
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_2400
     * @tc.desc   Test abilityConstant StateType.APP_RECOVERY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2400', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.StateType.APP_RECOVERY);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AbilityConstant_2500
     * @tc.number SUB_Ability_AbilityBase_AbilityConstant_2500
     * @tc.desc   Test abilityConstant StateType.APP_RECOVERY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_2500', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(abilityConstant.StateType.APP_RECOVERY);
      done();
    })


    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_0100
     * @tc.number SUB_Ability_AbilityBase_wantConstant_0100
     * @tc.desc   Test wantConstant Params.CONTENT_TITLE_KEY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0100', Level.LEVEL0, async (done: Function) => {
      expect('ohos.extra.param.key.contentTitle').assertEqual(wantConstant.Params.CONTENT_TITLE_KEY);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_0200
     * @tc.number SUB_Ability_AbilityBase_wantConstant_0200
     * @tc.desc   Test wantConstant Params.SHARE_ABSTRACT_KEY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0200', Level.LEVEL0, async (done: Function) => {
      expect('ohos.extra.param.key.shareAbstract').assertEqual(wantConstant.Params.SHARE_ABSTRACT_KEY);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_0300
     * @tc.number SUB_Ability_AbilityBase_wantConstant_0300
     * @tc.desc   Test wantConstant Params.SHARE_URL_KEY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0300', Level.LEVEL0, async (done: Function) => {
      expect('ohos.extra.param.key.shareUrl').assertEqual(wantConstant.Params.SHARE_URL_KEY);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_0400
     * @tc.number SUB_Ability_AbilityBase_wantConstant_0400
     * @tc.desc   Test wantConstant Params.ABILITY_RECOVERY_RESTART.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0400', Level.LEVEL0, async (done: Function) => {
      expect('ohos.ability.params.abilityRecoveryRestart').assertEqual(wantConstant.Params.ABILITY_RECOVERY_RESTART);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_0500
     * @tc.number SUB_Ability_AbilityBase_wantConstant_0500
     * @tc.desc   Test wantConstant Params.SHOW_MODE_KEY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0500', Level.LEVEL0, async (done: Function) => {
      expect('ohos.extra.param.key.showMode').assertEqual(wantConstant.Params.SHOW_MODE_KEY);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_0600
     * @tc.number SUB_Ability_AbilityBase_wantConstant_0600
     * @tc.desc   Test wantConstant Params.SUPPORT_CONTINUE_PAGE_STACK_KEY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0600', Level.LEVEL0, async (done: Function) => {
      const result = 'ohos.extra.param.key.supportContinuePageStack';
      expect(result).assertEqual(wantConstant.Params.SUPPORT_CONTINUE_PAGE_STACK_KEY);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_0700
     * @tc.number SUB_Ability_AbilityBase_wantConstant_0700
     * @tc.desc   Test wantConstant Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0700', Level.LEVEL0, async (done: Function) => {
      const result = 'ohos.extra.param.key.supportContinueSourceExit';
      expect(result).assertEqual(wantConstant.Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_0800
     * @tc.number SUB_Ability_AbilityBase_wantConstant_0800
     * @tc.desc   Test wantConstant Params.PARAMS_STREAM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0800', Level.LEVEL0, async (done: Function) => {
      expect('ability.params.stream').assertEqual(wantConstant.Params.PARAMS_STREAM);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_0900
     * @tc.number SUB_Ability_AbilityBase_wantConstant_0900
     * @tc.desc   Test wantConstant Params.LAUNCH_REASON_MESSAGE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_0900', Level.LEVEL0, async (done: Function) => {
      expect('ohos.params.launchReasonMessage').assertEqual(wantConstant.Params.LAUNCH_REASON_MESSAGE);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_1000
     * @tc.number SUB_Ability_AbilityBase_wantConstant_1000
     * @tc.desc   Test wantConstant Flags.FLAG_AUTH_WRITE_URI_PERMISSION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1000', Level.LEVEL0, async (done: Function) => {
      expect(0x00000002).assertEqual(wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_1100
     * @tc.number SUB_Ability_AbilityBase_wantConstant_1100
     * @tc.desc   Test wantConstant Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1100', Level.LEVEL0, async (done: Function) => {
      expect(0x00000040).assertEqual(wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_1200
     * @tc.number SUB_Ability_AbilityBase_wantConstant_1200
     * @tc.desc   Test wantConstant Flags.FLAG_INSTALL_ON_DEMAND.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1200', Level.LEVEL0, async (done: Function) => {
      expect(0x00000800).assertEqual(wantConstant.Flags.FLAG_INSTALL_ON_DEMAND);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_1300
     * @tc.number SUB_Ability_AbilityBase_wantConstant_1300
     * @tc.desc   Test wantConstant Params.APP_LAUNCH_TRUSTLIST.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1300', Level.LEVEL0, async (done: Function) => {
      expect('ohos.params.appLaunchTrustList').assertEqual(wantConstant.Params.APP_LAUNCH_TRUSTLIST);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_1700
     * @tc.number SUB_Ability_AbilityBase_wantConstant_1700
     * @tc.desc   Test wantConstant Params.APP_CLONE_INDEX_KEY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1700', Level.LEVEL0, async (done: Function) => {
      expect('ohos.extra.param.key.appCloneIndex').assertEqual(wantConstant.Params.APP_CLONE_INDEX_KEY);
      done();
    })


    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgent_0100
     * @tc.number SUB_Ability_AbilityBase_WantAgent_0100
     * @tc.desc   Test wantAgent OperationType.UNKNOWN_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgent_0100', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(wantAgent.OperationType.UNKNOWN_TYPE);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_WantAgent_0200
     * @tc.number SUB_Ability_AbilityBase_WantAgent_0200
     * @tc.desc   Test wantAgent OperationType.SEND_COMMON_EVENT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_WantAgent_0200', Level.LEVEL0, async (done: Function) => {
      expect(4).assertEqual(wantAgent.OperationType.SEND_COMMON_EVENT);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ConfigurationConstant_0100
     * @tc.number SUB_Ability_AbilityBase_ConfigurationConstant_0100
     * @tc.desc   Test ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_NOT_SET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0100', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_NOT_SET);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ConfigurationConstant_0200
     * @tc.number SUB_Ability_AbilityBase_ConfigurationConstant_0200
     * @tc.desc   Test ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_SDPI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0200', Level.LEVEL0, async (done: Function) => {
      expect(120).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_SDPI);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ConfigurationConstant_0300
     * @tc.number SUB_Ability_AbilityBase_ConfigurationConstant_0300
     * @tc.desc   Test ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_MDPI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0300', Level.LEVEL0, async (done: Function) => {
      expect(160).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_MDPI);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ConfigurationConstant_0700
     * @tc.number SUB_Ability_AbilityBase_ConfigurationConstant_0700
     * @tc.desc   Test ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_LDPI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0700', Level.LEVEL0, async (done: Function) => {
      expect(240).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_LDPI);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ConfigurationConstant_0400
     * @tc.number SUB_Ability_AbilityBase_ConfigurationConstant_0400
     * @tc.desc   Test ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XLDPI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0400', Level.LEVEL0, async (done: Function) => {
      expect(320).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XLDPI);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ConfigurationConstant_0500
     * @tc.number SUB_Ability_AbilityBase_ConfigurationConstant_0500
     * @tc.desc   Test ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XXLDPI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0500', Level.LEVEL0, async (done: Function) => {
      expect(480).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XXLDPI);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_ConfigurationConstant_0600
     * @tc.number SUB_Ability_AbilityBase_ConfigurationConstant_0600
     * @tc.desc   Test ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XXXLDPI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_ConfigurationConstant_0600', Level.LEVEL0, async (done: Function) => {
      expect(640).assertEqual(ConfigurationConstant.ScreenDensity.SCREEN_DENSITY_XXXLDPI);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_1400
     * @tc.number SUB_Ability_AbilityBase_wantConstant_1400
     * @tc.desc   Test wantConstant Params.ABILITY_UNIFIED_DATA_KEY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1400', Level.LEVEL0, async (done: Function) => {
      expect('ohos.param.ability.udKey').assertEqual(wantConstant.Params.ABILITY_UNIFIED_DATA_KEY);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_1500
     * @tc.number SUB_Ability_AbilityBase_wantConstant_1500
     * @tc.desc   Test wantConstant Params.LAUNCH_REASON_MESSAGE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1500', Level.LEVEL0, async (done: Function) => {
      expect(11).assertEqual(abilityConstant.LaunchReason.PRELOAD);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_1600
     * @tc.number SUB_Ability_AbilityBase_wantConstant_1600
     * @tc.desc   Test wantConstant Params.LAUNCH_REASON_MESSAGE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1600', Level.LEVEL0, async (done: Function) => {
      expect('ReasonMessage_DesktopShortcut').assertEqual(abilityConstant.REASON_MESSAGE_DESKTOP_SHORTCUT);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_wantConstant_1800
     * @tc.number SUB_Ability_AbilityBase_wantConstant_1800
     * @tc.desc   Test wantConstant ShowMode.EMBEDDED_HALF.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_wantConstant_1800', Level.LEVEL0, async (done: Function) => {
      expect('2').assertEqual(wantConstant.ShowMode.EMBEDDED_HALF + '');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppPreloadType_0100
     * @tc.number SUB_Ability_AbilityBase_AppPreloadType_0100
     * @tc.desc   Test AppPreloadType UNSPECIFIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AppPreloadType_0100', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(application.AppPreloadType.UNSPECIFIED);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppPreloadType_0200
     * @tc.number SUB_Ability_AbilityBase_AppPreloadType_0200
     * @tc.desc   Test AppPreloadType TYPE_CREATE_PROCESS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AppPreloadType_0200', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(application.AppPreloadType.TYPE_CREATE_PROCESS);
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AppPreloadType_0300
     * @tc.number SUB_Ability_AbilityBase_AppPreloadType_0300
     * @tc.desc   Test AppPreloadType TYPE_CREATE_ABILITY_STAGE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AppPreloadType_0300', Level.LEVEL0, async (done: Function) => {
      expect(2).assertEqual(application.AppPreloadType.TYPE_CREATE_ABILITY_STAGE);
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AppPreloadType_0400
     * @tc.number SUB_Ability_AbilityBase_AppPreloadType_0400
     * @tc.desc   Test AppPreloadType TYPE_CREATE_WINDOW_STAGE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AppPreloadType_0400', Level.LEVEL0, async (done: Function) => {
      expect(3).assertEqual(application.AppPreloadType.TYPE_CREATE_WINDOW_STAGE);
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AppPreloadType_0500
     * @tc.number SUB_Ability_AbilityBase_AppPreloadType_0500
     * @tc.desc   Test AppPreloadType TYPE_CREATE_BACKGROUND_ABILITY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AppPreloadType_0500', Level.LEVEL0, async (done: Function) => {
      expect(4).assertEqual(application.AppPreloadType.TYPE_CREATE_BACKGROUND_ABILITY);
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_InsightIntent_0100
     * @tc.number SUB_Ability_AbilityBase_InsightIntent_0100
     * @tc.desc   Test ReturnMode CALLBACK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_InsightIntent_0100', Level.LEVEL0, async (done: Function) => {
      expect(0).assertEqual(insightIntent.ReturnMode.CALLBACK);
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_InsightIntent_0200
     * @tc.number SUB_Ability_AbilityBase_InsightIntent_0200
     * @tc.desc   Test ReturnMode FUNCTION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_InsightIntent_0200', Level.LEVEL0, async (done: Function) => {
      expect(1).assertEqual(insightIntent.ReturnMode.FUNCTION);
      done();
    })

  })
}
