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
import wantConstant from "@ohos.app.ability.wantConstant";

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function abilitystaticTest() {
  describe('ActsAbilityStaticTest', (): void => {

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_WantConstant_Static_0100
    * @tc.name: SUB_Ability_AbilityRuntime_WantConstant_Static_0100
    * @tc.desc: Get APP_INSTANCE_KEY CREATE_APP_INSTANCE_KEY CALLER_APP_CLONE_INDEX.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    */
    it('SUB_Ability_AbilityRuntime_WantConstant_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      tag = "SUB_Ability_AbilityRuntime_WantConstant_Static_0100";
      hilog.info(domain, tag, '====> [SUB_Ability_AbilityRuntime_WantConstant_Static_0100] start');
      expect(wantConstant.Params.APP_INSTANCE_KEY + '').assertEqual("ohos.extra.param.key.appInstance")
      expect(wantConstant.Params.CREATE_APP_INSTANCE_KEY + '').assertEqual("ohos.extra.param.key.createAppInstance")
      expect(wantConstant.Params.CALLER_APP_CLONE_INDEX + '').assertEqual("ohos.param.callerAppCloneIndex")
      hilog.info(domain, tag, '====> [SUB_Ability_AbilityRuntime_WantConstant_Static_0100] end');
      done();
    })
  })
}
