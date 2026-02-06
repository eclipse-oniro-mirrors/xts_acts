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

import { describe, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function abilityTest() {
  let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator | undefined = AppStorage.get<AbilityDelegatorRegistry.AbilityDelegator>("abilityDelegator");
  describe('ACTS_AACommand_01_3', () => {
    /**
     * @tc.number: ACTS_AACommand_test_0300_9
     * @tc.name: -b, -s unittest, -p, -s class, -s level, -s size, -s testType, -s timeout,
     *           -s <any-key> <any-value>, -w, etc. of the test command arguments are
     *           valid ( -s class specifies only test suites).
     * @tc.desc: Verify that the test framework can start normally through the test command.
     */
    it('ACTS_AACommand_test_0300_9', Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_AACommand_test_0300_9 ---------3-------- start");
      let msg = 'ACTS_AACommand_0200/0300/0400/0500/0600';
      abilityDelegator?.print(msg, () => {
        console.log("ACTS_AACommand_test_0300_9 print  test  end ========> callback ");
      })
      let AbilityDelegatorArgs: AbilityDelegatorRegistry.AbilityDelegatorArgs = AbilityDelegatorRegistry.getArguments();
      console.debug("====>getArguments is====>" + JSON.stringify(AbilityDelegatorArgs));
      expect(AbilityDelegatorArgs.bundleName).assertEqual('com.example.actsaacommandtestatest');
      expect(AbilityDelegatorArgs.parameters['-b']).assertEqual('com.example.actsaacommandtestatest');
      expect(AbilityDelegatorArgs.parameters['-p']).assertEqual('com.example.actsaacommandtestatest');
      expect(AbilityDelegatorArgs.parameters['-s unittest']).assertEqual('OpenHarmonyTestRunner');
      expect(AbilityDelegatorArgs.parameters['-w']).assertEqual("40");
      expect(AbilityDelegatorArgs.parameters['-s class']).assertEqual("ACTS_AACommand_01_3");
      expect(AbilityDelegatorArgs.parameters['-s level']).assertEqual("1");
      expect(AbilityDelegatorArgs.parameters['-s size']).assertEqual("0");
      expect(AbilityDelegatorArgs.parameters['-s testType']).assertEqual("aaa");
      expect(AbilityDelegatorArgs.parameters['-s timeout']).assertEqual("5");
      expect(AbilityDelegatorArgs.parameters['-s 1']).assertEqual("3");
      expect(AbilityDelegatorArgs.testRunnerClassName).assertEqual('OpenHarmonyTestRunner');
      done();
    })
  })
}
