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

export default function ActsCapiMulInstanceNotSupportTest() {
  describe('ActsCapiMulInstanceNotSupportTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0900
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0900
     * @tc.desc   Testing StartSelfUIAbilityWithStartOptions returns 16000078.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_StartSelfUIAbilityWithStartOptions_0900`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.StartSelfUIAbilityWithStartOptionsInstanceNotSupport();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000078).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_NativeAbilityRuntime_AbiliRuntimeErrorMultiInstanceNotSupport_0100
     * @tc.number SUB_Ability_AbilityBase_NativeAbilityRuntime_AbiliRuntimeErrorMultiInstanceNotSupport_0100
     * @tc.desc   Test AbiliRuntimeErrorMultiInstanceNotSupport error code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_NativeAbilityRuntime_AbiliRuntimeErrorMultiInstanceNotSupport_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_Ability_AbilityBase_NativeAbilityRuntime_AbiliRuntimeErrorMultiInstanceNotSupport_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result:number = AbilityKitTest.AbiliRuntimeErrorMultiInstanceNotSupportCode();
          if(result == 801){
            expect(801).assertEqual(result);
            done();
            return;
          }
          expect(16000078).assertEqual(result);
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
