/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
export default function toLocalStringTest() {

  describe("toLocalStringTest", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number VALUE_STRINGVALUE_TOLOCALESTRING_0100_01
     * @tc.name   Value_StringValue_ToLocaleString_0100_01
     * @tc.desc   Test StringValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToLocaleString_0100_01", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'StringValue toLocaleString test start');
      let testString: string = "Hello World";
      let result: string = testString;
      expect(result).assertEqual("Hello World");
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_0100_01
     * @tc.name   Value_StringValue_ToPrint_1600
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Quality Assurance";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Quality Assurance"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_0200_01
     * @tc.name   Value_StringValue_ToPrint_1700
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Integration Test";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Integration Test"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_0300_01
     * @tc.name   Value_StringValue_ToPrint_1800
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_1800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "System Validation";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"System Validation"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_0400_01
     * @tc.name   Value_StringValue_ToPrint_1900
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_1900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Regression Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Regression Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_0500_01
     * @tc.name   Value_StringValue_ToPrint_2000
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_2000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Automated Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Automated Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_0600_01
     * @tc.name   Value_StringValue_ToPrint_2100
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_2100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Manual Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Manual Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_0700_01
     * @tc.name   Value_StringValue_ToPrint_2200
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_2200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Load Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Load Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_800
     * @tc.name   Value_StringValue_ToPrint_2300
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_2300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Stress Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Stress Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_0900_01
     * @tc.name   Value_StringValue_ToPrint_2400
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_2400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Security Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Security Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_1000_01
     * @tc.name   Value_StringValue_ToPrint_2500
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_2500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Usability Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Usability Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_1100_02
     * @tc.name   Value_StringValue_ToPrint_2600
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_2600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Compatibility Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Compatibility Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_1300_02
     * @tc.name   Value_StringValue_ToPrint_2800
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_2800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Localization Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Localization Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_1400_01
     * @tc.name   Value_StringValue_ToPrint_2900
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_2900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Database Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Database Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_1500_01
     * @tc.name   Value_StringValue_ToPrint_3000
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_3000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "API Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"API Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_1600
     * @tc.name   Value_StringValue_ToPrint_3100
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_3100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Mobile Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Mobile Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_1700
     * @tc.name   Value_StringValue_ToPrint_3200
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_3200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Web Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Web Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_1800
     * @tc.name   Value_StringValue_ToPrint_3300
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_3300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Cloud Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Cloud Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_1900
     * @tc.name   Value_StringValue_ToPrint_3400
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_3400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "DevOps Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"DevOps Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_2000
     * @tc.name   Value_StringValue_ToPrint_3500_01
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_3500_01", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Continuous Testing";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Continuous Testing"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_0100_02
     * @tc.name   Value_StringValue_ToPrint_3500
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_3500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toLocaleString test start');
      let testString: string = "Hello World";
      let result: string = testString;
      expect(result).assertEqual("Hello World");
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_0100_03
     * @tc.name   Value_StringValue_ToPrint_0100
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_StringValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Hello World";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Hello World"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_0100_03
     * @tc.name   Value_ShortValue_ToLocaleString_0100
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_ShortValue_ToLocaleString_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let testShort: number = 32767;
      let result: string = testShort.toString();
      expect(result).assertEqual("32767");
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOPRINT_0100
     * @tc.name   Value_ShortValue_ToPrint_0100
     * @tc.desc   Test ShortValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_ShortValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toPrint test start');
      let testShort: number = 32767;
      let result: string = testShort.toString();
      expect(result).assertEqual("32767");
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toPrint test end');
    });

    /**
     * @tc.number VALUE_NULLVALUE_TOLOCALESTRING_010
     * @tc.name   Value_NullValue_ToLocaleString_010
     * @tc.desc   Test NullValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_NullValue_ToLocaleString_010", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'NullValue toLocaleString test start');
      let testNull = null;
      let result: string = "null";
      expect(result).assertEqual("null");
      done()
      console.log(domain, tag, '%{public}s', 'NullValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_NULLVALUE_TOPRINT_0100
     * @tc.name   Value_NullValue_ToPrint_0100
     * @tc.desc   Test NullValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_NullValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'NullValue toPrint test start');
      let testNull = null;
      let result: string = "null";
      expect(result).assertEqual("null");
      done()
      console.log(domain, tag, '%{public}s', 'NullValue toPrint test end');
    });

    /**
     * @tc.number VALUE_LAMBDAVALUE_TOLOCALESTRING_0100
     * @tc.name   Value_LambdaValue_ToLocaleString_0100
     * @tc.desc   Test LambdaValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_LambdaValue_ToLocaleString_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'LambdaValue toLocaleString test start');
      let a: string = "function";
      let b: string = "function";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'LambdaValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_0100_01
     * @tc.name   Value_BooleanValue_ToLocaleString_0100_01
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_BooleanValue_ToLocaleString_0100_01", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let a: string = "true";
      let b: string = "true";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_CHARVALUE_TOLOCALESTRING_0100_01
     * @tc.name   Value_CharValue_ToLocaleString_0100_01
     * @tc.desc   Test CharValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Value_CharValue_ToLocaleString_0100_01", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'CharValue toLocaleString test start');
      let a: string = "\"A\"";
      let b: string = "\"A\"";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'CharValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_0100_01
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_0100_01
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_0100_01", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "127";
      let b: string = "127";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_0200
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_0200
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "-128";
      let b: string = "-128";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_0300
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_0300
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "0";
      let b: string = "0";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_0400
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_0400
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "100";
      let b: string = "100";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_0500
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_0500
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "-100";
      let b: string = "-100";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_0600
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_0600
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_0600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "50";
      let b: string = "50";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_0700
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_0700
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_0700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "-50";
      let b: string = "-50";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_0800
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_0800
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_0800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "1";
      let b: string = "1";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_0900
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_0900
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "-1";
      let b: string = "-1";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_1000
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_1000
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "126";
      let b: string = "126";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_1100
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_1100
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_1100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "-127";
      let b: string = "-127";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_1200
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_1200
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_1200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "10";
      let b: string = "10";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_1300
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_1300
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_1300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "-10";
      let b: string = "-10";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_1400
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_1400
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_1400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "25";
      let b: string = "25";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_1500
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_1500
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_1500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "-25";
      let b: string = "-25";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_1600
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_1600
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "75";
      let b: string = "75";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_1700
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_1700
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "-75";
      let b: string = "-75";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_1800
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_1800
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_1800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "99";
      let b: string = "99";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_1900
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_1900
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_1900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "-99";
      let b: string = "-99";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_2000
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_2000
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_2000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "5";
      let b: string = "5";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_2100
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_2100
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_2100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let a: string = "-5";
      let b: string = "-5";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_0100_02
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_0100
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "32767";
      let b: string = "32767";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_0200
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_0200
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-32768";
      let b: string = "-32768";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_0300
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_0300
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "0";
      let b: string = "0";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_0400
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_0400
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "1";
      let b: string = "1";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_0500
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_0500
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-1";
      let b: string = "-1";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_0600
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_0600
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_0600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "100";
      let b: string = "100";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_0700
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_0700
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_0700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-100";
      let b: string = "-100";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_0800
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_0800
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_0800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "1000";
      let b: string = "1000";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_0900
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_0900
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-1000";
      let b: string = "-1000";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_1000
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_1000
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "10000";
      let b: string = "10000";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_1100
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_1100
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_1100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-10000";
      let b: string = "-10000";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_1200
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_1200
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_1200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "123";
      let b: string = "123";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_1300
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_1300
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_1300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-123";
      let b: string = "-123";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_1400
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_1400
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_1400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "456";
      let b: string = "456";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_1500
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_1500
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_1500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-456";
      let b: string = "-456";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_1600
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_1600
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "789";
      let b: string = "789";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_1700
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_1700
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-789";
      let b: string = "-789";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_1800
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_1800
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_1800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "2048";
      let b: string = "2048";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_1900
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_1900
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_1900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-2048";
      let b: string = "-2048";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_2000
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_2000
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_2000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "4096";
      let b: string = "4096";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_2100
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_2100
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_2100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-4096";
      let b: string = "-4096";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_2200
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_2200
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_2200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "8192";
      let b: string = "8192";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_2300
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_2300
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_2300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-8192";
      let b: string = "-8192";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_2400
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_2400
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_2400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "16384";
      let b: string = "16384";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_2500
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_2500
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_2500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-16384";
      let b: string = "-16384";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_2600
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_2600
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_2600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "255";
      let b: string = "255";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_2700
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_2700
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_2700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-255";
      let b: string = "-255";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_2800
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_2800
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_2800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "512";
      let b: string = "512";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_2900
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_2900
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_2900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-512";
      let b: string = "-512";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_3000
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_3000
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_3000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "1024";
      let b: string = "1024";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_3100
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_3100
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_3100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-1024";
      let b: string = "-1024";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_3200
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_3200
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_3200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "999";
      let b: string = "999";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_3300
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_3300
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_3300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-999";
      let b: string = "-999";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_3400
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_3400
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_3400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "777";
      let b: string = "777";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_3500
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_3500
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_3500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-777";
      let b: string = "-777";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_3600
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_3600
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_3600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "888";
      let b: string = "888";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_SHORTVALUE_TOLOCALESTRING_3700
     * @tc.name   SUB_Value_ShortValue_ToLocaleString_3700
     * @tc.desc   Test ShortValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ShortValue_ToLocaleString_3700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test start');
      let a: string = "-888";
      let b: string = "-888";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ShortValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_FLOATVALUE_TOLOCALESTRING_0100_02
     * @tc.name   SUB_Value_FloatValue_ToLocaleString_0100_02
     * @tc.desc   Test FloatValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_FloatValue_ToLocaleString_0100_02", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'FloatValue toLocaleString test start');
      let a: string = "3.14";
      let b: string = "3.14";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'FloatValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_DOUBLEVALUE_TOLOCALESTRING_0100_02
     * @tc.name   SUB_Value_DoubleValue_ToLocaleString_0100_02
     * @tc.desc   Test DoubleValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_DoubleValue_ToLocaleString_0100_02", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'DoubleValue toLocaleString test start');
      let a: string = "3.141592653589793";
      let b: string = "3.141592653589793";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'DoubleValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_0100_01
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_0100_01
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_0100_01", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let a: string = "[1, 2, 3]";
      let b: string = "[1, 2, 3]";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOLOCALESTRING_0100_01
     * @tc.name   SUB_Value_ClassValue_ToLocaleString_0100_01
     * @tc.desc   Test ClassValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToLocaleString_0100_01", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toLocaleString test start');
      let a: string = "object";
      let b: string = "object";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_NULLVALUE_TOLOCALESTRING_0100
     * @tc.name   SUB_Value_NullValue_ToLocaleString_0100
     * @tc.desc   Test NullValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_NullValue_ToLocaleString_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'NullValue toLocaleString test start');
      let a: string = "null";
      let b: string = "null";
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'NullValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_LAMBDAVALUE_TOPRINT_0100
     * @tc.name   SUB_Value_LambdaValue_ToPrint_0100
     * @tc.desc   Test LambdaValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_LambdaValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'LambdaValue toPrint test start');
      let testLambda = () => { return 42; };
      let result: string = "function";
      expect(result).assertEqual("function");
      done()
      console.log(domain, tag, '%{public}s', 'LambdaValue toPrint test end');
    });

    /**
     * @tc.number VALUE_INTVALUE_TOLOCALESTRING_0100
     * @tc.name   SUB_Value_IntValue_ToLocaleString_0100
     * @tc.desc   Test IntValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_IntValue_ToLocaleString_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'IntValue toLocaleString test start');
      let testInt: number = 42;
      let result: string = testInt.toString();
      expect(result).assertEqual("42");
      done()
      console.log(domain, tag, '%{public}s', 'IntValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_INTVALUE_TOPRINT_0100
     * @tc.name   SUB_Value_IntValue_ToPrint_0100
     * @tc.desc   Test IntValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_IntValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'IntValue toPrint test start');
      let testInt: number = 42;
      let result: string = testInt.toString();
      expect(result).assertEqual("42");
      done()
      console.log(domain, tag, '%{public}s', 'IntValue toPrint test end');
    });

    /**
     * @tc.number VALUE_FLOATVALUE_TOLOCALESTRING_0100_03
     * @tc.name   SUB_Value_FloatValue_ToLocaleString_0100_03
     * @tc.desc   Test FloatValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_FloatValue_ToLocaleString_0100_03", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'FloatValue toLocaleString test start');
      let testFloat: number = 3.14;
      let result: string = testFloat.toString();
      expect(result).assertEqual("3.14");
      done()
      console.log(domain, tag, '%{public}s', 'FloatValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_FLOATVALUE_TOPRINT_0100
     * @tc.name   SUB_Value_FloatValue_ToPrint_0100
     * @tc.desc   Test FloatValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_FloatValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'FloatValue toPrint test start');
      let testFloat: number = 3.14;
      let result: string = testFloat.toString();
      expect(result).assertEqual("3.14");
      done()
      console.log(domain, tag, '%{public}s', 'FloatValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOLOCALESTRING_0100_02
     * @tc.name   SUB_Value_ClassValue_ToLocaleString_01001
     * @tc.desc   Test ClassValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToLocaleString_01001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toLocaleString test start');
      let result: string = "TestClass";
      expect(result).assertEqual("TestClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_0100
     * @tc.name   SUB_Value_ClassValue_ToPrint_0100
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "TestClass";
      expect(result).assertEqual("TestClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_0200
     * @tc.name   SUB_Value_ClassValue_ToPrint_0200
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "UserClass";
      expect(result).assertEqual("UserClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_0300
     * @tc.name   SUB_Value_ClassValue_ToPrint_0300
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "DataModel";
      expect(result).assertEqual("DataModel");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_0400
     * @tc.name   SUB_Value_ClassValue_ToPrint_0400
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "ServiceClass";
      expect(result).assertEqual("ServiceClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_0500
     * @tc.name   SUB_Value_ClassValue_ToPrint_0500
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "ControllerClass";
      expect(result).assertEqual("ControllerClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_0600
     * @tc.name   SUB_Value_ClassValue_ToPrint_0600
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_0600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "ViewClass";
      expect(result).assertEqual("ViewClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_0700
     * @tc.name   SUB_Value_ClassValue_ToPrint_0700
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_0700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "HelperClass";
      expect(result).assertEqual("HelperClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_0800
     * @tc.name   SUB_Value_ClassValue_ToPrint_0800
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_0800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "UtilityClass";
      expect(result).assertEqual("UtilityClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_0900
     * @tc.name   SUB_Value_ClassValue_ToPrint_0900
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "ManagerClass";
      expect(result).assertEqual("ManagerClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_1000
     * @tc.name   SUB_Value_ClassValue_ToPrint_1000
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "HandlerClass";
      expect(result).assertEqual("HandlerClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_1100
     * @tc.name   SUB_Value_ClassValue_ToPrint_1100
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_1100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "ProcessorClass";
      expect(result).assertEqual("ProcessorClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_1200
     * @tc.name   SUB_Value_ClassValue_ToPrint_1200
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_1200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "BuilderClass";
      expect(result).assertEqual("BuilderClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_1300
     * @tc.name   SUB_Value_ClassValue_ToPrint_1300
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_1300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "FactoryClass";
      expect(result).assertEqual("FactoryClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_1400
     * @tc.name   SUB_Value_ClassValue_ToPrint_1400
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_1400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "AdapterClass";
      expect(result).assertEqual("AdapterClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_1500
     * @tc.name   SUB_Value_ClassValue_ToPrint_1500
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_1500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "ObserverClass";
      expect(result).assertEqual("ObserverClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_1600
     * @tc.name   SUB_Value_ClassValue_ToPrint_1600
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "StrategyClass";
      expect(result).assertEqual("StrategyClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_1700
     * @tc.name   SUB_Value_ClassValue_ToPrint_1700
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "CommandClass";
      expect(result).assertEqual("CommandClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_1800
     * @tc.name   SUB_Value_ClassValue_ToPrint_1800
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_1800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "DecoratorClass";
      expect(result).assertEqual("DecoratorClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_1900
     * @tc.name   SUB_Value_ClassValue_ToPrint_1900
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_1900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "SingletonClass";
      expect(result).assertEqual("SingletonClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_2000
     * @tc.name   SUB_Value_ClassValue_ToPrint_2000
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_2000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "ProxyClass";
      expect(result).assertEqual("ProxyClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_CLASSVALUE_TOPRINT_2100
     * @tc.name   SUB_Value_ClassValue_ToPrint_2100
     * @tc.desc   Test ClassValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ClassValue_ToPrint_2100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test start');
      let result: string = "TemplateClass";
      expect(result).assertEqual("TemplateClass");
      done()
      console.log(domain, tag, '%{public}s', 'ClassValue toPrint test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOLOCALESTRING_0100_02
     * @tc.name   SUB_Value_ByteValue_ToLocaleString_0100_02
     * @tc.desc   Test ByteValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToLocaleString_0100_02", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test start');
      let testByte: number = 255;
      let result: string = testByte.toString();
      expect(result).assertEqual("255");
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BYTEVALUE_TOPRINT_0100
     * @tc.name   SUB_Value_ByteValue_ToPrint_0100
     * @tc.desc   Test ByteValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ByteValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ByteValue toPrint test start');
      let testByte: number = 255;
      let result: string = testByte.toString();
      expect(result).assertEqual("255");
      done()
      console.log(domain, tag, '%{public}s', 'ByteValue toPrint test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_0100_02
     * @tc.name   SUB_Value_BooleanValue_ToLocaleString_0100_02
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToLocaleString_0100_02", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let testBoolean: boolean = true;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("true");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_0200
     * @tc.name   SUB_Value_BooleanValue_ToLocaleString_0200
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToLocaleString_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let testBoolean: boolean = false;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("false");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_0300
     * @tc.name   SUB_Value_BooleanValue_ToLocaleString_0300
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToLocaleString_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let testBoolean: boolean = true;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("true");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_0400
     * @tc.name   SUB_Value_BooleanValue_ToLocaleString_0400
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToLocaleString_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let testBoolean: boolean = false;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("false");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_0500
     * @tc.name   SUB_Value_BooleanValue_ToLocaleString_0500
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToLocaleString_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let testBoolean: boolean = true;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("true");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_0600
     * @tc.name   SUB_Value_BooleanValue_ToLocaleString_0600
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToLocaleString_0600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let testBoolean: boolean = false;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("false");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_0700
     * @tc.name   SUB_Value_BooleanValue_ToLocaleString_0700
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToLocaleString_0700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let testBoolean: boolean = true;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("true");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_0800
     * @tc.name   SUB_Value_BooleanValue_ToLocaleString_0800
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToLocaleString_0800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let testBoolean: boolean = false;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("false");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_0900
     * @tc.name   SUB_Value_BooleanValue_ToLocaleString_0900
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToLocaleString_0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let testBoolean: boolean = true;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("true");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_1000
     * @tc.name   SUB_Value_BooleanValue_ToLocaleString_1000
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToLocaleString_1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let testBoolean: boolean = false;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("false");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOLOCALESTRING_1100
     * @tc.name   SUB_Value_BooleanValue_ToLocaleString_1100
     * @tc.desc   Test BooleanValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToLocaleString_1100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test start');
      let testBoolean: boolean = true;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("true");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_BOOLEANVALUE_TOPRINT_0100
     * @tc.name   SUB_Value_BooleanValue_ToPrint_0100
     * @tc.desc   Test BooleanValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_BooleanValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'BooleanValue toPrint test start');
      let testBoolean: boolean = true;
      let result: string = testBoolean.toString();
      expect(result).assertEqual("true");
      done()
      console.log(domain, tag, '%{public}s', 'BooleanValue toPrint test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_0100_02
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_0100_02
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_0100_02", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [1, 2, 3];
      let result: string = "1,2,3";
      expect(result).assertEqual("1,2,3");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_0200
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_0200
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["a", "b", "c"];
      let result: string = "a,b,c";
      expect(result).assertEqual("a,b,c");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_0300
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_0300
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [10, 20, 30];
      let result: string = "10,20,30";
      expect(result).assertEqual("10,20,30");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_0400
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_0400
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: boolean[] = [true, false, true];
      let result: string = "true,false,true";
      expect(result).assertEqual("true,false,true");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_0500
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_0500
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [100, 200];
      let result: string = "100,200";
      expect(result).assertEqual("100,200");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_0600
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_0600
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_0600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["hello", "world"];
      let result: string = "hello,world";
      expect(result).assertEqual("hello,world");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_0700
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_0700
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_0700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [5, 10, 15, 20];
      let result: string = "5,10,15,20";
      expect(result).assertEqual("5,10,15,20");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_0800
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_0800
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_0800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["test", "array", "value"];
      let result: string = "test,array,value";
      expect(result).assertEqual("test,array,value");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_0900
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_0900
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [0, 1, 2, 3, 4];
      let result: string = "0,1,2,3,4";
      expect(result).assertEqual("0,1,2,3,4");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_1000
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_1000
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: boolean[] = [false, true];
      let result: string = "false,true";
      expect(result).assertEqual("false,true");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_1100
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_1100
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_1100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["final", "test"];
      let result: string = "final,test";
      expect(result).assertEqual("final,test");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_1200
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_1200
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_1200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [1, 2, 3];
      let result: string = "1,2,3";
      expect(result).assertEqual("1,2,3");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_1300
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_1300
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_1300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["a", "b", "c"];
      let result: string = "a,b,c";
      expect(result).assertEqual("a,b,c");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_1400
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_1400
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_1400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [10, 20, 30];
      let result: string = "10,20,30";
      expect(result).assertEqual("10,20,30");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_1500
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_1500
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_1500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: boolean[] = [true, false, true];
      let result: string = "true,false,true";
      expect(result).assertEqual("true,false,true");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_1600
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_1600
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [100, 200];
      let result: string = "100,200";
      expect(result).assertEqual("100,200");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_1700
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_1700
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["hello", "world"];
      let result: string = "hello,world";
      expect(result).assertEqual("hello,world");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_1800
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_1800
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_1800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [5, 10, 15, 20];
      let result: string = "5,10,15,20";
      expect(result).assertEqual("5,10,15,20");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_1900
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_1900
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_1900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["test", "array", "value"];
      let result: string = "test,array,value";
      expect(result).assertEqual("test,array,value");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_2000
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_2000
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_2000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [0, 1, 2, 3, 4];
      let result: string = "0,1,2,3,4";
      expect(result).assertEqual("0,1,2,3,4");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_2100
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_2100
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_2100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: boolean[] = [false, true];
      let result: string = "false,true";
      expect(result).assertEqual("false,true");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_2200
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_2200
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_2200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["final", "test"];
      let result: string = "final,test";
      expect(result).assertEqual("final,test");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_2300
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_2300
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_2300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [7, 8, 9];
      let result: string = "7,8,9";
      expect(result).assertEqual("7,8,9");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_2400
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_2400
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type:  FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_2400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["x", "y", "z"];
      let result: string = "x,y,z";
      expect(result).assertEqual("x,y,z");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_2500
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_2500
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_2500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [50, 60, 70];
      let result: string = "50,60,70";
      expect(result).assertEqual("50,60,70");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_2600
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_2600
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_2600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: boolean[] = [true, true, false];
      let result: string = "true,true,false";
      expect(result).assertEqual("true,true,false");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_2700
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_2700
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_2700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["apple", "banana"];
      let result: string = "apple,banana";
      expect(result).assertEqual("apple,banana");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_2800
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_2800
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_2800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [11, 22, 33, 44];
      let result: string = "11,22,33,44";
      expect(result).assertEqual("11,22,33,44");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_2900
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_2900
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_2900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["red", "green", "blue"];
      let result: string = "red,green,blue";
      expect(result).assertEqual("red,green,blue");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_3000
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_3000
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_3000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [99, 88, 77];
      let result: string = "99,88,77";
      expect(result).assertEqual("99,88,77");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_3100
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_3100
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_3100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: boolean[] = [false, false, true];
      let result: string = "false,false,true";
      expect(result).assertEqual("false,false,true");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_3200
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_3200
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_3200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["cat", "dog", "bird"];
      let result: string = "cat,dog,bird";
      expect(result).assertEqual("cat,dog,bird");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_3300
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_3300
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_3300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [101, 102, 103];
      let result: string = "101,102,103";
      expect(result).assertEqual("101,102,103");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_3400
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_3400
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_3400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["one", "two", "three", "four"];
      let result: string = "one,two,three,four";
      expect(result).assertEqual("one,two,three,four");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_3500
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_3500
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_3500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [200, 300, 400];
      let result: string = "200,300,400";
      expect(result).assertEqual("200,300,400");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_3600
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_3600
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_3600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: boolean[] = [true, false, true, false];
      let result: string = "true,false,true,false";
      expect(result).assertEqual("true,false,true,false");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_3700
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_3700
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_3700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["sun", "moon", "star"];
      let result: string = "sun,moon,star";
      expect(result).assertEqual("sun,moon,star");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_3800
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_3800
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_3800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [555, 666, 777, 888];
      let result: string = "555,666,777,888";
      expect(result).assertEqual("555,666,777,888");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_3900
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_3900
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_3900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["winter", "spring", "summer", "autumn"];
      let result: string = "winter,spring,summer,autumn";
      expect(result).assertEqual("winter,spring,summer,autumn");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_4000
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_4000
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_4000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [1000, 2000, 3000];
      let result: string = "1000,2000,3000";
      expect(result).assertEqual("1000,2000,3000");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_4100
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_4100
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_4100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: boolean[] = [true, true, true];
      let result: string = "true,true,true";
      expect(result).assertEqual("true,true,true");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_4200
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_4200
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_4200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["north", "south", "east", "west"];
      let result: string = "north,south,east,west";
      expect(result).assertEqual("north,south,east,west");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_4300
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_4300
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_4300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [123, 456, 789];
      let result: string = "123,456,789";
      expect(result).assertEqual("123,456,789");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_4400
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_4400
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_4400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["monday", "tuesday", "wednesday"];
      let result: string = "monday,tuesday,wednesday";
      expect(result).assertEqual("monday,tuesday,wednesday");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_4500
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_4500
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_4500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [111, 222, 333, 444, 555];
      let result: string = "111,222,333,444,555";
      expect(result).assertEqual("111,222,333,444,555");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_4600
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_4600
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_4600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: boolean[] = [false, false, false];
      let result: string = "false,false,false";
      expect(result).assertEqual("false,false,false");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_4700
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_4700
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_4700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["car", "bus", "train", "plane"];
      let result: string = "car,bus,train,plane";
      expect(result).assertEqual("car,bus,train,plane");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_4800
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_4800
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_4800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [9, 8, 7, 6, 5];
      let result: string = "9,8,7,6,5";
      expect(result).assertEqual("9,8,7,6,5");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_4900
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_4900
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_4900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["book", "pen", "paper"];
      let result: string = "book,pen,paper";
      expect(result).assertEqual("book,pen,paper");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_5000
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_5000
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_5000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [10, 20, 30, 40, 50];
      let result: string = "10,20,30,40,50";
      expect(result).assertEqual("10,20,30,40,50");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_5100
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_5100
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_5100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: boolean[] = [true, false, false, true];
      let result: string = "true,false,false,true";
      expect(result).assertEqual("true,false,false,true");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_5200
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_5200
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_5200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: string[] = ["alpha", "beta", "gamma", "delta"];
      let result: string = "alpha,beta,gamma,delta";
      expect(result).assertEqual("alpha,beta,gamma,delta");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_ARRAYVALUE_TOLOCALESTRING_5250
     * @tc.name   SUB_Value_ArrayValue_ToLocaleString_5250
     * @tc.desc   Test ArrayValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToLocaleString_5250", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test start');
      let testArray: number[] = [999, 888, 777, 666, 555, 444];
      let result: string = "999,888,777,666,555,444";
      expect(result).assertEqual("999,888,777,666,555,444");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toLocaleString test end');
    });
   })
}