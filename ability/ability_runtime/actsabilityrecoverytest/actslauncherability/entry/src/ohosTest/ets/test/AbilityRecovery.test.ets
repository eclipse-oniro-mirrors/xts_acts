/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let LOG_TAG: string = 'testTag ';
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let scbEnabled: boolean = false;

function getUIAbilityContext() {
  let context: common.UIAbilityContext | undefined = AppStorage.get<common.UIAbilityContext>('TestAbilityContext');
  return context;
}

async function checkScbExist() {
  try {
    let cmd = 'bm dump -n com.ohos.sceneboard';
    let ret = await abilityDelegator.executeShellCommand(cmd);
    console.log(LOG_TAG + `data: ${JSON.stringify(ret)}`);
    let subStr = "error";
    if (ret.stdResult.indexOf(subStr)) {
      scbEnabled = true;
    }
  } catch (error) {
    console.log(LOG_TAG + `error: ${JSON.stringify(error)}`);
  }
}

export default function abilityRecoveryTest() {
  let TAG = "";

  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'AbilityRecoveryTest beforeAll called');
      await checkScbExist();
      hilog.info(0x0000, LOG_TAG, 'scbEnabled %{public}s', JSON.stringify(scbEnabled));
    })
    beforeEach(async () => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'AbilityRecoveryTest beforeEach called');
    })
    afterEach(() => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'AbilityRecoveryTest afterEach called');
    })
    afterAll(() => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'AbilityRecoveryTest beforeAll called');
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_BackgroundRecovery_0800
     * @tc.name: context.setRestoreEnabled
     * @tc.desc: API test for context.setRestoreEnabled.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 3
     */
    it('SUB_Ability_AbilityRuntime_BackgroundRecovery_0800', Level.LEVEL0, async () => {
      TAG = 'SUB_Ability_AbilityRuntime_BackgroundRecovery_0800 == ';
      console.log(TAG + 'begin');
      // get UIAbilityContext
      let context = getUIAbilityContext();
      try {
        context?.setRestoreEnabled(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(TAG + 'setRestoreEnabled failed ' + JSON.stringify(error));
        expect(error.code === 401).assertTrue();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_BackgroundRecovery_0700
     * @tc.name: context.setRestoreEnabled
     * @tc.desc: API test for context.setRestoreEnabled.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 3
     */
    it('SUB_Ability_AbilityRuntime_BackgroundRecovery_0700', Level.LEVEL0, async () => {
      TAG = 'SUB_Ability_AbilityRuntime_BackgroundRecovery_0700 == ';
      console.log(TAG + 'begin');
      // get UIAbilityContext
      let context = getUIAbilityContext();
      try {
        context?.setRestoreEnabled(null);
        expect().assertFail();
      } catch (error) {
        console.error(TAG + 'setRestoreEnabled failed ' + JSON.stringify(error));
        expect(error.code === 401).assertTrue();
      }
    })
  })
}