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
import { UIContext } from '@ohos.arkui.UIContext';
import autoFillManager from '@ohos.app.ability.autoFillManager';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function AutoSaveTestStatic() {
  describe('ActsAutoSaveStaticTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoSave_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_AutoSave_Static_0100
     * @tc.desc   Manually call the RequestAutoSave interface with callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoSave_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoSave_Static_0100';
      let isSuccess = false;
      let isFailure = false;
      let uiContext: UIContext | undefined;
      hilog.info(domain,  tag ,"uiContext: ", uiContext);
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          hilog.info(domain,  tag ,"save request on success");
          isSuccess = true;
        },
        onFailure: () => {
          hilog.info(domain,  tag ,"save request on failure");
          isFailure = true;
        }
      }
      try {
        autoFillManager.requestAutoSave(uiContext!, callback);
      } catch (error) {
        expect(isSuccess).assertFalse();
        expect(isFailure).assertFalse();
        done();
      }
      hilog.info(domain,  tag ,"du.yuan end");
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoSave_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_AutoSave_Static_0200
     * @tc.desc   Manually call the RequestAutoSave interface no callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoSave_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoSave_Static_0200';
      let isSuccess = false;
      let isFailure = false;
      let uiContext: UIContext | undefined;
      hilog.info(domain,  tag ,"uiContext: ", uiContext);
      try {
        autoFillManager.requestAutoSave(uiContext!);
      } catch (error) {
        expect(isSuccess).assertFalse();
        expect(isFailure).assertFalse();
        done();
      }
      hilog.info(domain,  tag ,"du.yuan end");
      done();
    })

  })
}