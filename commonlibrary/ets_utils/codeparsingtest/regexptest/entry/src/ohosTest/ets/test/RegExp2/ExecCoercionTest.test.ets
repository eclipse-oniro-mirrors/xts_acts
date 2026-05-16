/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  execCoercesNullToString,
  execCoercesUndefinedToString,
  execCoercesNumberToString,
  execCoercesObjectWithToString,
  execObjectCreateNullThrowsTypeError
} from './RegExpHelper';

export default function execCoercionTest() {
  describe('Exec__Input_Coercion', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_COERCION_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec coerces null argument to string "null"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(execCoercesNullToString()).assertTrue();
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_COERCION_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec coerces undefined argument to string "undefined"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(execCoercesUndefinedToString()).assertTrue();
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_COERCION_TEST_0300
     * @tc.desc   Test RegExp.prototype.exec coerces number argument via ToString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(execCoercesNumberToString()).assertTrue();
    });

    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_COERCION_TEST_0400
     * @tc.desc   Test RegExp.prototype.exec coerces object with toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(execCoercesObjectWithToString()).assertTrue();
    });

    /**
     * @tc.name testExec0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_COERCION_TEST_0500
     * @tc.desc   Test RegExp.prototype.exec throws TypeError for Object.create(null) without toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(execObjectCreateNullThrowsTypeError()).assertTrue();
    });
  });
}
