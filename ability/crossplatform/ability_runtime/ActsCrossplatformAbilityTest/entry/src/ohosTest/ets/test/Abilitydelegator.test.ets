/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";
import { Driver, ON } from '@ohos.UiTest';

export default function AbilityDelegatorTest() {
  describe("AbilityDelegatorTest", () => {
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
    
    /**
     * @tc.name   GET_ABILITY_DELEGATOR_0001
     * @tc.number GET_ABILITY_DELEGATOR_0001
     * @tc.desc   test getAbilityDelegator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GET_ABILITY_DELEGATOR_0001", Level.LEVEL0, async (done: Function) => {
      const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      expect(abilityDelegator != null).assertTrue();
      abilityDelegator.printSync("GET_ABILITY_DELEGATOR_0001 pass");
      done();
    });

    /**
     * @tc.name   GET_ARGUMENTS_0001
     * @tc.number GET_ARGUMENTS_0001
     * @tc.desc   test getArguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GET_ARGUMENTS_0001", Level.LEVEL0, async (done: Function) => {
      const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      const abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
      let bundleName: string = abilityDelegatorArguments.bundleName;
      let testRunnerClassName: string = abilityDelegatorArguments.testRunnerClassName;
      let parameters: Record<string, string> = abilityDelegatorArguments.parameters;
      let moduleName = parameters["moduleName"];
      let timeout = parameters["timeout"];
      abilityDelegator.printSync(
        "GET_ARGUMENTS_0001 bundleName: " + bundleName
      );
      abilityDelegator.printSync(
        "GET_ARGUMENTS_0001 testRunnerClassName: " + testRunnerClassName
      );
      abilityDelegator.printSync(
        "GET_ARGUMENTS_0001 moduleName: " + moduleName
      );
      abilityDelegator.printSync("GET_ARGUMENTS_0001 timeout: " + timeout);
      expect(bundleName).assertEqual("com.example.delegatortest");
      expect(testRunnerClassName).assertEqual("OpenHarmonyTestRunner");
      expect(moduleName == null).assertFalse();
      expect(timeout).assertEqual(undefined);
      abilityDelegator.printSync("GET_ARGUMENTS_0001 pass");
      done();
    });
  });
}
