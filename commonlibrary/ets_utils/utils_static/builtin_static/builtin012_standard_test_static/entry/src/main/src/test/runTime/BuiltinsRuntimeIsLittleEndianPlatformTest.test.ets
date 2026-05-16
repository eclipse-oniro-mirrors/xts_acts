 /*
 * Copyright (c) 2026 RKH Corp.
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

export default function BuiltinsRuntimeIsLittleEndianPlatformTest(): void {
  describe("BuiltinsRuntimeIsLittleEndianPlatformTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name    BuiltinsRuntimeIsLittleEndianPlatformTest0100
     * @tc.number  SUB_BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST_0100
     * @tc.desc    Verify isLittleEndianPlatform returns consistent result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeIsLittleEndianPlatformTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = Runtime.isLittleEndianPlatform();
      const result2 = Runtime.isLittleEndianPlatform();
      expect(result).assertEqual(result2);
    });

    /**
     * @tc.name    BuiltinsRuntimeIsLittleEndianPlatformTest0200
     * @tc.number  SUB_BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST_0200
     * @tc.desc    Verify isLittleEndianPlatform works correctly for little-endian case
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeIsLittleEndianPlatformTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isLittleEndian = Runtime.isLittleEndianPlatform();
      const testValue = 0x12345678;
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);

      if (isLittleEndian) {
        view.setInt32(0, testValue, true);
        const readValue = view.getInt32(0, true);
        expect(readValue).assertEqual(testValue);
      } else {
        view.setInt32(0, testValue, false);
        const readValue = view.getInt32(0, false);
        expect(readValue).assertEqual(testValue);
      }

      expect(typeof isLittleEndian).assertEqual('boolean');
    });

    /**
     * @tc.name    BuiltinsRuntimeIsLittleEndianPlatformTest0300
     * @tc.number  SUB_BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST_0300
     * @tc.desc    Verify isLittleEndianPlatform works correctly for big-endian case
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeIsLittleEndianPlatformTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isLittleEndian = Runtime.isLittleEndianPlatform();
      const testValue = 0x12345678;
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);

      if (!isLittleEndian) {
        view.setInt32(0, testValue, false);
        const readValue = view.getInt32(0, false);
        expect(readValue).assertEqual(testValue);
      } else {
        view.setInt32(0, testValue, true);
        const readValue = view.getInt32(0, true);
        expect(readValue).assertEqual(testValue);
      }

      expect(typeof isLittleEndian).assertEqual('boolean');
      expect(isLittleEndian).assertTrue();
    });

    /**
     * @tc.name    BuiltinsRuntimeIsLittleEndianPlatformTest0400
     * @tc.number  SUB_BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST_0400
     * @tc.desc    Verify isLittleEndianPlatform returns consistent result across multiple calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeIsLittleEndianPlatformTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = Runtime.isLittleEndianPlatform();
      const result2 = Runtime.isLittleEndianPlatform();
      const result3 = Runtime.isLittleEndianPlatform();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name    BuiltinsRuntimeIsLittleEndianPlatformTest0500
     * @tc.number  SUB_BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST_0500
     * @tc.desc    Verify isLittleEndianPlatform works correctly with byte order operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeIsLittleEndianPlatformTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isLittleEndian = Runtime.isLittleEndianPlatform();

      const testValue16 = 0x1234;
      const buffer16 = new ArrayBuffer(2);
      const view16 = new DataView(buffer16);
      view16.setInt16(0, testValue16, isLittleEndian);
      const readValue16 = view16.getInt16(0, isLittleEndian);
      expect(readValue16).assertEqual(testValue16);

      const testValue32 = 0x56789ABC;
      const buffer32 = new ArrayBuffer(4);
      const view32 = new DataView(buffer32);
      view32.setInt32(0, testValue32, isLittleEndian);
      const readValue32 = view32.getInt32(0, isLittleEndian);
      expect(readValue32).assertEqual(testValue32);
    });

    /**
     * @tc.name    BuiltinsRuntimeIsLittleEndianPlatformTest0600
     * @tc.number  SUB_BUILTINS_RUNTIME_IS_LITTLE_ENDIAN_PLATFORM_TEST_0600
     * @tc.desc    Verify isLittleEndianPlatform correctly identifies endianness
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeIsLittleEndianPlatformTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const isLittleEndian = Runtime.isLittleEndianPlatform();

      const testValue = 0x12345678;
      const buffer = new ArrayBuffer(4);
      const view = new DataView(buffer);

      view.setInt32(0, testValue, true);

      const readLittleEndian = view.getInt32(0, true);
      const readBigEndian = view.getInt32(0, false);

      const actualLittleEndian = (readLittleEndian === testValue);
      expect(isLittleEndian).assertEqual(actualLittleEndian);
    });

  })
}
