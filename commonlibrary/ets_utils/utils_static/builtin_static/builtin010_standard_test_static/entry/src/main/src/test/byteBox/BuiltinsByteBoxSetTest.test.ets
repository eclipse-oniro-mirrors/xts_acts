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

export default function builtinsByteBoxSetText() {
  describe("builtinsByteBoxSetText", () => {
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
     * @tc.name    builtinsByteBoxSetText0001
     * @tc.number  BUILTINS_BYTE_BOX_SET_TEXT_0001
     * @tc.desc    Test ByteBox set method returns minimum value -128
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxSetText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox();
      const setResult: byte = box.set(-128);
      expect(setResult).assertEqual(-128);
    });

    /**
     * @tc.name    builtinsByteBoxSetText0002
     * @tc.number  BUILTINS_BYTE_BOX_SET_TEXT_0002
     * @tc.desc    Test ByteBox set method returns maximum value 127
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxSetText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox();
      const setResult: byte = box.set(127);
      expect(setResult).assertEqual(127);
    });

    /**
     * @tc.name    builtinsByteBoxSetText0003
     * @tc.number  BUILTINS_BYTE_BOX_SET_TEXT_0003
     * @tc.desc    Test ByteBox set method with underflow value -129
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxSetText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox();
      const underflowValue: number = -129;
      try {
        const byteValue: byte = underflowValue.toByte();
        const setResult: byte = box.set(byteValue);
        expect(setResult).assertEqual(127);
      } catch (error) {
        console.log(`Set underflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsByteBoxSetText0004
     * @tc.number  BUILTINS_BYTE_BOX_SET_TEXT_0004
     * @tc.desc    Test ByteBox set method with overflow value 128
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxSetText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox();
      const overflowValue: number = 128;
      try {
        const byteValue: byte = overflowValue.toByte();
        const setResult: byte = box.set(byteValue);
        expect(setResult).assertEqual(-128);
      } catch (error) {
        console.log(`Set overflow error: ${error.message}`);
      }
    });

    /**
     * @tc.name    builtinsByteBoxSetText0005
     * @tc.number  BUILTINS_BYTE_BOX_SET_TEXT_0005
     * @tc.desc    Test ByteBox set method returns 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxSetText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox();
      const setResult: byte = box.set(0);
      expect(setResult).assertEqual(0);
    });

    /**
     * @tc.name    builtinsByteBoxSetText0006
     * @tc.number  BUILTINS_BYTE_BOX_SET_TEXT_0006
     * @tc.desc    Test ByteBox set method returns -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxSetText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox();
      const setResult: byte = box.set(-1);
      expect(setResult).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsByteBoxSetText0007
     * @tc.number  BUILTINS_BYTE_BOX_SET_TEXT_0007
     * @tc.desc    Test ByteBox set method returns 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsByteBoxSetText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new ByteBox();
      const setResult: byte = box.set(1);
      expect(setResult).assertEqual(1);
    });

  })
}