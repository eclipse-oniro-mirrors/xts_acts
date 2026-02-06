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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function verificationStaticTest() {
  describe('verificationStaticTest', () => {

    beforeAll(async() => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility2 -b com.example.apicoverhaptest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_AbilityConstant_Static_0200
     * @tc.number SUB_AA_OpenHarmony_AbilityConstant_Static_0200
     * @tc.desc   The startAbility interface starts the ability, not the start of call or continue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AA_OpenHarmony_AbilityConstant_Static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      tag = 'SUB_AA_OpenHarmony_AbilityConstant_Static_0200 ==>';
      await Utils.msSleep(2000);
      let launchWant: Want = AppStorage.get<Want>("launchWant") as Want;
      let lastRequestWant: Want = AppStorage.get<Want>("lastRequestWant") as Want;
      let windowStage: window.WindowStage = AppStorage.get<window.WindowStage>("windowStage") as window.WindowStage;
      expect(launchWant.bundleName).assertEqual("com.example.apicoverhaptest.static");
      expect(lastRequestWant.bundleName).assertEqual("com.example.apicoverhaptest.static");
      expect(windowStage).not().assertNull();
      done();
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_SetMissionLabel_static_0100
     * @tc.number SUB_AA_OpenHarmony_SetMissionLabel_static_0100
     * @tc.desc   Verify setMissionLabel that the input parameter is string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AA_OpenHarmony_SetMissionLabel_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        tag = `SUB_AA_OpenHarmony_SetMissionLabel_static_0100`;
        hilog.info(domain, tag, `it begin`);
        let label = 'test';
        let missionLabelUpdatedFlag = false;
        const context: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
        context.setMissionLabel(label).then(() => {
          hilog.info(domain, tag, 'setMissionLabel success');
          missionLabelUpdatedFlag = true;
          expect(missionLabelUpdatedFlag).assertTrue();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, 'setMissionLabel err');
          expect().assertFail();
          done();
        });
      })

    /**
     * @tc.name   SUB_AA_OpenHarmony_SetMissionLabel_static_0400
     * @tc.number SUB_AA_OpenHarmony_SetMissionLabel_static_0400
     * @tc.desc   Verify multiple setMissionLabel that the input parameter is string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AA_OpenHarmony_SetMissionLabel_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        tag = `SUB_AA_OpenHarmony_SetMissionLabel_static_0400`;
        hilog.info(domain, tag, `it begin`);
        let label = 'test';
        let missionLabelUpdatedFlag = false;
        const context: common.UIAbilityContext =
          AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
        context.setMissionLabel(label, (err: BusinessError<void> | null) => {
          if (err == null || err.code == 0) {
            missionLabelUpdatedFlag = true;
            expect(missionLabelUpdatedFlag).assertTrue();
            done();
          } else {
            hilog.info(domain, tag, 'setMissionLabel err');
            expect().assertFail();
            done()
          }
        })
      })
  })
}