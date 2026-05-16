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

export default function BuiltinsBigIntOperatorModuleTest(): void {
  describe("BuiltinsBigIntOperatorModuleTest", () => {
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
     * @tc.name    builtinsBigIntOperatorModuleTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_MODULE_TEST_0100
     * @tc.desc    Verify operatorModule with BigInt(0xdecafafecacefade) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorModuleTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("0xdecafafecacefade");
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorModule(bigInt2);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorModuleTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_MODULE_TEST_0200
     * @tc.desc    Verify operatorModule with BigInt(9007199254740991n) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorModuleTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(9007199254740991);
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorModule(bigInt2);

      expect(result.positive()).assertTrue();
      expect(result.equals(new BigInt(91))).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorModuleTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_MODULE_TEST_0300
     * @tc.desc    Verify operatorModule with simple positive integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntOperatorModuleTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt1 = new BigInt(60);
      const bigInt2 = new BigInt(20);
      
      const result = bigInt1.operatorModule(bigInt2);
      const expected = new BigInt(0);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorModuleTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_MODULE_TEST_0400
     * @tc.desc    Verify operatorModule with negative integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorModuleTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(-60);
      const bigInt2 = new BigInt(20);
      
      const result = bigInt1.operatorModule(bigInt2);
      const expected = new BigInt(0);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorModuleTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_MODULE_TEST_0500
     * @tc.desc    Verify operatorModule with non-exact division
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorModuleTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(65);
      const bigInt2 = new BigInt(20);
      
      const result = bigInt1.operatorModule(bigInt2);
      const expected = new BigInt(5);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorModuleTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_MODULE_TEST_0600
     * @tc.desc    Verify operatorModule with mixed sign integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorModuleTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(60);
      const bigInt2 = new BigInt(-20);
      
      const result = bigInt1.operatorModule(bigInt2);
      const expected = new BigInt(0);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorModuleTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_MODULE_TEST_0700
     * @tc.desc    Verify operatorModule with BigInt(0xdecafafecacefade) and one
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorModuleTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      const one = new BigInt(1);
      
      const result = bigInt.operatorModule(one);
      const expected = new BigInt(0);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorModuleTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_MODULE_TEST_0800
     * @tc.desc    Verify operatorModule with BigInt(9007199254740991n) and one
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorModuleTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(9007199254740991);
      const one = new BigInt(1);
      
      const result = bigInt.operatorModule(one);
      const expected = new BigInt(0);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorModuleTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_MODULE_TEST_0900
     * @tc.desc    Verify operatorModule with exact division
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorModuleTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(100);
      const bigInt2 = new BigInt(10);
      
      const result = bigInt1.operatorModule(bigInt2);
      const expected = new BigInt(0);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorModuleTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_MODULE_TEST_1000
     * @tc.desc    Verify operatorModule with non-exact division
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorModuleTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(100);
      const bigInt2 = new BigInt(30);
      
      const result = bigInt1.operatorModule(bigInt2);
      const expected = new BigInt(10);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorModuleTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_MODULE_TEST_1100
     * @tc.desc    Verify operatorModule with large positive BigInt values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorModuleTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("1000000000000000000000000");
      const bigInt2 = new BigInt("1000000");
      
      const result = bigInt1.operatorModule(bigInt2);
      const expected = new BigInt(0);
      
      expect(result.equals(expected)).assertTrue();
    });
  });
}
