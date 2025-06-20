/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, expect, it, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

export default function abilityTest() {
  describe('ActsInsightIntentDecoratorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntent_0010
     * @tc.name SUB_Ability_AbilityRunTime_InsightIntent_0010
     * @tc.desc The Ability or Page with @InsightIntentLink @InsightIntentEntry @InsightIntentFunction&@InsightIntentFunctionMethod @InsightIntentPage Decorator can start normally
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : Level 1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntent_0010', Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Ability_AbilityRunTime_InsightIntent_0010';
      console.log(`[${caseName}] create`);
      try {
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[${caseName}]: error` + error.code + error.message);
        expect().assertFail();
        done();
      }
      console.log(`[${caseName}]: end`)
    })
  })
}
