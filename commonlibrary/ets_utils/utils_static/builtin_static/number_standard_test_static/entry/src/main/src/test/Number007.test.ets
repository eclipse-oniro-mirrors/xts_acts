/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import  Utils  from "./Util.test";

export default function BuiltinsNumberParseTest() {
  describe('BuiltinsNumberParseTest', () => {
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
     * @tc.number SUB_BUILTINS_NUMBER_PARSE_TEST_0100
     * @tc.name builtinsNumberParseTest0100
     * @tc.desc ParseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberParseTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberParseTest0100';
      console.log(`${caseName} test start`);
      const num = Number.parseFloat("3");
      console.log(`${num}`);
      expect(3).assertEqual(num);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_PARSE_TEST_0200
     * @tc.name builtinsNumberParseTest0200
     * @tc.desc ParseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberParseTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberParseTest0200';
      console.log(`${caseName} test start`);
      const num1 = Number.parseFloat("3.14");
      console.log(`${num1}`);
      expect(3.14).assertEqual(num1);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_PARSE_TEST_0300
     * @tc.name builtinsNumberParseTest0300
     * @tc.desc ParseFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberParseTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberParseTest0300';
      console.log(`${caseName} test start`);
      const num2 = Number.parseFloat("3.14abc");
      console.log(`${num2}`);
      expect(3.14).assertEqual(num2);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_PARSE_TEST_0400
     * @tc.name builtinsNumberParseTest0400
     * @tc.desc ParseInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberParseTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberParseTest0400';
      console.log(`${caseName} test start`);
      const num3 = Number.parseInt("3");
      console.log(`${num3}`);
      expect(3).assertEqual(num3);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_PARSE_TEST_0500
     * @tc.name builtinsNumberParseTest0500
     * @tc.desc ParseInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberParseTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberParseTest0500';
      console.log(`${caseName} test start`);
      const num4 = Number.parseInt("3.14");
      console.log(`${num4}`);
      expect(3).assertEqual(num4);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_NUMBER_PARSE_TEST_0600
     * @tc.name builtinsNumberParseTest0600
     * @tc.desc ParseInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberParseTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberParseTest0600';
      console.log(`${caseName} test start`);
      const num5 = Number.parseInt("3.14abc");
      console.log(`${num5}`);
      expect(3).assertEqual(num5);
      console.log(`${caseName} test end`);
      Done();
    })
  })
}