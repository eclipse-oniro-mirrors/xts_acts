/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "@ohos/hypium"
import { hilog } from "@kit.PerformanceAnalysisKit"
import { sleep } from "../../testability/pages/Utils"

export default function builtinsArraySpliceTest() {
  describe('builtinsArraySpliceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0100
     * @tc.name builtinsArraySplice0100
     * @tc.desc test [1, 2, 3, 4, 5]splice(2, 2, 'a', 'b')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num: Array<number | string> = [1, 2, 3, 4, 5];
      const c = num.splice(2, 2, 'a', 'b');
      console.log(num.toString());
      let a = JSON.stringify(num);
      let b = JSON.stringify([1, 2, 'a', 'b', 5]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('3,4');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0200
     * @tc.name builtinsArraySplice0200
     * @tc.desc test [1, 2, 3, 4, 5]splice(2, -1, 'a', 'b')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num2: Array<number | string> = [1, 2, 3, 4, 5];
      const c = num2.splice(2, -1, 'a', 'b');
      console.log(num2.toString());
      let a = JSON.stringify(num2);
      let b = JSON.stringify([1, 2, "a", "b", 3, 4, 5]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0300
     * @tc.name builtinsArraySplice0300
     * @tc.desc test [2,3,4]splice(0,0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num3: Array<number | string> = [2, 3, 4];
      const c = num3.splice(0, 0, 1);
      console.log(num3.toString());
      let a = JSON.stringify(num3);
      let b = JSON.stringify([1, 2, 3, 4]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0400
     * @tc.name builtinsArraySplice0400
     * @tc.desc test [1,2]splice(2,0,3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num4: Array<number | string> = [1, 2];
      const c = num4.splice(2, 0, 3);
      console.log(num4.toString());
      let a = JSON.stringify(num4);
      let b = JSON.stringify([1, 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0500
     * @tc.name builtinsArraySplice0500
     * @tc.desc test []splice(0,0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      let num5: Number[] = []
      const c = num5.splice(0, 0, 1);
      console.log(num5.toString());
      let a = JSON.stringify(num5);
      let b = JSON.stringify([1]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })
    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0600
     * @tc.name builtinsArraySplice0600
     * @tc.desc test [1,,3]splice(1,1,2);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | undefined> = [1, , 3];
      const c = num6.splice(1, 1, 2);
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0700
     * @tc.name builtinsArraySplice0700
     * @tc.desc test [1,2,3,4,5]splice(-2,1);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | undefined> = [1, 2, 3, 4, 5];
      const c = num6.splice(-2, 1);
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, 2, 3, 5]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('4');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0800
     * @tc.name builtinsArraySplice0800
     * @tc.desc test [1,2,3,4,5]splice(1, 0,undefined);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | undefined> = [1, 2, 3, 4, 5];
      const c = num6.splice(1, 0, undefined);
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, undefined, 2, 3, 4, 5]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0900
     * @tc.name builtinsArraySplice0900
     * @tc.desc test [1, 2, 3, 4, 5]splice(1, 0, null);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | null> = [1, 2, 3, 4, 5];
      const c = num6.splice(1, 0, null);
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, null, 2, 3, 4, 5]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1000
     * @tc.name builtinsArraySplice1000
     * @tc.desc test [1,2,3]splice(0, 3);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | null> = [1, 2, 3];
      const c = num6.splice(0, 3);
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('1,2,3');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1100
     * @tc.name builtinsArraySplice1100
     * @tc.desc test [1, 2, 3]splice(1, 0, 'a', 'b');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | string> = [1, 2, 3];
      const c = num6.splice(1, 0, 'a', 'b');
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, 'a', 'b', 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1200
     * @tc.name builtinsArraySplice1200
     * @tc.desc test [1, 2, 3]splice(1, 0, '#','$');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | string> = [1, 2, 3];
      const c = num6.splice(1, 0, '#', '$');
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, '#', '$', 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1300
     * @tc.name builtinsArraySplice1300
     * @tc.desc test [1, 2, 3]splice(1, 0,undefined,'$');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | string | undefined> = [1, 2, 3];
      const c = num6.splice(1, 0, undefined, '$');
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, undefined, '$', 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1400
     * @tc.name builtinsArraySplice1400
     * @tc.desc test [1, 2, 3]splice(1, 0,'€', '©');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | string | undefined> = [1, 2, 3];
      const c = num6.splice(1, 0, '€', '©');
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, '€', '©', 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1500
     * @tc.name builtinsArraySplice1500
     * @tc.desc test [1, 2, 3]splice(1, 0,'\udc04', '\ud83d');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | string | undefined> = [1, 2, 3];
      const c = num6.splice(1, 0, '\udc04', '\ud83d');
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, '\udc04', '\ud83d', 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1600
     * @tc.name builtinsArraySplice1600
     * @tc.desc test [1, 2, 3]splice(1, 0,'\a', '\b');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | string | undefined> = [1, 2, 3];
      const c = num6.splice(1, 0, '\a', '\b');
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, '\a', '\b', 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1700
     * @tc.name builtinsArraySplice1700
     * @tc.desc test [1, 2, 3]splice(1, 0,Math.floor(1.5), NaN);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | string | undefined> = [1, 2, 3];
      const c = num6.splice(1, 0, Math.floor(1.5), NaN);
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, Math.floor(1.5), NaN, 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1800
     * @tc.name builtinsArraySplice1800
     * @tc.desc test [1, 2, 3]splice(1, 0,Number.EPSILON, 0xcafebabe);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | string | undefined> = [1, 2, 3];
      const c = num6.splice(1, 0, Number.EPSILON, 0xcafebabe);
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, Number.EPSILON, 0xcafebabe, 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1900
     * @tc.name builtinsArraySplice1900
     * @tc.desc test [1, 2, 3]splice(1, 0,true, !'s');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | string | boolean> = [1, 2, 3];
      const c = num6.splice(1, 0, true, !'s');
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, true, !'s', 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_2000
     * @tc.name builtinsArraySplice2000
     * @tc.desc test [1, 2, 3]splice(1, 0,true, !'s');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySplice2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const num6: Array<number | string | boolean> = [1, 2, 3];
      const c = num6.splice(Math.floor(1.5), NaN, true, !'s');
      console.log(num6.toString());
      let a = JSON.stringify(num6);
      let b = JSON.stringify([1, true, !'s', 2, 3]);
      expect(b).assertEqual(a);
      expect(c.toString()).assertEqual('');
      Done()
    })
  })
}