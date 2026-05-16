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

class ExecBoundary {
  static execTest(input: string): RegExpExecArray | null {
    return /test/.exec(input);
  }

  static execThreeDigits(input: string): RegExpExecArray | null {
    return /123/.exec(input);
  }
}

export default function execBoundaryTest(): void {
  describe('Exec_Boundary_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BOUNDARY_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec word boundary \\b and non-word boundary \\B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const r1: RegExpExecArray | null = /\b/.exec('abc');
      expect(r1?.index).assertEqual(0);

      const r2: RegExpExecArray | null = /\B/.exec('abc');
      expect(r2?.index).assertEqual(1);
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BOUNDARY_TEST_0200
     * @tc.desc   Test exec helper for literal /test/ and /123/ patterns and index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const t = ExecBoundary.execTest('my test string');
      expect(t?.[0]).assertEqual('test');
      expect(t?.index).assertEqual(3);
      const n = ExecBoundary.execThreeDigits('id:123');
      expect(n?.[0]).assertEqual('123');
      expect(n?.index).assertEqual(3);
    });
  });
}
