/*
 * Copyright (c) 2025-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'

export default function BigInt64ArrayTest() {
  describe('BigInt64ArrayTest', (): void => {
    // afterEach(() => {
    //   await Utils.msSleep(20);
    // })
    // let value: string;
    // // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    // beforeAll((): void => {
    //   // Presets an action, which is performed only once before all test cases of the test suite start.
    //   // This API supports only one parameter: preset action function.
    // })
    // beforeEach((): void => {
    //   // Presets an action, which is performed before each unit test case starts.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: preset action function.
    // })
    // afterEach(async (done: () => void): Promise<void> => {
    //   // Presets a clear action, which is performed after each unit test case ends.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: clear action function.
    //   // console.info('TypeArray after each called');
    //   // value == '';
    //   // await sleep(10);
    //   // done();
    // })
    // afterAll((): void => {
    //   // Presets a clear action, which is performed after all test cases of the test suite end.
    //   // This API supports only one parameter: clear action function.
    // })

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_0100
     * @tc.name         testBigInt64Constructor0001
     * @tc.desc         Testing Constructor of BigInt64Array without param.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 0
     */
    it('testBigInt64Constructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG = "testBigInt64Constructor0001";
      try {
        let array = new BigInt64Array();
        expect(String(array.length)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_0200
     * @tc.name         testBigInt64Constructor0002
     * @tc.desc         Testing Constructor of BigInt64Array with length 0,and set index 0 with 3.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 0
     */
    it('testBigInt64Constructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG = "testBigInt64Constructor0002";
      let flag = false;
      try {
        let array = new BigInt64Array(0);
        array[0] = BigInt(3);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_0300
     * @tc.name         testBigInt64Constructor0003
     * @tc.desc         Testing Constructor of BigInt64Array with length 10,and set index 0 with 3.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 0
     */
    it('testBigInt64Constructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG = "testBigInt64Constructor0003";
      try {
        let array = new BigInt64Array(10);
        array[0] = BigInt(3);
        expect(String(array[0])).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_0400
     * @tc.name         testBigInt64Constructor0004
     * @tc.desc         Testing Constructor of BigInt64Array with length 10,and set index 0 with 3.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 0
     */
    it('testBigInt64Constructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG = "testBigInt64Constructor0004";
      let flag = false;
      try {
        let array = new BigInt64Array(10);
        array[10] = BigInt(3);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_0500
     * @tc.name         testBigInt64Constructor0005
     * @tc.desc         Testing Constructor of BigInt64Array with length 10,and get value of index 1.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 0
     */
    it('testBigInt64Constructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const TAG = "testBigInt64Constructor0005";
      try {
        let array = new BigInt64Array(10);
        expect(String(array[1])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_0800
     * @tc.name         testBigInt64Constructor0008
     * @tc.desc         Testing Constructor of BigInt64Array with array[21,31],and get value of index 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0008";
      try {
        let array = new BigInt64Array([BigInt(21), BigInt(31)]);
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_0900
     * @tc.name         testBigInt64Constructor0009
     * @tc.desc         Testing Constructor of BigInt64Array with array[21,31],and get value of index 1.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0009";
      try {
        let array = new BigInt64Array([BigInt(21), BigInt(31)]);
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_1000
     * @tc.name         testBigInt64Constructor0010
     * @tc.desc         Testing Constructor of BigInt64Array with array[21,31],and get value of index 3.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0010";
      let flag = false;
      try {
        let array = new BigInt64Array([BigInt(21), BigInt(31)]);
        array[3] = BigInt(3);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_1100
     * @tc.name         testBigInt64Constructor0011
     * @tc.desc         Testing Constructor of BigInt64Array with array[21,31],and set value of index 10,get value of index 10.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0011";
      let flag = false;
      try {
        let array = new BigInt64Array([BigInt(21), BigInt(31)]);
        array[10] = BigInt(3);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_1200
     * @tc.name         testBigInt64Constructor0012
     * @tc.desc         Testing Constructor of BigInt64Array with BigInt64Array which construct by array [21,31],and get value of index 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0012";
      try {
        let array = new BigInt64Array(new BigInt64Array([BigInt(21), BigInt(31)]));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_1300
     * @tc.name         testBigInt64Constructor0013
     * @tc.desc         Testing Constructor of BigInt64Array with BigInt64Array which construct by array [21,31],and get value of index 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0013";
      try {
        let array = new BigInt64Array(new BigInt64Array([BigInt(21), BigInt(31)]));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_1400
     * @tc.name         testBigInt64Constructor0014
     * @tc.desc         Testing Constructor of BigInt64Array with BigInt64Array which construct by array [21,31],and get value of index 3.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0014";
      let flag = false;
      try {
        let array = new BigInt64Array(new BigInt64Array([BigInt(21), BigInt(31)]));
        array[3] = BigInt(3);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;  
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_1500
     * @tc.name         testBigInt64Constructor0015
     * @tc.desc         Testing Constructor of BigInt64Array with BigInt64Array which construct by array [21,31],and set value of index 10,and get value of index 10.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0015";
      let flag = false;
      try {
        let array = new BigInt64Array(new BigInt64Array([BigInt(21), BigInt(31)]));
        array[10] = BigInt(3);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_1600
     * @tc.name         testBigInt64Constructor0016
     * @tc.desc         Testing Constructor of BigInt64Array with ArrayBuffer,and get value of index 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0016";
      let flag = false;
      try {
        let array = new BigInt64Array(new BigInt64Array([BigInt(21), BigInt(31)]));
        array[10] = BigInt(3);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_BYTESPERELEMENT_1700
     * @tc.name         testBigInt64BytesPerElement0017
     * @tc.desc         Testing BYTES_PER_ELEMENT of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64BytesPerElement0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64BytesPerElement0017";
      try {
        let bytes = BigInt64Array.BYTES_PER_ELEMENT;
        expect(String(bytes)).assertEqual('8');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_FROM_1800
     * @tc.name         testBigInt64From0018
     * @tc.desc         Testing static function from of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64From0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64From0018";
      try {
        const newArr = Array.from<number, BigInt>(new Array<number>(1, 2, 3), (v: number, k: int) => {
          return new BigInt(v + v);
        });
        let array: BigInt64Array = BigInt64Array.from(newArr);
        expect(String(array[0])).assertEqual('2');
        expect(String(array[1])).assertEqual('4');
        expect(String(array[2])).assertEqual('6');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_OF_1900
     * @tc.name         testBigInt64Of0019
     * @tc.desc         Testing static function of of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Of0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Of0019";
      try {
        let array = BigInt64Array.of();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_OF_2000
     * @tc.name         testBigInt64Of0020
     * @tc.desc         Testing static function of of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Of0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Of0020";
      try {
        let array = BigInt64Array.of(BigInt(0));
        array[0] = BigInt(3);
        expect(String(array[0])).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_OF_2100
     * @tc.name         testBigInt64Of0021
     * @tc.desc         Testing static function of of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Of0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Of0021";
      try {
        let array = BigInt64Array.of(BigInt(10));
        array[0] = BigInt(3);
        expect(String(array[0])).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_OF_2200
     * @tc.name         testBigInt64Of0022
     * @tc.desc         Testing static function of of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Of0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Of0022";
      let flag = false;
      try {
        let array = BigInt64Array.of(BigInt(10));
        array[10] = BigInt(3);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_OF_2300
     * @tc.name         testBigInt64Of0023
     * @tc.desc         Testing static function of of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Of0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Of0023";
      let flag = false;
      try {
        let array = BigInt64Array.of(BigInt(10));
        array[1] = BigInt(3);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_OF_2400
     * @tc.name         testBigInt64Of0024
     * @tc.desc         Testing static function of of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Of0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Of0024";
      try {
        let array = BigInt64Array.of(BigInt(21), BigInt(31));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_OF_2500
     * @tc.name         testBigInt64Of0025
     * @tc.desc         Testing static function of of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Of0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Of0025";
      try {
        let array = BigInt64Array.of(BigInt(21), BigInt(31));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_OF_2600
     * @tc.name         testBigInt64Of0026
     * @tc.desc         Testing static function of of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Of0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Of0026";
      let flag = false;
      try {
        let array = BigInt64Array.of(BigInt(21), BigInt(31));
        array[3] = BigInt(3);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_OF_2700
     * @tc.name         testBigInt64Of0027
     * @tc.desc         Testing static function of of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Of0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Of0027";
      let flag = false;
      try {
        let array = BigInt64Array.of(BigInt(21), BigInt(31));
        array[10] = BigInt(3);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_BYTEOFFSET_2800
     * @tc.name         testBigInt64ByteOffset0028
     * @tc.desc         Testing instance property byteOffset of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ByteOffset0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ByteOffset0028";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new BigInt64Array(buffer);
        expect(String(arrayOffSet0.byteOffset)).assertEqual('0');
        const arrayOffSet8 = new BigInt64Array(buffer, 8);
        expect(String(arrayOffSet8.byteOffset)).assertEqual('8');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_BYTELENGTH_2900
     * @tc.name         testBigInt64ByteLength0029
     * @tc.desc         Testing instance property byteLength of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ByteLength0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ByteLength0029";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new BigInt64Array(buffer);
        expect(String(arrayOffSet0.byteLength)).assertEqual('32');
        const arrayOffSet8 = new BigInt64Array(buffer, 8);
        expect(String(arrayOffSet8.byteLength)).assertEqual('24');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_BUFFER_3000
     * @tc.name         testBigInt64Buffer0030
     * @tc.desc         Testing instance property buffer of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Buffer0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Buffer0030";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new BigInt64Array(buffer);
        expect(String(arrayOffSet0.buffer.byteLength)).assertEqual('32');
        const arrayOffSet8 = new BigInt64Array(buffer, 8);
        expect(String(arrayOffSet8.buffer.byteLength)).assertEqual('32');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_LENGTH_3100
     * @tc.name         testBigInt64Length0031
     * @tc.desc         Testing instance function length of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Length0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Length0031";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new BigInt64Array(buffer);
        expect(String(arrayOffSet0.length)).assertEqual('4');
        const arrayOffSet8 = new BigInt64Array(buffer, 8);
        expect(String(arrayOffSet8.length)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_3300
     * @tc.name         testBigInt64Constructor0033
     * @tc.desc         Testing Constructor of BigInt64Array with Int8Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0033";
      try {
        const int8Array = new Int8Array([21, 31]);
        const buffer = new ArrayBuffer(16);
        const view = new DataView(buffer);
        view.setBigInt64(0, BigInt(int8Array[0]), true);
        view.setBigInt64(8, BigInt(int8Array[1]), true);
        const bigInt64Array = new BigInt64Array(buffer);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_3400
     * @tc.name         testBigInt64Constructor0034
     * @tc.desc         Testing Constructor of BigInt64Array with Uint8Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0034";
      try {
        const uint8Array = new Uint8Array([21, 31]);
        const buffer = new ArrayBuffer(16);
        const view = new DataView(buffer);
        view.setBigInt64(0, BigInt(uint8Array[0]), true);
        view.setBigInt64(8, BigInt(uint8Array[1]), true);
        const bigInt64Array = new BigInt64Array(buffer);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_3500
     * @tc.name         testBigInt64Constructor0035
     * @tc.desc         Testing Constructor of BigInt64Array with Uint8ClampedArray.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0035";
      try {
        const uint8ClampedArray = new Uint8ClampedArray([21, 31]);
        const buffer = new ArrayBuffer(16);
        const view = new DataView(buffer);
        view.setBigInt64(0, BigInt(uint8ClampedArray[0]), true);
        view.setBigInt64(8, BigInt(uint8ClampedArray[1]), true);
        const bigInt64Array = new BigInt64Array(buffer);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_3600
     * @tc.name         testBigInt64Constructor0036
     * @tc.desc         Testing Constructor of BigInt64Array with Int16Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0036";
      try {
        const int16Array = new Int16Array([21, 31]);
        const buffer = new ArrayBuffer(16);
        const view = new DataView(buffer);
        view.setBigInt64(0, BigInt(int16Array[0]), true);
        view.setBigInt64(8, BigInt(int16Array[1]), true);
        const bigInt64Array = new BigInt64Array(buffer);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_3700
     * @tc.name         testBigInt64Constructor0037
     * @tc.desc         Testing Constructor of BigInt64Array with Uint16Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0037";
      try {
        const uint16Array = new Uint16Array([21, 31]);
        const buffer = new ArrayBuffer(16);
        const view = new DataView(buffer);
        view.setBigInt64(0, BigInt(uint16Array[0]), true);
        view.setBigInt64(8, BigInt(uint16Array[1]), true);
        const bigInt64Array = new BigInt64Array(buffer);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_3800
     * @tc.name         testBigInt64Constructor0038
     * @tc.desc         Testing Constructor of BigInt64Array with Int32Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0038";
      try {
        const int32Array = new Int32Array([21, 31]);
        const buffer = new ArrayBuffer(16);
        const view = new DataView(buffer);
        view.setBigInt64(0, BigInt(int32Array[0]), true);
        view.setBigInt64(8, BigInt(int32Array[1]), true);
        const bigInt64Array = new BigInt64Array(buffer);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_3900
     * @tc.name         testBigInt64Constructor0039
     * @tc.desc         Testing Constructor of BigInt64Array with Uint32Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0039";
      try {
        const uint32Array = new Uint32Array([21, 31]);
        const buffer = new ArrayBuffer(16);
        const view = new DataView(buffer);
        view.setBigInt64(0, BigInt(uint32Array[0]), true);
        view.setBigInt64(8, BigInt(uint32Array[1]), true);
        const bigInt64Array = new BigInt64Array(buffer);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_4000
     * @tc.name         testBigInt64Constructor0040
     * @tc.desc         Testing Constructor of BigInt64Array with BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0040";
      try {
        const array = new BigInt64Array([21n, 31n]);
        expect((new BigInt64Array(array)).toString()).assertEqual('21,31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_4200
     * @tc.name         testBigInt64Constructor0042
     * @tc.desc         Testing Constructor of BigInt64Array with Float32Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0042";
      try {
        const float32Array = new Float32Array([21, 31]);
        const buffer = new ArrayBuffer(16);
        const view = new DataView(buffer);
        view.setBigInt64(0, BigInt(float32Array[0]), true);
        view.setBigInt64(8, BigInt(float32Array[1]), true);
        const bigInt64Array = new BigInt64Array(buffer);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_length_4300
     * @tc.name         testBigInt64Length0043
     * @tc.desc         Testing instance function length of BigInt64Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Length0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Length0043";
      try {
        let bigInt64Array = new BigInt64Array(8);
        expect(String(bigInt64Array.length)).assertEqual('8');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_4500
     * @tc.name         testBigInt64Constructor0045
     * @tc.desc         Testing Constructor of BigInt64Array with Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0045";
      try {
        let array: Array<number> = new Array<number>(2);
        array[0] = 21;
        array[1] = 31;
        let bigIntArray = array.map((value: number) => {
          return BigInt(value)
        });
        let bigInt64Array = new BigInt64Array(bigIntArray);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_4600
     * @tc.name         testBigInt64Constructor0046
     * @tc.desc         Testing Constructor of BigInt64Array with Array.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0046";
      try {
        let array: Array<number> = new Array<number>(2);
        array[0] = 21;
        array[1] = 31;
        // let bigIntArray = array.map(num => BigInt(num));
        let bigIntArray = array.map((value: number) => {
          return BigInt(value)
        });
        let buffer = new ArrayBuffer(bigIntArray.length * 8);
        let view = new DataView(buffer);
        bigIntArray.forEach((num, index) => {
          view.setBigInt64((index * 8) as int, num, true);
        });
        let bigInt64Array = new BigInt64Array(buffer);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_4700
     * @tc.name         testBigInt64Constructor0047
     * @tc.desc         Testing Constructor of BigInt64Array with ArrayBuffer.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0047";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let bigInt64Array = new BigInt64Array(arrayBuffer);
        bigInt64Array[0] = BigInt(21);
        bigInt64Array[1] = BigInt(31);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_4800
     * @tc.name         testBigInt64Constructor0048
     * @tc.desc         Testing Constructor of BigInt64Array with ArrayBuffer.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0048";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let bigInt64Array = new BigInt64Array(arrayBuffer, 0, 2);
        bigInt64Array[0] = BigInt(21);
        bigInt64Array[1] = BigInt(31);
        expect(String(bigInt64Array[0])).assertEqual('21');
        expect(String(bigInt64Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_5400
     * @tc.name         testBigInt64Constructor0054
     * @tc.desc         Testing Constructor of BigInt64Array with threshold value([-2*63]).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0054";
      try {
        let array = new BigInt64Array([-9223372036854775808n]);
        expect(String(array[0])).assertEqual('-9223372036854775808');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_5500
     * @tc.name         testBigInt64Constructor0055
     * @tc.desc         Testing Constructor of BigInt64Array with out of bounds value([-9223372036854775809n]),
     * and get value of index 0 is 9223372036854775807n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0055";
      try {
        let array = new BigInt64Array([-9223372036854775809n]);
        expect(String(array[0])).assertEqual('9223372036854775807');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_5600
     * @tc.name         testBigInt64Constructor0056
     * @tc.desc         Testing Constructor of BigInt64Array with threshold value([2*63 - 1]),
     * and get value of index 0 is 9223372036854775807.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0056";
      try {
        let array = new BigInt64Array([9223372036854775807n]);
        expect(String(array[0])).assertEqual('9223372036854775807');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_5700
     * @tc.name         testBigInt64Constructor0057
     * @tc.desc         Testing Constructor of BigInt64Array with out of bounds value([2*63]),
     * and get value of index 0 is -9223372036854775808.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0057";
      try {
        let array = new BigInt64Array([9223372036854775808n]);
        expect(String(array[0])).assertEqual('-9223372036854775808');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_5800
     * @tc.name         testBigInt64Constructor0058
     * @tc.desc         Testing Constructor of BigInt64Array with Int8Array threshold value([-128]),
     * and get value of index 0 is -128n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0058";
      try {
        let array1 = new Int8Array([-128]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('-128');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_5900
     * @tc.name         testBigInt64Constructor0059
     * @tc.desc         Testing Constructor of BigInt64Array with Int8Array out of bounds value([-129]),
     * and get value of index 0 is 127n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0059";
      try {
        let array1 = new Int8Array([-129]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('127');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_6000
     * @tc.name         testBigInt64Constructor0060
     * @tc.desc         Testing Constructor of BigInt64Array with Int8Array threshold value([127]),
     * and get value of index 0 is 127n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0060";
      try {
        let array1 = new Int8Array([127]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('127');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_6100
     * @tc.name         testBigInt64Constructor0061
     * @tc.desc         Testing Constructor of BigInt64Array with Int8Array value([126]),
     * and get value of index 0 is 126n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0061";
      try {
        let array1 = new Int8Array([126]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('126');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_6200
     * @tc.name         testBigInt64Constructor0062
     * @tc.desc         Testing Constructor of BigInt64Array with Int8Array out of bounds value([128]),
     * and get value of index 0 is -128n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0062";
      try {
        let array1 = new Int8Array([128]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('-128');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_6300
     * @tc.name         testBigInt64Constructor0063
     * @tc.desc         Testing Constructor of BigInt64Array with Uint8ClampedArray threshold value([0]),
     * and get value of index 0 is 0n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0063";
      try {
        let array1 = new Uint8ClampedArray([0]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_6500
     * @tc.name         testBigInt64Constructor0065
     * @tc.desc         Testing Constructor of BigInt64Array with Uint8ClampedArray out of bounds value([-1]),
     * and get value of index 0 is 0n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0065";
      try {
        let array1 = new Uint8ClampedArray([-1]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_6600
     * @tc.name         testBigInt64Constructor0066
     * @tc.desc         Testing Constructor of BigInt64Array with Uint8ClampedArray threshold value([255]),
     * and get value of index 0 is 255n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0066";
      try {
        let array1 = new Uint8ClampedArray([255]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('255');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_6700
     * @tc.name         testBigInt64Constructor0067
     * @tc.desc         Testing Constructor of BigInt64Array with Uint8ClampedArray out of bounds value([256]),
     * and get value of index 0 is 255n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0067";
      try {
        let array1 = new Uint8ClampedArray([256]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('255');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_6800
     * @tc.name         testBigInt64Constructor0068
     * @tc.desc         Testing Constructor of BigInt64Array with Uint8ClampedArray value([254]),
     * and get value of index 0 is 254n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0068";
      try {
        let array1 = new Uint8ClampedArray([254]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('254');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_6900
     * @tc.name         testBigInt64Constructor0069
     * @tc.desc         Testing Constructor of BigInt64Array with Int16Array threshold value([-32768]),
     * and get value of index 0 is -32768n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0069";
      try {
        let array1 = new Int16Array([-32768]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('-32768');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_7000
     * @tc.name         testBigInt64Constructor0070
     * @tc.desc         Testing Constructor of BigInt64Array with Int16Array out of bounds value([-32769]),
     * and get value of index 0 is 32767n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0070";
      try {
        let array1 = new Int16Array([-32769]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('32767');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_7100
     * @tc.name         testBigInt64Constructor0071
     * @tc.desc         Testing Constructor of BigInt64Array with Int16Array threshold value([32767]),
     * and get value of index 0 is 32767n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0071";
      try {
        let array1 = new Int16Array([32767]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('32767');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_7200
     * @tc.name         testBigInt64Constructor0072
     * @tc.desc         Testing Constructor of Uint8Array with Int16Array out of bounds value([32768]),
     * and get value of index 0 is -32768n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0072";
      try {
        let array1 = new Int16Array([32768]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('-32768');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_7300
     * @tc.name         testBigInt64Constructor0073
     * @tc.desc         Testing Constructor of BigInt64Array with Int16Array value([32766]),
     * and get value of index 0 is 32766n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0073";
      try {
        let array1 = new Int16Array([32766]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('32766');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_7400
     * @tc.name         testBigInt64Constructor0074
     * @tc.desc         Testing Constructor of BigInt64Array with Uint16Array threshold value([0]),
     * and get value of index 0 is 0n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0074";
      try {
        let array1 = new Uint16Array([0]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_7500
     * @tc.name         testBigInt64Constructor0075
     * @tc.desc         Testing Constructor of BigInt64Array with Uint16Array out of bounds value([-1]),
     * and get value of index 0 is 65535n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0075";
      try {
        let array1 = new Uint16Array([-1]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('65535');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_7600
     * @tc.name         testBigInt64Constructor0076
     * @tc.desc         Testing Constructor of BigInt64Array with Uint16Array threshold value([65535]),
     * and get value of index 0 is 65535n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0076";
      try {
        let array1 = new Uint16Array([65535]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('65535');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_7700
     * @tc.name         testBigInt64Constructor0077
     * @tc.desc         Testing Constructor of BigInt64Array with Uint16Array out of bounds value([65536]),
     * and get value of index 0 is 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0077";
      try {
        let array1 = new Uint16Array([65536]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_7800
     * @tc.name         testBigInt64Constructor0078
     * @tc.desc         Testing Constructor of BigInt64Array with Uint16Array value([65534]),
     * and get value of index 0 is 65534n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0078";
      try {
        let array1 = new Uint16Array([65534]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('65534');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_7900
     * @tc.name         testBigInt64Constructor0079
     * @tc.desc         Testing Constructor of BigInt64Array with Int32Array threshold value([-2147483648]),
     * and get value of index 0 is -2147483648n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0079";
      try {
        let array1 = new Int32Array([-2147483648]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('-2147483648');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_8000
     * @tc.name         testBigInt64Constructor0080
     * @tc.desc         Testing Constructor of BigInt64Array with Int32Array out of bounds value([-2147483649]),
     * and get value of index 0 is 2147483647n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0080";
      try {
        let array1 = new Int32Array([-2147483649]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(array[0]).assertEqual(2147483647n);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_8100
     * @tc.name         testBigInt64Constructor0081
     * @tc.desc         Testing Constructor of BigInt64Array with Int32Array threshold value([2147483647]),
     * and get value of index 0 is 2147483647n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0081";
      try {
        let array1 = new Int32Array([2147483647]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('2147483647');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_8200
     * @tc.name         testBigInt64Constructor0082
     * @tc.desc         Testing Constructor of BigInt64Array with Int32Array out of bounds value([2147483648]),
     * and get value of index 0 is -2147483648n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0082";
      try {
        let array1 = new Int32Array([2147483648]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(array[0]).assertEqual(-2147483648n);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_8300
     * @tc.name         testBigInt64Constructor0083
     * @tc.desc         Testing Constructor of BigInt64Array with Int32Array value([2147483646]),
     * and get value of index 0 is 2147483646n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0083";
      try {
        let array1 = new Int32Array([2147483646]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('2147483646');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_8400
     * @tc.name         testBigInt64Constructor0084
     * @tc.desc         Testing Constructor of BigInt64Array with Uint32Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0084";
      try {
        let array1 = new Uint32Array([0]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_8500
     * @tc.name         testBigInt64Constructor0085
     * @tc.desc         Testing Constructor of BigInt64Array with Uint32Array out of bounds value([-1]),
     * and get value of index 0 is 4294967295n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0085";
      try {
        let array1 = new Uint32Array([-1]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('4294967295');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_8600
     * @tc.name         testBigInt64Constructor0086
     * @tc.desc         Testing Constructor of BigInt64Array with Uint32Array threshold value([4294967295]),
     * and get value of index 0 is 4294967295n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0086";
      try {
        let array1 = new Uint32Array([4294967295]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(array[0]).assertEqual(4294967295n);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_8700
     * @tc.name         testBigInt64Constructor0087
     * @tc.desc         Testing Constructor of BigInt64Array with Uint32Array out of bounds value([4294967296]),
     * and get value of index 0 is 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0087";
      try {
        let array1 = new Uint32Array(new Array<number>(4294967296));
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(array[0]).assertEqual(0n);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_8800
     * @tc.name         testBigInt64Constructor0088
     * @tc.desc         Testing Constructor of BigInt64Array with Uint32Array value([4294967294]),
     * and get value of index 0 is 4294967294n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0088";
      try {
        let array1 = new Uint32Array(new Array<number>(4294967294));
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(array[0]).assertEqual(4294967294n);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_8900
     * @tc.name         testBigInt64Constructor0089
     * @tc.desc         Testing Constructor of BigInt64Array with Float32Array threshold value([-3.4028235 * 10^38]),
     * and get value of index 0 is 0n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0089";
      try {
        let MIN_VALUE = -3.4028235e38;
        let array1 = new Float32Array([MIN_VALUE]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(array[0]).assertEqual(0n);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_9000
     * @tc.name         testBigInt64Constructor0090
     * @tc.desc         Testing Constructor of BigInt64Array with Float32Array out of bounds value([-3.4028235 * 10^38 -1]),
     * and get value of index 0 is -5.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0090";
      try {
        let MIN_VALUE = -3.4028235e38 - 1;
        let array1 = new Float32Array([MIN_VALUE]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(array[0]).assertEqual(0n);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_9100
     * @tc.name         testBigInt64Constructor0091
     * @tc.desc         Testing Constructor of BigInt64Array with Float32Array threshold value([3.4028235 x 10^38]),
     * and get value of index 0 is 0n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0091";
      try {
        let MAX_VALUE = 3.4028235e38;
        let array1 = new Float32Array([MAX_VALUE]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(array[0]).assertEqual(0n);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_9200
     * @tc.name         testBigInt64Constructor0092
     * @tc.desc         Testing Constructor of BigInt64Array with Float32Array out of bounds value([3.4028235 x 10^38 + 1]),
     * and get value of index 0 is 5.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0092";
      try {
        let MAX_VALUE = 3.4028235e38 + 1;
        let array1 = new Float32Array([MAX_VALUE]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(array[0]).assertEqual(0n);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    
    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_9300
     * @tc.name         testBigInt64Constructor0093
     * @tc.desc         Testing Constructor of BigInt64Array with Float64Array threshold value([-1.8e308]),
     * and get value of index 0 is 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
it('testBigInt64Constructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0093";
      try {
        let MIN_VALUE:number = -1.8e308;
        let array1 = new Float64Array([MIN_VALUE]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(false).assertFail();
      } catch (e) {
        console.error(`${TAG} failed, error: ${e}`);
        console.log('xxx', e.name)
        expect(e.name).assertEqual('RangeError');
        console.log('xxx', e.message)
        expect(e.message).assertContain('the Double value -Infinity cannot be converted to a BigInt because it is not an integer');
      }
    });
    
    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_9400
     * @tc.name         testBigInt64Constructor0094
     * @tc.desc         Testing Constructor of BigInt64Array with Float64Array out of bounds value([-1.8e308 -1]),
     * and get value of index 0 is 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0094";
      try {
        let MIN_VALUE = -1.8e308 -1;
        let array1 = new Float64Array([MIN_VALUE]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(false).assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(err.name).assertEqual('RangeError');
        expect(err.message).assertContain('the Double value -Infinity cannot be converted to a BigInt because it is not an integer');
      }
    });
  
    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_9700
     * @tc.name         testBigInt64Constructor0097
     * @tc.desc         Testing Constructor of BigInt64Array with Uint8Array threshold value([-(2^63)]),
     * and get value of index 0 is 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0097";
      try {
        let array1 = new Uint8Array([0]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_9800
     * @tc.name         testBigInt64Constructor0098
     * @tc.desc         Testing Constructor of BigInt64Array with Uint8Array out of bounds value([-1]),
     * and get value of index 0 is 255n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0098";
      try {
        let array1 = new Uint8Array([-1]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('255');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_9900
     * @tc.name         testBigInt64Constructor0099
     * @tc.desc         Testing Constructor of BigInt64Array with Uint8Array threshold value([255]),
     * and get value of index 0 is 255n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0099";
      try {
        let array1 = new Uint8Array([255]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('255');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_10000
     * @tc.name         testBigInt64Constructor0100
     * @tc.desc         Testing Constructor of BigInt64Array with Uint8Array out of bounds value([256]),
     * and get value of index 0 is 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0100";
      try {
        let array1 = new Uint8Array([256]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_10100
     * @tc.name         testBigInt64Constructor0101
     * @tc.desc         Testing Constructor of BigInt64Array with BigUint64Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0101";
      try {
        const array1 = new BigUint64Array([0n]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_10200
     * @tc.name         testBigInt64Constructor0102
     * @tc.desc         Testing Constructor of BigInt64Array with BigUint64Array out of bounds value([-1]),
     * and get value of index 0 is -1n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0102";
      try {
        const array1 = new BigUint64Array([-1n]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_10300
     * @tc.name         testBigInt64Constructor0103
     * @tc.desc         Testing Constructor of BigInt64Array with BigUint64Array threshold value([2^64-1n]),
     * and get value of index 0 is -1n.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0103";
      try {
        const array1 = new BigUint64Array([18446744073709551615n]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(String(array[0])).assertEqual('-1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAY_CONSTRUCTOR_10400
     * @tc.name         testBigInt64Constructor0104
     * @tc.desc         Testing Constructor of BigInt64Array with BigUint64Array out of bounds value([2^64n]),
     * and get value of index 0 is 0.
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64Constructor0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64Constructor0104";
      try {
        const array1 = new BigUint64Array([18446744073709551616n]);
        let array = new BigInt64Array([BigInt(array1[0])]);
        expect(array[0]).assertEqual(0n);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYOF_10500
     * @tc.name         testBigInt64ArrayOf0105
     * @tc.desc         Testing static function of, of BigInt64Array value is positive infinity(+infinity).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayOf0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayOf0105";
      let flag = false;
      try {
        const bigNumber = BigInt(Number.POSITIVE_INFINITY);
        const array = BigInt64Array.of(bigNumber);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYOF_10600
     * @tc.name         testBigInt64ArrayOf0106
     * @tc.desc         Testing static function of, of BigInt64Array value is negative infinity(-infinity).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayOf0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayOf0106";
      let flag = false;
      try {
        const bigNumber = BigInt(Number.NEGATIVE_INFINITY);
        const array = BigInt64Array.of(bigNumber);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYOF_10700
     * @tc.name         testBigInt64ArrayOf0107
     * @tc.desc         Testing static function of, of BigInt64Array value is (NaN).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayOf0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayOf0107";
      let flag = false;
      try {
        const nanNumber = BigInt(Number.NaN);
        const array = BigInt64Array.of(nanNumber);
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYOF_10800
     * @tc.name         testBigInt64ArrayOf0108
     * @tc.desc         Testing static function of, of BigInt64Array value is bigint(12345678901234567890123456789n).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayOf0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayOf0108";
      try {
        const array = BigInt64Array.of(12345678901234567890123456789n);
        expect(String(array[0])).assertEqual('5097733592125636885');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYOF_10900
     * @tc.name         testBigInt64ArrayOf0109
     * @tc.desc         Testing static function of, of BigInt64Array threshold value is MAX_NUMBER(2*63 - 1).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayOf0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayOf0109";
      try {
        let array = BigInt64Array.of(9223372036854775807n);
        expect(String(array[0])).assertEqual('9223372036854775807');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYOF_11000
     * @tc.name         testBigInt64ArrayOf0110
     * @tc.desc         Testing static function of, of BigInt64Array threshold value is MIN_NUMBER(-2*63).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayOf0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayOf0110";
      try {
        let array = BigInt64Array.of(-9223372036854775808n);
        expect(String(array[0])).assertEqual('-9223372036854775808');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYOF_11100
     * @tc.name         testBigInt64ArrayOf0111
     * @tc.desc         Testing static function of, BigInt64Array value is out of bounds (-2*63-1).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayOf0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayOf0111";
      try {
        let array = BigInt64Array.of(-9223372036854775809n);
        expect(String(array[0])).assertEqual('9223372036854775807');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYOF_11200
     * @tc.name         testBigInt64ArrayOf0112
     * @tc.desc         Testing static function of, BigInt64Array value is out of bounds (2*63).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayOf0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayOf0112";
      try {
        let array = BigInt64Array.of(9223372036854775808n);
        expect(String(array[0])).assertEqual('-9223372036854775808');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYFROM_11400
     * @tc.name         testBigInt64ArrayFrom0114
     * @tc.desc         Testing static function from => func of BigInt64Array, value is infinity (+infinity).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayFrom0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayFrom0114";
      let flag = false;
      try {
        const bigNumber = BigInt(Number.POSITIVE_INFINITY);
        const array = BigInt64Array.from(new Array<BigInt>(bigNumber));
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYFROM_11500
     * @tc.name         testBigInt64ArrayFrom0115
     * @tc.desc         Testing static function from => func of BigInt64Array, value is infinity (-infinity).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayFrom0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayFrom0115";
      let flag = false;
      try {
        const bigNumber = BigInt(Number.NEGATIVE_INFINITY);
        const array = BigInt64Array.from(new Array<BigInt>(bigNumber));
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYFROM_11600
     * @tc.name         testBigInt64ArrayFrom0116
     * @tc.desc         Testing static function from => func of BigInt64Array, value is normal (NaN).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayFrom0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayFrom0116";
      let flag = false;
      try {
        const nanNumber = BigInt(Number.NaN);
        const array = BigInt64Array.from(new Array<BigInt>(nanNumber));
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYFROM_11700
     * @tc.name         testBigInt64ArrayFrom0117
     * @tc.desc         Testing static function from => func of BigInt64Array, value is normal ([1,2,3]).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayFrom0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayFrom0117";
      try {
        let array = BigInt64Array.from(new Array<BigInt>(BigInt(1), BigInt(2), BigInt(3)));
        expect(String(array[0])).assertEqual('1');
        expect(String(array[1])).assertEqual('2');
        expect(String(array[2])).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYFROM_11800
     * @tc.name         testBigInt64ArrayFrom0118
     * @tc.desc         Testing static function from => func of BigInt64Array, value is normal ([1.1,2.83]).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayFrom0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayFrom0118";
      let flag = false;
      try {
        let array = BigInt64Array.from(new Array<BigInt>(BigInt(1.1), BigInt(2.83)));
        expect(false).assertFail();
      } catch (err) {
        if (err instanceof RangeError) {
          flag = true;
          expect(flag).assertTrue();
        } else {
          console.error(`Unexpected error: ${err}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number       SUB_COMMONLIBRARY_UTIL_BASE_BIGINT64ARRAYFROM_11900
     * @tc.name         testBigInt64ArrayFrom0119
     * @tc.desc         Testing static function from => func of BigInt64Array, value is normal ([12345678901234567890n]).
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('testBigInt64ArrayFrom0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBigInt64ArrayFrom0119";
      try {
        let array = BigInt64Array.from(new Array<BigInt>(12345678901234567890123456789n));
        expect(String(array[0])).assertEqual('5097733592125636885');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
  })
}
