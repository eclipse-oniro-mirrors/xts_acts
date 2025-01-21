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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;

function sleep(s: number): Promise<void> {
  return new Promise((resolve, reject) => {
    setTimeout(resolve, s * 1000);
  })
}

export default function sendableContextTest() {
  describe('SendableContextTest', () => {
    beforeAll(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SendableContextTest beforeAll called');
      await sleep(1);
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SendableContextTest beforeEach called');
    })

    afterEach(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SendableContextTest afterEach called');
    })

    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SendableContextTest afterAll called');
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_SendableContext_AbilityStageContext_0100
     * @tc.name: convertToAbilityStageContext
     * @tc.desc: Test AbilityStageContext convertTo and convertFrom.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 1
     */
    it('SUB_Ability_AbilityRuntime_SendableContext_AbilityStageContext_0100', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_SendableContext_AbilityStageContext_0100 begin');
      let aStr = AppStorage.get<string>('[sendableAbilityStageContext] AbilityStageContext convert to AbilityStageContext');
      expect(aStr == 'succeed').assertTrue();
      let bStr = AppStorage.get<string>('[sendableAbilityStageContext] AbilityStageContext convert to ApplicationContext');
      expect(bStr == 'failed').assertTrue();
      let cStr = AppStorage.get<string>('[sendableAbilityStageContext] AbilityStageContext convert to UIAbilityContext');
      expect(cStr == 'failed').assertTrue();
      let dStr = AppStorage.get<string>('[sendableAbilityStageContext] AbilityStageContext convert to Context');
      expect(dStr == 'succeed').assertTrue();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_SendableContext_ApplicationContext_0100
     * @tc.name: convertToApplicationContext
     * @tc.desc: Test ApplicationContext convertTo and convertFrom.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 1
     */
    it('SUB_Ability_AbilityRuntime_SendableContext_ApplicationContext_0100', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_SendableContext_ApplicationContext_0100 begin');
      let aStr = AppStorage.get<string>('[sendableApplicationContext] ApplicationContext convert to ApplicationContext');
      expect(aStr == 'succeed').assertTrue();
      let bStr = AppStorage.get<string>('[sendableApplicationContext] ApplicationContext convert to UIAbilityContext');
      expect(bStr == 'failed').assertTrue();
      let cStr = AppStorage.get<string>('[sendableApplicationContext] ApplicationContext convert to AbilityStageContext');
      expect(cStr == 'failed').assertTrue();
      let dStr = AppStorage.get<string>('[sendableApplicationContext] ApplicationContext convert to Context');
      expect(dStr == 'succeed').assertTrue();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_SendableContext_UIAbilityContext_0100
     * @tc.name: convertToUIAbilityContext
     * @tc.desc: Test UIAbilityContext convertTo and convertFrom.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 1
     */
    it('SUB_Ability_AbilityRuntime_SendableContext_UIAbilityContext_0100', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_SendableContext_UIAbilityContext_0100 begin');
      let aStr = AppStorage.get<string>('[sendableUIAbilityContext] UIAbilityContext convert to UIAbilityContext');
      expect(aStr == 'succeed').assertTrue();
      let bStr = AppStorage.get<string>('[sendableUIAbilityContext] UIAbilityContext convert to ApplicationContext');
      expect(bStr == 'failed').assertTrue();
      let cStr = AppStorage.get<string>('[sendableUIAbilityContext] UIAbilityContext convert to AbilityStageContext');
      expect(cStr == 'failed').assertTrue();
      let dStr = AppStorage.get<string>('[sendableUIAbilityContext] UIAbilityContext convert to Context');
      expect(dStr == 'succeed').assertTrue();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_SendableContext_Context_0100
     * @tc.name: convertToContext
     * @tc.desc: Test Context convertTo and convertFrom.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: 1
     */
    it('SUB_Ability_AbilityRuntime_SendableContext_Context_0100', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_SendableContext_Context_0100 begin');
      let aStr = AppStorage.get<string>('[sendableContext] Context convert to Context');
      expect(aStr == 'succeed').assertTrue();
      let bStr = AppStorage.get<string>('[sendableContext] Context convert to ApplicationContext');
      expect(bStr == 'failed').assertTrue();
      let cStr = AppStorage.get<string>('[sendableContext] Context convert to AbilityStageContext');
      expect(cStr == 'failed').assertTrue();
      let dStr = AppStorage.get<string>('[sendableContext] Context convert to UIAbilityContext');
      expect(dStr == 'succeed').assertTrue();
    })
  })
}