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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() {
  describe('ActsGetAbilityStateStageTest', () => {

    /**
     * @tc.name   ACTS_GetAbilityState_Static_0700
     * @tc.number ACTS_GetAbilityState_Static_0700
     * @tc.desc   AbilityLifecycleState EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetAbilityState_Static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '====>start ACTS_GetAbilityState_Static_0700====');
      expect(abilityDelegatorRegistry.AbilityLifecycleState.UNINITIALIZED + '').assertEqual('0');
      expect(abilityDelegatorRegistry.AbilityLifecycleState.CREATE + '').assertEqual('1');
      expect(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND + '').assertEqual('2');
      expect(abilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND + '').assertEqual('3');
      expect(abilityDelegatorRegistry.AbilityLifecycleState.DESTROY + '').assertEqual('4');
      hilog.info(domain, tag, "====>ACTS_GetAbilityState_Static_0700 end====");
      done();
    })

  })
}
