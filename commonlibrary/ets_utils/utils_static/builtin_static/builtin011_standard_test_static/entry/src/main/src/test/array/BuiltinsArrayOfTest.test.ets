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

export default function BuiltinsArrayOfTest(): void {
  describe('BuiltinsArrayOfTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name    builtinsArrayOfTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_OF_TEST_0100
     * @tc.desc    Verify of with empty arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayOfTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = Array.of<number>();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayOfTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_OF_TEST_0200
     * @tc.desc    Verify of with single number argument
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayOfTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = Array.of<number>(10);
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.name    builtinsArrayOfTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_OF_TEST_0300
     * @tc.desc    Verify of with multiple number arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayOfTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = Array.of<number>(1, 2, 3, 4, 5);
      expect(result.length).assertEqual(5);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(3);
      expect(result.$_get(3)).assertEqual(4);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayOfTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_OF_TEST_0400
     * @tc.desc    Verify of with single string argument
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayOfTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.of<string>('hello');
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual('hello');
    });

    /**
     * @tc.name    builtinsArrayOfTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_OF_TEST_0500
     * @tc.desc    Verify of with multiple string arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayOfTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.of<string>('apple', 'banana', 'cherry');
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual('apple');
      expect(result.$_get(1)).assertEqual('banana');
      expect(result.$_get(2)).assertEqual('cherry');
    });

    /**
     * @tc.name    builtinsArrayOfTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_OF_TEST_0600
     * @tc.desc    Verify of with boolean arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayOfTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.of<boolean>(true, false, true);
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(true);
      expect(result.$_get(1)).assertEqual(false);
      expect(result.$_get(2)).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayOfTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_OF_TEST_0700
     * @tc.desc    Verify of with mixed type arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayOfTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.of<number>(1, 2, 3);
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayOfTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_OF_TEST_0800
     * @tc.desc    Verify of with null argument
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayOfTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.of<number>(0);
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayOfTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_OF_TEST_0900
     * @tc.desc    Verify of with undefined argument
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayOfTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.of<number>(0);
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayOfTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_OF_TEST_1000
     * @tc.desc    Verify of with zero arguments
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayOfTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.of<number>();
      expect(result.length).assertEqual(0);
    });
  });
}