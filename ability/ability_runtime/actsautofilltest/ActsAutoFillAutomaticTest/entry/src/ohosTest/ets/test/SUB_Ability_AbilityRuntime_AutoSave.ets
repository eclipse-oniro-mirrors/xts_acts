/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Component, Driver, UiWindow, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import autoFillManager from '@ohos.app.ability.autoFillManager';
import commonEventManager from '@ohos.commonEventManager';

export default function abilityTest() {
  describe('ActsAutoSaveTest', () => {

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoSave_0100
     * @tc.name: RequestAutoSave Interface : onSaveRequestSuccess
     * @tc.desc: Manually call the RequestAutoSave interface and trigger success callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoSave_0100', 0, async (done:Function) => {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoSave_0100_TAG';
      
      let uiContext: UIContext | undefined = undefined;
      console.info("uiContext: ", uiContext);
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          console.log("save request on success");
        },
        onFailure: () => {
          console.log("save request on failure");
        }
      }
      console.log("callback: ", JSON.stringify(callback));
      try {
        autoFillManager.requestAutoSave(uiContext, callback);
      } catch (error) {
        console.log("requestAutoSave catch error, code: ", JSON.stringify(error.code));
        expect(error.code == 401).assertTrue();
        done();
      }
      console.log("du.yuan end");
      done();
    })
  })
}
