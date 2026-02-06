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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import AbilityKitTest from 'libentry.so'

const ABILITY_ERR_OK = 0;

export default function ActsCapiNoPermissionTest() {
  describe('ActsCapiNoPermissionTest', () => {

    /**
     * @tc.number  : SUB_Ability_AbilityBase_NativeChildProcess_StartSelfUIAbility_0100
     * @tc.name    : SUB_Ability_AbilityBase_NativeChildProcess_StartSelfUIAbility_0100
     * @tc.desc    : Testing StartSelfUIAbility returns 201.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Ability_AbilityBase_NativeChildProcess_StartSelfUIAbility_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeChildProcess_StartSelfUIAbility_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.StartSelfUIAbilityPermissionDenied();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(201).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number  : SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_1100
     * @tc.name    : SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_1100
     * @tc.desc    : Test StartSelfUIAbilityWithStartOptions and return 201.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_1100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.StartSelfUIAbilityWithStartOptionsPermissionDenied();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(201).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number  : SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodePermissionDenied_0100
     * @tc.name    : SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodePermissionDenied_0100
     * @tc.desc    : Test AbilityRuntimeErrorCodePermissionDenied error code.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodePermissionDenied_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbilityRuntimeErrorCodePermissionDenied_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbilityRuntimeErrorCodePermissionDeniedCode();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(201).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })
  })
}
