/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function builtinsBooleanConstructorTest() {
  describe('builtinsBooleanConstructorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll( async() => {
      await sleep(50);
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_0100
     * @tc.name builtinsBooleanConstructorTest0100
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest0100';
      console.info(`${caseName} test start`);
      let bool = new Boolean();
      expect(bool).assertInstanceOf('Boolean');
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_0200
     * @tc.name builtinsBooleanConstructorTest0200
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest0200';
      console.info(`${caseName} test start`);
      let bool = new Boolean(0);
      expect(bool).assertInstanceOf('Boolean');
      expect(Boolean(bool)).assertFalse();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_0300
     * @tc.name builtinsBooleanConstructorTest0300
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest0300';
      console.info(`${caseName} test start`);
      let bool = new Boolean('');
      expect(bool).assertInstanceOf('Boolean');
      expect(Boolean(bool)).assertFalse();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_0400
     * @tc.name builtinsBooleanConstructorTest0400
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest0400';
      console.info(`${caseName} test start`);
      let bool = new Boolean(null);
      expect(bool).assertInstanceOf('Boolean');
      expect(Boolean(bool)).assertFalse();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_0500
     * @tc.name builtinsBooleanConstructorTest0500
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest0500';
      console.info(`${caseName} test start`);
      let bool = new Boolean(undefined);
      expect(bool).assertInstanceOf('Boolean');
      expect(Boolean(bool)).assertFalse();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_0600
     * @tc.name builtinsBooleanConstructorTest0600
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest0600';
      console.info(`${caseName} test start`);
      let bool = new Boolean(false);
      expect(bool).assertInstanceOf('Boolean');
      expect(Boolean(bool)).assertFalse();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_0700
     * @tc.name builtinsBooleanConstructorTest0700
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest0700';
      console.info(`${caseName} test start`);
      let bool = new Boolean(true);
      expect(bool).assertInstanceOf('Boolean');
      expect(Boolean(bool)).assertTrue();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_0800
     * @tc.name builtinsBooleanConstructorTest0800
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest0800';
      console.info(`${caseName} test start`);
      let bool = new Boolean('true');
      expect(bool).assertInstanceOf('Boolean');
      expect(Boolean(bool)).assertTrue();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_0900
     * @tc.name builtinsBooleanConstructorTest0900
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest0900';
      console.info(`${caseName} test start`);
      let bool = new Boolean('false');
      expect(bool).assertInstanceOf('Boolean');
      expect(Boolean(bool)).assertTrue();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_1200
     * @tc.name builtinsBooleanConstructorTest1200
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest1200';
      console.info(`${caseName} test start`);
      let bool = new Boolean();
      expect(bool.valueOf()).assertFalse();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_1300
     * @tc.name builtinsBooleanConstructorTest1300
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest1300';
      console.info(`${caseName} test start`);
      let bool = Boolean(0);
      expect(bool).assertFalse();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_1400
     * @tc.name builtinsBooleanConstructorTest1400
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest1400';
      console.info(`${caseName} test start`);
      let bool = Boolean('');
      expect(bool).assertFalse();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_1500
     * @tc.name builtinsBooleanConstructorTest1500
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest1500';
      console.info(`${caseName} test start`);
      let bool = Boolean(null);
      expect(bool).assertFalse();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_1600
     * @tc.name builtinsBooleanConstructorTest1600
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest1600';
      console.info(`${caseName} test start`);
      let bool = Boolean(undefined);
      expect(bool).assertFalse();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_1700
     * @tc.name builtinsBooleanConstructorTest1700
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest1700';
      console.info(`${caseName} test start`);
      let bool = Boolean(false);
      expect(bool).assertFalse();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_1900
     * @tc.name builtinsBooleanConstructorTest1900
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest1900';
      console.info(`${caseName} test start`);
      let obj: Record<string, string> = {};
      let bool = Boolean(obj);
      expect(bool).assertTrue();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_2000
     * @tc.name builtinsBooleanConstructorTest2000
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest2000';
      console.info(`${caseName} test start`);
      let bool = Boolean(true);
      expect(bool).assertTrue();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_2100
     * @tc.name builtinsBooleanConstructorTest2100
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest2100';
      console.info(`${caseName} test start`);
      let bool = Boolean('true');
      expect(bool).assertTrue();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_BOOLEAN_CONSTRUCTOR_TEST_2200
     * @tc.name builtinsBooleanConstructorTest2200
     * @tc.desc Testing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBooleanConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsBooleanConstructorTest2200';
      console.info(`${caseName} test start`);
      let bool = Boolean('false');
      expect(bool).assertTrue();
      console.info(`${caseName} test end`);
      done.unsafeCall();
    })
  })
}
