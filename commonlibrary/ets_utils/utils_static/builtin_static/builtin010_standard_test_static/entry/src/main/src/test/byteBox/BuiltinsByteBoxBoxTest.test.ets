/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsByteBoxBoxText() {
  describe("builtinsByteBoxBoxText", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name    builtinsByteBoxBoxText0001
     * @tc.number  BUILTINS_BYTE_BOX_BOX_TEXT_0001
     * @tc.desc    Test ByteBox.box method with minimum value -128
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxBoxText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ByteBox.box(-128);
      const result: byte = box.get();
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.name    builtinsByteBoxBoxText0002
     * @tc.number  BUILTINS_BYTE_BOX_BOX_TEXT_0002
     * @tc.desc    Test ByteBox.box method with maximum value 127
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxBoxText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ByteBox.box(127);
      const result: byte = box.get();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.name    builtinsByteBoxBoxText0003
     * @tc.number  BUILTINS_BYTE_BOX_BOX_TEXT_0003
     * @tc.desc    Test ByteBox.box method with underflow value -129
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxBoxText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const underflowValue: number = -129;
      try {
        const byteValue: byte = underflowValue.toByte();
        const box = ByteBox.box(byteValue);
        const result: byte = box.get();
        expect(result).assertEqual(127);
      } catch (error) {
        console.log(`Box underflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsByteBoxBoxText0004
     * @tc.number  BUILTINS_BYTE_BOX_BOX_TEXT_0004
     * @tc.desc    Test ByteBox.box method with overflow value 128
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxBoxText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const overflowValue: number = 128;
      try {
        const byteValue: byte = overflowValue.toByte();
        const box = ByteBox.box(byteValue);
        const result: byte = box.get();
        expect(result).assertEqual(-128);
      } catch (error) {
        console.log(`Box overflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsByteBoxBoxText0005
     * @tc.number  BUILTINS_BYTE_BOX_BOX_TEXT_0005
     * @tc.desc    Test ByteBox.box method with 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxBoxText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ByteBox.box(0);
      const result: byte = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    builtinsByteBoxBoxText0006
     * @tc.number  BUILTINS_BYTE_BOX_BOX_TEXT_0006
     * @tc.desc    Test ByteBox.box method with -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxBoxText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ByteBox.box(-1);
      const result: byte = box.get();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsByteBoxBoxText0007
     * @tc.number  BUILTINS_BYTE_BOX_BOX_TEXT_0007
     * @tc.desc    Test ByteBox.box method with 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxBoxText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = ByteBox.box(1);
      const result: byte = box.get();
      expect(result).assertEqual(1);
    });

  })
}