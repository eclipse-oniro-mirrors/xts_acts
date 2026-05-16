/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';

let context:common.UIAbilityContext;
export default function AbilityRuntimeConfigrationApplicationContextSetLanguage() {
  describe('AbilityRuntimeConfigrationApplicationContextSetLanguage', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
    })
    beforeEach(async () => {
    })
    afterEach(() => {})
    afterAll(async () => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0300
     * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0300
     * @tc.desc   Set the language for calling the interface with undefined application parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0300', Level.LEVEL0, async (done:Function) => {
      const testNum = 'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_SetLanguage_0300';
      try {
        await context.getApplicationContext().setLanguage(undefined)
      } catch (err) {
        hilog.error(0x0000, 'testTag', `restart failed: ${err.code}, ${err.message},${testNum}`);
        expect(err?.code).assertEqual(401)
        done();
      }
    })
  })
}