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

export default function BuiltinsBigIntOperatorAddTest(): void {
  describe("BuiltinsBigIntOperatorAddTest", () => {
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
     * @tc.name    builtinsBigIntOperatorAddTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_ADD_TEST_0100
     * @tc.desc    Verify operatorAdd with BigInt(0xdecafafecacefade) and BigInt(0x1fffffffffffff)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorAddTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = BigInt("0xdecafafecacefade");
      const bigInt2 = BigInt("0x1fffffffffffff");
      const result = bigInt1.operatorAdd(bigInt2)
      const expected = BigInt("0xdecb1afecacefadd");
      expect(result === expected).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntOperatorAddTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_ADD_TEST_0200
     * @tc.desc    Verify operatorAdd with BigInt(9007199254740991n) and itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorAddTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("9007199254740991");
      const result = bigInt.operatorAdd(bigInt);
      const expected = new BigInt("18014398509481982");
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorAddTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_ADD_TEST_0300
     * @tc.desc    Verify operatorAdd with BigInt(0xdecafafecacefade) and zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorAddTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      const zero = new BigInt(0);
      
      const result = bigInt.operatorAdd(zero);
      
      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorAddTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_ADD_TEST_0400
     * @tc.desc    Verify operatorAdd with BigInt(9007199254740991n) and zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorAddTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("9007199254740991");
      const zero = new BigInt(0);
      
      const result = bigInt.operatorAdd(zero);
      
      expect(result.equals(bigInt)).assertTrue();
    });
  });
}