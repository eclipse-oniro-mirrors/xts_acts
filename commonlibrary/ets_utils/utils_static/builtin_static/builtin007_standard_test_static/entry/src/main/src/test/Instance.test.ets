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
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
export default function instanceTest() {

  describe("instanceTest", (): void => {
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
     * @tc.number CORE_VOIDVALUE_01
     * @tc.name   testNullValueInstance0001
     * @tc.desc   Verify INSTANCE is singleton
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testNullValueInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueInstance0001";
      try {
        let instance1 = NullValue.INSTANCE;
        let instance2 = NullValue.INSTANCE;
        expect(instance1 === instance2).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_VOIDVALUE_002_01
     * @tc.name   testNullValueInstance0002
     * @tc.desc   Verify INSTANCE getType() returns NullType.REF
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testNullValueInstance0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueInstance0002";
      try {
        expect(NullValue.INSTANCE.getType()).assertEqual(NullType.REF);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_VOIDVALUE_003_01
     * @tc.name   testNullValueInstance0003
     * @tc.desc   Verify INSTANCE toString() matches NullType.REF.toString()
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testNullValueInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueInstance0003";
      try {
        expect(NullValue.INSTANCE.toString()).assertEqual(NullType.REF.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_VOIDVALUE_004
     * @tc.name   testNullValueInstance0004
     * @tc.desc   Verify INSTANCE toLocaleString() equals toString()
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testNullValueInstance0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueInstance0004";
      try {
        let instance = NullValue.INSTANCE;
        expect(instance.toLocaleString()).assertEqual(instance.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_VOIDVALUE_05
     * @tc.name   testNullValueInstance0005
     * @tc.desc   Verify INSTANCE toPrint() returns correct string
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testNullValueInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueInstance0005";
      try {
        expect(NullValue.INSTANCE.toPrint(0)).assertEqual(NullType.REF.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_VOIDVALUE_006_01
     * @tc.name   testNullValueInstance0006
     * @tc.desc   Verify INSTANCE toPrint() with different depth
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testNullValueInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueInstance0006";
      try {
        let instance = NullValue.INSTANCE;
        expect(instance.toPrint(0)).assertEqual(NullType.REF.toString());
        expect(instance.toPrint(1)).assertEqual(NullType.REF.toString());
        expect(instance.toPrint(2)).assertEqual(NullType.REF.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_VOIDVALUE_007_01
     * @tc.name   testNullValueInstance0007
     * @tc.desc   Verify INSTANCE properties cannot be modified
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testNullValueInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testNullValueInstance0007";
      try {
        let instance = NullValue.INSTANCE;
        expect(instance.hasOwnProperty('testProp')).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed with error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_BOOLEANVALUE_001
     * @tc.name   testGetValueData0001
     * @tc.desc   Verify getValueData with true value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testGetValueData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetValueData0001";
      try {
        let boolValue = new BooleanValue(BooleanType.REF, true);
        expect(boolValue.getValueData()).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_BOOLEANVALUE_002_01
     * @tc.name   testGetValueData0002
     * @tc.desc   Verify getValueData with false value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testGetValueData0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetValueData0002";
      try {
        let boolValue = new BooleanValue(BooleanType.REF, false);
        expect(boolValue.getValueData()).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_BOOLEANVALUE_003_02
     * @tc.name   testGetValueData0003
     * @tc.desc   Verify getValueData with constructor using Boolean object (true)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testGetValueData0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetValueData0003";
      try {
        let boolValue = new BooleanValue(BooleanType.REF, new Boolean(true));
        expect(boolValue.getValueData()).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_BOOLEANVALUE_004_01
     * @tc.name   testGetValueData0004
     * @tc.desc   Verify getValueData with constructor using Boolean object (false)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testGetValueData0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetValueData0004";
      try {
        let boolValue = new BooleanValue(BooleanType.REF, new Boolean(false));
        expect(boolValue.getValueData()).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_BOOLEANVALUE_005
     * @tc.name   testGetValueData0005
     * @tc.desc   Verify getValueData returns correct type
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testGetValueData0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetValueData0005";
      try {
        let boolValue = new BooleanValue(BooleanType.REF, true);
        expect(typeof boolValue.getValueData()).assertEqual('boolean');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_BOOLEANVALUE_006
     * @tc.name   testGetValueData0006
     * @tc.desc   Verify multiple instances with same value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testGetValueData0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetValueData0006";
      try {
        let boolValue1 = new BooleanValue(BooleanType.REF, true);
        let boolValue2 = new BooleanValue(BooleanType.REF, true);
        expect(boolValue1.getValueData()).assertEqual(boolValue2.getValueData());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_BOOLEANVALUE_007
     * @tc.name   testGetValueData0007
     * @tc.desc   Verify value stability after multiple calls
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testGetValueData0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetValueData0007";
      try {
        let boolValue = new BooleanValue(BooleanType.REF, false);
        let firstCall = boolValue.getValueData();
        let secondCall = boolValue.getValueData();
        expect(firstCall).assertEqual(secondCall);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number CORE_BOOLEANVALUE_008
     * @tc.name   testGetValueData0008
     * @tc.desc   Verify falsy value handling (should fail)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testGetValueData0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testGetValueData0008";
      try {
        try {
          let falsyBoolean: Boolean = new Boolean(0);
          let boolValue = new BooleanValue(BooleanType.REF, falsyBoolean);
          expect(boolValue.getValueData()).assertEqual(false);
        } catch (err) {
          console.log(`${TAG} caught unexpected error: ${err}`);
          expect().assertFail();
        }
      } catch (unexpectedErr) {
        console.error(`${TAG} failed with unexpected error: ${unexpectedErr}`);
        expect().assertFail();
      }
    });
    })
}