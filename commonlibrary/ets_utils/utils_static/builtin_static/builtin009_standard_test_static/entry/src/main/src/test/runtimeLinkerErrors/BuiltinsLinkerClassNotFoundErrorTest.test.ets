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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsLinkerClassNotFoundErrorTest() {
  describe('builtinsLinkerClassNotFoundErrorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
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
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0001
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0001
     * @tc.desc    Test constructor with no arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerClassNotFoundError();
      expect(error.name).assertEqual('LinkerClassNotFoundError');
      expect(error.message).assertEqual('');
    });

    /**
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0002
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0002
     * @tc.desc    Test constructor with a simple message string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerClassNotFoundError('Class com.example.MyClass not found');
      expect(error.name).assertEqual('LinkerClassNotFoundError');
      expect(error.message).assertEqual('Class com.example.MyClass not found');
    });

    /**
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0003
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0003
     * @tc.desc    Test constructor with an empty message string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerClassNotFoundError('');
      expect(error.name).assertEqual('LinkerClassNotFoundError');
      expect(error.message).assertEqual('');
    });

    /**
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0004
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0004
     * @tc.desc    Test constructor with a message containing special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialMsg = 'Class "com.example.MyClass<Test>" not found!';
      const error = new LinkerClassNotFoundError(specialMsg);
      expect(error.name).assertEqual('LinkerClassNotFoundError');
      expect(error.message).assertEqual(specialMsg);
    });

    /**
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0005
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0005
     * @tc.desc    Test constructor with options (cause) parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cause = new Error('Underlying cause');
      const error = new LinkerClassNotFoundError('Class not found', { cause });
      expect(error.name).assertEqual('LinkerClassNotFoundError');
      expect(error.message).assertEqual('Class not found');
      expect(error.cause).assertEqual(cause);
    });

    /**
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0006
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0006
     * @tc.desc    Test constructor with both message and empty options
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerClassNotFoundError('Class not found', {});
      expect(error.name).assertEqual('LinkerClassNotFoundError');
      expect(error.message).assertEqual('Class not found');
      expect(error.cause).assertUndefined();
    });

    /**
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0007
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0007
     * @tc.desc    Test constructor with options only (no message)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cause = new Error('Root cause');
      const error = new LinkerClassNotFoundError(undefined, { cause });
      expect(error.name).assertEqual('LinkerClassNotFoundError');
      expect(error.message).assertEqual('');
      expect(error.cause).assertEqual(cause);
    });

    /**
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0008
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0008
     * @tc.desc    Test constructor with long message string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longMsg = 'Class ' + 'com.example.' + 'a'.repeat(100) + ' not found due to linker resolution failure';
      const error = new LinkerClassNotFoundError(longMsg);
      expect(error.name).assertEqual('LinkerClassNotFoundError');
      expect(error.message).assertEqual(longMsg);
    });

    /**
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0009
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0009
     * @tc.desc    Test that error instance is throwable and catchable
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        throw new LinkerClassNotFoundError('Test error');
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
        expect(error.name).assertEqual('LinkerClassNotFoundError');
        expect(error.message).assertEqual('Test error');
      }
    });

    /**
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0010
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0010
     * @tc.desc    Test error inheritance chain
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerClassNotFoundError();
      expect(error instanceof LinkerClassNotFoundError).assertTrue();

      expect(error instanceof Error).assertTrue();
    });

    /**
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0011
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0011
     * @tc.desc    Test error properties (stack trace)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerClassNotFoundError('Test');
      expect(typeof error.stack).assertEqual('string');
      expect(error.stack?.includes('LinkerClassNotFoundError')).assertTrue();
    });

    /**
     * @tc.name    builtinsLinkerClassNotFoundErrorTest0012
     * @tc.number  BUILTINS_LINKER_CLASS_NOT_FOUND_ERROR_TEST_0012
     * @tc.desc    Test error with nested cause chain
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsLinkerClassNotFoundErrorTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const rootCause = new Error('Root error');
      const middleError = new LinkerClassNotFoundError('Middle error', { cause: rootCause });
      const topError = new LinkerClassNotFoundError('Top error', { cause: middleError });

      expect(topError.cause).assertEqual(middleError);
      expect(middleError.cause).assertEqual(rootCause);
    });

  })
}
