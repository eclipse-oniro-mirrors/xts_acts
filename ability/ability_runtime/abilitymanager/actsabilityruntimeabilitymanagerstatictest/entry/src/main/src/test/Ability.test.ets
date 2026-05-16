/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll, beforeEach } from "../../../hypium/index";
import abilityManager from "@ohos.app.ability.abilityManager"
import systemParameterEnhance from "@ohos.systemParameterEnhance"
import hilog from '@ohos.hilog';

let tag = "ActsAbilityMonitor";

export default function abilityTest() {

  let TAG = "";

  describe('ActsAbilityMonitor', () => {

    /**
     * @tc.name   SUB_Ability_AbilityManager_IsEmbeddedUIExtensionSupported_static_0100
     * @tc.number SUB_Ability_AbilityManager_IsEmbeddedUIExtensionSupported_static_0100
     * @tc.desc   Test isEmbeddedUIExtensionSupported() returns true when multi_process_model is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityManager_IsEmbeddedUIExtensionSupported_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityManager_IsEmbeddedUIExtensionSupported_static_0100";
      hilog.info(0x0000, tag, '%{public}s', TAG + " start");
      let multiProcessModel: string = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      let isSupported: boolean = abilityManager.isEmbeddedUIExtensionSupported();
      if (multiProcessModel === 'true') {
        expect(isSupported).assertTrue();
      } else {
        expect(isSupported).assertFalse();
      }
      done();
    })

  })
}