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

import { describe, beforeAll, it, expect, TestType, Size, Level, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import { Driver, ON } from '@ohos.UiTest';

let context: common.UIAbilityContext
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function BackWithResultStaticTest() {
  describe('BackWithResultStaticTest', () => {

    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
    })

    beforeEach(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.backwithresulttest.static")
      await Utils.msSleep(5000)
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackWithResult_static_2900
     * @tc.number SUB_Ability_AbilityRuntime_BackWithResult_static_2900
     * @tc.desc   Test backToCallerAbleWithResult when requestCode is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_BackWithResult_static_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_BackWithResult_static_2900`;
      hilog.info(domain, tag, `it begin`);
      let requestCode: string = '23124asjdja';
      let want: Want = {};
      let resultCode = 100;
      let abilityResult: common.AbilityResult = {
        want,
        resultCode
      };
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      try {
        context.backToCallerAbilityWithResult(abilityResult, requestCode).then(() => {
          hilog.info(domain, tag, 'backToCallerAbilityWithResult succeed');
          expect().assertFail();
          done();
        }).catch((err): void => {
          hilog.info(domain, tag, `backToCallerAbilityWithResult1 failed, code is ${err.code}`);
          expect(err.code).assertEqual(16000074);
          done();
        });
      } catch (error) {
        if (error instanceof BusinessError) {
          hilog.info(domain, tag, `getGroupDir faile, err: ${error}`);
          expect().assertFail();
          done();
        }
      }
    })
  })
}
