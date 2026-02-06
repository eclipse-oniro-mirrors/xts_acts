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

import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { ErrorCode as errorCode } from '@ohos.ability.errorCode';

export default function AbilityErrorCodeStaticTest() {
  describe('AbilityErrorCodeStaticTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityBase_errorCode_Static_0100
     * @tc.number SUB_Ability_AbilityBase_errorCode_Static_0100
     * @tc.desc   Test errorCode errorCode.NO_ERROR.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_errorCode_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect('0').assertEqual(errorCode.NO_ERROR + '');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_errorCode_Static_0200
     * @tc.number SUB_Ability_AbilityBase_errorCode_Static_0200
     * @tc.desc   Test errorCode errorCode.INVALID_PARAMETER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_errorCode_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect('-1').assertEqual(errorCode.INVALID_PARAMETER + '');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_errorCode_Static_0300
     * @tc.number SUB_Ability_AbilityBase_errorCode_Static_0300
     * @tc.desc   Test errorCode errorCode.ABILITY_NOT_FOUND.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_errorCode_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect('-2').assertEqual(errorCode.ABILITY_NOT_FOUND + '');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_errorCode_Static_0400
     * @tc.number SUB_Ability_AbilityBase_errorCode_Static_0400
     * @tc.desc   Test errorCode errorCode.PERMISSION_DENY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_errorCode_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect('-3').assertEqual(errorCode.PERMISSION_DENY + '');
      done();
    })
  })
}
