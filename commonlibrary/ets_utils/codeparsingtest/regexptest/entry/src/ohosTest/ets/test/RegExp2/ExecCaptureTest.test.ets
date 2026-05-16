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

class ExecCapture {
  static matchOrdinary(input: string): RegExpExecArray | null {
    const re = /(\d{4})-(\d{2})-(\d{2})/;
    return re.exec(input);
  }

  static matchNested(input: string): RegExpExecArray | null {
    const re = /((\d{4})-(\d{2}))-(\d{2})/;
    return re.exec(input);
  }

  static matchNamed(input: string): RegExpExecArray | null {
    const re = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;
    return re.exec(input);
  }

  static matchNonCapture(input: string): RegExpExecArray | null {
    const re = /(?:\d{4})-(?:\d{2})-(\d{2})/;
    return re.exec(input);
  }

  static matchOptional(input: string): RegExpExecArray | null {
    const re = /hello(\s+world)?/;
    return re.exec(input);
  }

  static matchMixed(input: string): RegExpExecArray | null {
    const re = /(?<name>\w+)\s+(\d+)/;
    return re.exec(input);
  }
}

export default function execCaptureTest() {
  describe('Exec_Capture_Group_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec ordinary numbered capture groups for date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecCapture.matchOrdinary("2024-03-27");
      expect(result?.[0]).assertEqual("2024-03-27");
      expect(result?.[1]).assertEqual("2024");
      expect(result?.[2]).assertEqual("03");
      expect(result?.[3]).assertEqual("27");
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec nested capture groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecCapture.matchNested("2024-03-27");
      expect(result?.[0]).assertEqual("2024-03-27");
      expect(result?.[1]).assertEqual("2024-03");
      expect(result?.[2]).assertEqual("2024");
      expect(result?.[3]).assertEqual("03");
      expect(result?.[4]).assertEqual("27");
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0300
     * @tc.desc   Test RegExp.prototype.exec named capture groups year month day
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecCapture.matchNamed("2024-03-27");
      expect(result?.groups?.year).assertEqual("2024");
      expect(result?.groups?.month).assertEqual("03");
      expect(result?.groups?.day).assertEqual("27");
    });

    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0400
     * @tc.desc   Test RegExp.prototype.exec non-capturing groups with one capture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecCapture.matchNonCapture("2024-03-27");
      expect(result?.[0]).assertEqual("2024-03-27");
      expect(result?.[1]).assertEqual("27");
    });

    /**
     * @tc.name testExec0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0500
     * @tc.desc   Test RegExp.prototype.exec optional capture group (\\s+world)?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecCapture.matchOptional("hello");
      const result2 = ExecCapture.matchOptional("hello world");
      expect(result1?.[1]).assertUndefined();
      expect(result2?.[1]).assertEqual(" world");
    });

    /**
     * @tc.name testExec0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0600
     * @tc.desc   Test RegExp.prototype.exec mixed named and numbered capture groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecCapture.matchMixed("John 25");
      expect(result?.groups?.name).assertEqual("John");
      expect(result?.[2]).assertEqual("25");
    });
  });
}
