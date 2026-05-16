/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';

export default function Uint32ArrayTest() {
  describe('Uint32ArrayTest', () :void=> {
    afterEach(() => {
      await Utils.msSleep(100);
    })
    let value: string;
    // // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    // beforeAll(() :void=> {
    //   // Presets an action, which is performed only once before all test cases of the test suite start.
    //   // This API supports only one parameter: preset action function.
    // })
    // beforeEach(() :void=> {
    //   // Presets an action, which is performed before each unit test case starts.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: preset action function.
    // })
    // afterEach(async (done:Function) => {
    //   // Presets a clear action, which is performed after each unit test case ends.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: clear action function.
    //   console.info('TypeArray after each called');
    //   value == '';
    //   await sleep(10);
    //   done();
    // })
    // afterAll(() :void=> {
    //   // Presets a clear action, which is performed after all test cases of the test suite end.
    //   // This API supports only one parameter: clear action function.
    // })

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_0100
     * @tc.name        testUint32ArrayConstructor0001
     * @tc.desc        Testing Constructor of Uint32Array without param.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0001";
      try {
        let array = new Uint32Array();
        expect(String(array)).assertEqual('');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_0200
     * @tc.name        testUint32ArrayConstructor0002
     * @tc.desc        Testing Constructor of Uint32Array with length 0,and set index 0 with 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0002";
      let flag = false;
      try {
        let array = new Uint32Array(0);
        array[0] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_0300
     * @tc.name        testUint32ArrayConstructor0003
     * @tc.desc        Testing Constructor of Uint32Array with length 10,and set index 0 with 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0003";
      try {
        let array = new Uint32Array(10);
        array[0] = 3;
        expect(String(array[0])).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_0400
     * @tc.name        testUint32ArrayConstructor0004
     * @tc.desc        Testing Constructor of Uint32Array with length 10,and set index 10 with 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0004";
      let flag = false;
      try {
        let array = new Uint32Array(10);
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_0500
     * @tc.name        testUint32ArrayConstructor0005
     * @tc.desc        Testing Constructor of Uint32Array with length 10,and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0005";
      try {
        let array = new Uint32Array(10);
        expect(String(array[1])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_0800
     * @tc.name        testUint32ArrayConstructor0008
     * @tc.desc        Testing Constructor of Uint32Array with arraynew Array<number>(21,31),and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0008";
      try {
        let array = new Uint32Array(new Array<number>(21,31));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_0900
     * @tc.name        testUint32ArrayConstructor0009
     * @tc.desc        Testing Constructor of Uint32Array with arraynew Array<number>(21,31),and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0009";
      try {
        let array = new Uint32Array(new Array<number>(21,31));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_1000
     * @tc.name        testUint32ArrayConstructor0010
     * @tc.desc        Testing Constructor of Uint32Array with arraynew Array<number>(21,31),and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0010";
      let flag = false;
      try {
        let array = new Uint32Array(new Array<number>(21,31));
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_1100
     * @tc.name        testUint32ArrayConstructor0011
     * @tc.desc        Testing Constructor of Uint32Array with arraynew Array<number>(21,31),and set value of index 10,get value of index 10.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0011";
      let flag = false;
      try {
        let array = new Uint32Array(new Array<number>(21,31));
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_1200
     * @tc.name        testUint32ArrayConstructor0012
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array which construct by array new Array<number>(21,31),and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0012";
      try {
        let array = new Uint32Array(new Uint32Array(new Array<number>(21,31)));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_1300
     * @tc.name        testUint32ArrayConstructor0013
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array which construct by array new Array<number>(21,31),and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0013";
      try {
        let array = new Uint32Array(new Uint32Array(new Array<number>(21,31)));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_1400
     * @tc.name        testUint32ArrayConstructor0014
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array which construct by array new Array<number>(21,31),and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0014";
      let flag = false;
      try {
        let array = new Uint32Array(new Uint32Array(new Array<number>(21,31)));
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_1500
     * @tc.name        testUint32ArrayConstructor0015
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array which construct by array new Array<number>(21,31),and set value of index 10,and get value of index 10.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0015";
      let flag = false;
      try {
        let array = new Uint32Array(new Uint32Array(new Array<number>(21,31)));
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_1600
     * @tc.name        testUint32ArrayConstructor0016
     * @tc.desc        Testing Constructor of Uint32Array with Array,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0016";
      try {
        let array = new Uint32Array(new Array<number>(21,31));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_1700
     * @tc.name        testUint32ArrayConstructor0017
     * @tc.desc        Testing Constructor of Uint32Array with Array,and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0017";
      try {
        let array = new Uint32Array(new Array<number>(21,31));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_1800
     * @tc.name        testUint32ArrayConstructor0018
     * @tc.desc        Testing Constructor of Uint32Array with Array,and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0018";
      let flag = false;
      try {
        let array = new Uint32Array(new Array<number>(21,31));
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_1900
     * @tc.name        testUint32ArrayConstructor0019
     * @tc.desc        Testing Constructor of Uint32Array with ArrayBuffer,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0019";
      let flag = false;
      try {
        let array = new Uint32Array(new Uint32Array(new Array<number>(21,31)));
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_2000
     * @tc.name        testUint32ArrayConstructor0020
     * @tc.desc        Testing Constructor of Int32Array with Uint8Array,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0020";
      try {
        let array = new Uint32Array(new Int8Array(new Array<number>(21,31)));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_2100
     * @tc.name        testUint32ArrayConstructor0021
     * @tc.desc        Testing Constructor of Uint32Array with Int8Array,and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0021";
      try {
        let array = new Uint32Array(new Int8Array(new Array<number>(21,31)));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_2200
     * @tc.name        testUint32ArrayConstructor0022
     * @tc.desc        Testing Constructor of Uint32Array with Int8Array,and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0022";
      let flag = false;
      try {
        let array = new Uint32Array(new Int8Array(new Array<number>(21,31)));
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_2300
     * @tc.name        testUint32ArrayConstructor0023
     * @tc.desc        Testing Constructor of Int32Array with Int8Array,Set array[10] element and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0023";
      let flag = false;
      try {
        let array = new Uint32Array(new Int8Array(new Array<number>(21,31)));
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_2400
     * @tc.name        testUint32ArrayConstructor0024
     * @tc.desc        Testing Constructor of Uint32Array with Uint8Array,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0024";
      try {
        let array = new Int32Array(new Uint8Array(new Array<number>(21,31)));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_2500
     * @tc.name        testUint32ArrayConstructor0025
     * @tc.desc        Testing Constructor of Uint32Array with Uint8Array,and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0025";
      try {
        let array = new Uint32Array(new Uint8Array(new Array<number>(21,31)));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_2600
     * @tc.name        testUint32ArrayConstructor0026
     * @tc.desc        Testing Constructor of Uint32Array with Uint8Array,and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0026";
      let flag = false;
      try {
        let array = new Uint32Array(new Uint8Array(new Array<number>(21,31)));
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_2700
     * @tc.name        testUint32ArrayConstructor0027
     * @tc.desc        Testing Constructor of Uint32Array with Uint8Array,Set array[10] element and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0027";
      let flag = false;
      try {
        let array = new Uint32Array(new Uint8Array(new Array<number>(21,31)));
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_2800
     * @tc.name        testUint32ArrayConstructor0028
     * @tc.desc        Testing Constructor of Uint32Array with Uint8ClampedArray,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0028";
      try {
        let array = new Uint32Array(new Uint8ClampedArray(new Array<number>(21,31)));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_2900
     * @tc.name        testUint32ArrayConstructor0029
     * @tc.desc        Testing Constructor of Uint32Array with Uint8ClampedArray,and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0029";
      try {
        let array = new Uint32Array(new Uint8ClampedArray(new Array<number>(21,31)));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_3000
     * @tc.name        testUint32ArrayConstructor0030
     * @tc.desc        Testing Constructor of Uint32Array with Uint8ClampedArray,and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0030";
      let flag = false;
      try {
        let array = new Uint32Array(new Uint8ClampedArray(new Array<number>(21,31)));
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_3100
     * @tc.name        testUint32ArrayConstructor0031
     * @tc.desc        Testing Constructor of Uint32Array with Uint8ClampedArray,
     * Set array[10] element and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0031";
      let flag = false;
      try {
        let array = new Uint32Array(new Uint8ClampedArray(new Array<number>(21,31)));
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_3200
     * @tc.name        testUint32ArrayConstructor0032
     * @tc.desc        Testing Constructor of Uint32Array with Int16Array,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0032";
      try {
        let array = new Uint32Array(new Int16Array(new Array<number>(21,31)));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_3300
     * @tc.name        testUint32ArrayConstructor0033
     * @tc.desc        Testing Constructor of Uint32Array with Int16Array,and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0033";
      try {
        let array = new Uint32Array(new Int16Array(new Array<number>(21,31)));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_3400
     * @tc.name        testUint32ArrayConstructor0034
     * @tc.desc        Testing Constructor of Uint32Array with Int16Array,and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0034";
      let flag = false;
      try {
        let array = new Uint32Array(new Int16Array(new Array<number>(21,31)));
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_3500
     * @tc.name        testUint32ArrayConstructor0035
     * @tc.desc        Testing Constructor of Uint32Array with Int16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0035";
      let flag = false;
      try {
        let array = new Uint32Array(new Int16Array(new Array<number>(21,31)));
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_3600
     * @tc.name        testUint32ArrayConstructor0036
     * @tc.desc        Testing Constructor of Uint32Array with Uint16Array,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0036";
      try {
        let array = new Uint32Array(new Uint16Array(new Array<number>(21,31)));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_3700
     * @tc.name        testUint32ArrayConstructor0037
     * @tc.desc        Testing Constructor of Uint32Array with Uint16Array,and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0037";
      try {
        let array = new Uint32Array(new Uint16Array(new Array<number>(21,31)));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_3800
     * @tc.name        testUint32ArrayConstructor0038
     * @tc.desc        Testing Constructor of Uint32Array with Uint16Array,and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0038";
      let flag = false;
      try {
        let array = new Uint32Array(new Uint16Array(new Array<number>(21,31)));
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_3900
     * @tc.name        testUint32ArrayConstructor0039
     * @tc.desc        Testing Constructor of Uint32Array with Uint16Array,
     * Set array[10] element and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0039";
      let flag = false;
      try {
        let array = new Uint32Array(new Uint16Array(new Array<number>(21,31)));
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_4000
     * @tc.name        testUint32ArrayConstructor0040
     * @tc.desc        Testing Constructor of Uint32Array with Int32Array,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0040";
      try {
        let array = new Uint32Array(new Int32Array(new Array<number>(21,31)));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_4100
     * @tc.name        testUint32ArrayConstructor0041
     * @tc.desc        Testing Constructor of Uint32Array with Int32Array,and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0041";
      try {
        let array = new Uint32Array(new Int32Array(new Array<number>(21,31)));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_4200
     * @tc.name        testUint32ArrayConstructor0042
     * @tc.desc        Testing Constructor of Uint32Array with Int32Array,and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0042";
      let flag = false;
      try {
        let array = new Uint32Array(new Int32Array(new Array<number>(21,31)));
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_4300
     * @tc.name        testUint32ArrayConstructor0043
     * @tc.desc        Testing Constructor of Uint32Array with Int32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0043";
      let flag = false;
      try {
        let array = new Uint32Array(new Int32Array(new Array<number>(21,31)));
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_4400
     * @tc.name        testUint32ArrayConstructor0044
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0044";
      try {
        let array = new Uint32Array(new Uint32Array(new Array<number>(21,31)));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_4500
     * @tc.name        testUint32ArrayConstructor0045
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array,and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0045";
      try {
        let array = new Uint32Array(new Uint32Array(new Array<number>(21,31)));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_4600
     * @tc.name        testUint32ArrayConstructor0046
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array,and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0046";
      let flag = false;
      try {
        let array = new Uint32Array(new Uint32Array(new Array<number>(21,31)));
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_4700
     * @tc.name        testUint32ArrayConstructor0047
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0047";
      let flag = false;
      try {
        let array = new Uint32Array(new Uint32Array(new Array<number>(21,31)));
        array[10] = 3;
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

    /** map问题
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_4800
     * @tc.name        testUint32ArrayConstructor0048
     * @tc.desc        Testing Constructor of Uint32Array with BigInt64Array,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0048";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigInt64Array([-21n, 31n]);
        // new Uint32Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const uint32Array  = new Uint32Array(byteLength * 2); // because Uint32 is 4 byte,BigInt64 is 8 byte,buffer * 2.
    
        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Uint32Array
          const bytes = new Uint32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(String(uint32Array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_5000
     * @tc.name        testUint32ArrayConstructor0050
     * @tc.desc        Testing Constructor of Uint32Array with BigUint64Array,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0050";
      try {
        // creat bigInt64Array
        const bigInt64Array = new BigUint64Array([21n, 31n]);
        // new Uint32Array
        const byteLength = bigInt64Array.buffer.byteLength;
        const uint32Array  = new Uint32Array(byteLength * 2); // because Uint32 is 4 byte,BigInt64 is 8 byte,buffer * 2.
    
        let offset = 0;
        for (const num of bigInt64Array) {
          // BigInt => Uint32Array
          const bytes = new Uint32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(String(uint32Array[0])).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_5200
     * @tc.name        testUint32ArrayConstructor0052
     * @tc.desc        Testing Constructor of Uint32Array with Float32Array,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0052";
      try {
        let array = new Uint32Array(new Float32Array(new Array<number>(21,31)));
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_5300
     * @tc.name        testUint32ArrayConstructor0053
     * @tc.desc        Testing Constructor of Uint32Array with Float32Array,and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0053";
      try {
        let array = new Uint32Array(new Float32Array(new Array<number>(21,31)));
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_5400
     * @tc.name        testUint32ArrayConstructor0054
     * @tc.desc        Testing Constructor of Uint32Array with Float32Array,and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0054";
      let flag = false;
      try {
        let array = new Uint32Array(new Float32Array(new Array<number>(21,31)));
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_5500
     * @tc.name        testUint32ArrayConstructor0055
     * @tc.desc        Testing Constructor of Uint32Array with Float32Array,
     * Set array[10] element and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0055";
      let flag = false;
      try {
        let array = new Uint32Array(new Float32Array(new Array<number>(21,31)));
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_5600
     * @tc.name        testUint32ArrayConstructor0056
     * @tc.desc        Testing Constructor of Uint32Array with ArrayBuffer,and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0056";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint32Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_5700
     * @tc.name        testUint32ArrayConstructor0057
     * @tc.desc        Testing Constructor of Uint32Array with ArrayBuffer,and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0057";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint32Array(buffer);
        array[0] = 21;
        array[1] = 31;
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_5800
     * @tc.name        testUint32ArrayConstructor0058
     * @tc.desc        Testing Constructor of Uint32Array with ArrayBuffer,and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0058";
      let flag = false;
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint32Array(buffer);
        array[0] = 21;
        array[1] = 31;
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_5900
     * @tc.name        testUint32ArrayConstructor0059
     * @tc.desc        Testing Constructor of Uint32Array with ArrayBuffer,Set array[10] and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0059";
      let flag = false;
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint32Array(buffer);
        array[0] = 21;
        array[1] = 31;
        array[10] = 5;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_6000
     * @tc.name        testUint32ArrayConstructor0060
     * @tc.desc        Testing Constructor of Uint32Array with (ArrayBuffer,0,2),and get value of index 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0060";
      try {
        let buffer = new ArrayBuffer(10);
        let array = new Uint32Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_6100
     * @tc.name        testUint32ArrayConstructor0061
     * @tc.desc        Testing Constructor of Uint32Array with (ArrayBuffer,0,2),and get value of index 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0061";
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint32Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_6200
     * @tc.name        testUint32ArrayConstructor0062
     * @tc.desc        Testing Constructor of Uint32Array with (ArrayBuffer,0,2),and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0062";
      let flag = false;
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint32Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_6300
     * @tc.name        testUint32ArrayConstructor0063
     * @tc.desc        Testing Constructor of Uint32Array with (ArrayBuffer,0,2),
     * Set array[10] and get value of index 3.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0063";
      let flag = false;
      try {
        let buffer = new ArrayBuffer(8);
        let array = new Uint32Array(buffer, 0, 2);
        array[0] = 21;
        array[1] = 31;
        array[10] = 5;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_BYTESPERELEMENT_6400
     * @tc.name        testUint32ArrayBytesPerElement0064
     * @tc.desc        Testing BYTES_PER_ELEMENT of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayBytesPerElement0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayBytesPerElement0064";
      try {
        let bytes = Uint32Array.BYTES_PER_ELEMENT;
        expect(String(bytes)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_FROM_7000
     * @tc.name        testUint32ArrayFrom0070
     * @tc.desc        Testing static function from of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayFrom0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayFrom0070";
      try {
        let array = Uint32Array.from(Array.from(new Array<number>(1, 2, 3), (x:number) => x + x));
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_OF_7100
     * @tc.name        testUint32ArrayOf0071
     * @tc.desc        Testing static function of of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0071";
      try {
        let array = Uint32Array.of();
        expect(String(array)).assertEqual('');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_OF_7200
     * @tc.name        testUint32ArrayOf0072
     * @tc.desc        Testing static function of of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0072";
      try {
        let array = Uint32Array.of(0);
        array[0] = 3;
        expect(String(array[0])).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_OF_7300
     * @tc.name        testUint32ArrayOf0073
     * @tc.desc        Testing static function of of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0073";
      try {
        let array = Uint32Array.of(10);
        array[0] = 3;
        expect(String(array[0])).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_OF_7400
     * @tc.name        testUint32ArrayOf0074
     * @tc.desc        Testing static function of of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0074";
      let flag = false;
      try {
        let array = Uint32Array.of(10);
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_OF_7500
     * @tc.name        testUint32ArrayOf0075
     * @tc.desc        Testing static function of of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0075";
      let flag = false;
      try {
        let array = Uint32Array.of(10);
        array[1] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_OF_7600
     * @tc.name        testUint32ArrayOf0076
     * @tc.desc        Testing static function of of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0076";
      try {
        let array = Uint32Array.of(21, 31);
        expect(String(array[0])).assertEqual('21');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_OF_7700
     * @tc.name        testUint32ArrayOf0077
     * @tc.desc        Testing static function of of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0077";
      try {
        let array = Uint32Array.of(21, 31);
        expect(String(array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_OF_7800
     * @tc.name        testUint32ArrayOf0078
     * @tc.desc        Testing static function of of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0078";
      let flag = false;
      try {
        let array = Uint32Array.of(21, 31);
        array[3] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_OF_7900
     * @tc.name        testUint32ArrayOf0079
     * @tc.desc        Testing static function of of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0079";
      let flag = false;
      try {
        let array = Uint32Array.of(21, 31);
        array[10] = 3;
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_BYTEOFFSET_8000
     * @tc.name        testUint32ArrayByteOffset0080
     * @tc.desc        Testing instance property byteOffset of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayByteOffset0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayByteOffset0080";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint32Array(buffer);
        expect(String(arrayOffSet0.byteOffset)).assertEqual('0');
        const arrayOffSet8 = new Uint32Array(buffer, 8);
        expect(String(arrayOffSet8.byteOffset)).assertEqual('8');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_BYTELENGTH_8100
     * @tc.name        testUint32ArrayByteLength0081
     * @tc.desc        Testing instance property byteLength of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayByteLength0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayByteLength0081";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint32Array(buffer);
        expect(String(arrayOffSet0.byteLength)).assertEqual('32');
        const arrayOffSet8 = new Uint32Array(buffer, 8);
        expect(String(arrayOffSet8.byteLength)).assertEqual('24');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_BUFFER_8200
     * @tc.name        testUint32ArrayBuffer0082
     * @tc.desc        Testing instance property buffer of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayBuffer0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayBuffer0082";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint32Array(buffer);
        expect(String((arrayOffSet0.buffer as ArrayBuffer).byteLength)).assertEqual('32');
        const arrayOffSet8 = new Uint32Array(buffer, 8);
        expect(String((arrayOffSet8.buffer as ArrayBuffer).byteLength)).assertEqual('32');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_LENGTH_8300
     * @tc.name        testUint32ArrayLength0083
     * @tc.desc        Testing instance function length of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayLength0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayLength0083";
      try {
        const buffer = new ArrayBuffer(32);
        const arrayOffSet0 = new Uint32Array(buffer);
        expect(String(arrayOffSet0.length)).assertEqual('8');
        const arrayOffSet8 = new Uint32Array(buffer, 8);
        expect(String(arrayOffSet8.length)).assertEqual('6');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_8500
     * @tc.name        testUint32ArrayConstructor0085
     * @tc.desc        Testing Constructor of Uint32Array with Int8Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0085";
      try {
        const array = new Int8Array(new Array<number>(21,31))
        let uint32Array = new Uint32Array(array);
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_8600
     * @tc.name        testUint32ArrayConstructor0086
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0086";
      try {
        const array = new Uint32Array(new Array<number>(21,31))
        let uint32Array = new Uint32Array(array);
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_8700
     * @tc.name        testUint32ArrayConstructor0087
     * @tc.desc        Testing Constructor of Uint32Array with Uint8ClampedArray.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0087";
      try {
        const array = new Uint8ClampedArray(new Array<number>(21,31))
        let uint32Array = new Uint32Array(array);
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_8800
     * @tc.name        testUint32ArrayConstructor0088
     * @tc.desc        Testing Constructor of Uint32Array with Int16Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0088";
      try {
        const array = new Int16Array(new Array<number>(21,31))
        let uint32Array = new Uint32Array(array);
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_8900
     * @tc.name        testUint32ArrayConstructor0089
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0089";
      try {
        const array = new Uint32Array(new Array<number>(21,31))
        let uint32Array = new Uint32Array(array);
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_9000
     * @tc.name        testUint32ArrayConstructor0090
     * @tc.desc        Testing Constructor of Uint32Array with Int32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0090";
      try {
        const array = new Int32Array(new Array<number>(21,31))
        let uint32Array = new Uint32Array(array);
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_9100
     * @tc.name        testUint32ArrayConstructor0091
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0091";
      try {
        const array = new Uint32Array(new Array<number>(21,31))
        let uint32Array = new Uint32Array(array);
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_9400
     * @tc.name        testUint32ArrayConstructor0094
     * @tc.desc        Testing Constructor of Uint32Array with Float32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
   it('testUint32ArrayConstructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0094";
      try {
        const array = new Float32Array(new Array<number>(21,31));
        let uint32Array = new Uint32Array(array);
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_length_9500
     * @tc.name        testUint32ArrayLength0095
     * @tc.desc        Testing instance function length of Uint32Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayLength0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayLength0095";
      try {
        let uint32Array = new Uint32Array(8);
        expect(String(uint32Array.length)).assertEqual('8');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_9700
     * @tc.name        testUint32ArrayConstructor0097
     * @tc.desc        Testing Constructor of Uint32Array with Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0097";
      try {
        let array: Array<number> = new Array<number>(21,31);
        let uint32Array = new Uint32Array(array);
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_9800
     * @tc.name        testUint32ArrayConstructor0098
     * @tc.desc        Testing Constructor of Uint32Array with Array.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0098";
      try {
        let array: Array<number> = new Array<number>(21,31);
        let uint32Array = new Uint32Array(array);
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_9900
     * @tc.name        testUint32ArrayConstructor0099
     * @tc.desc        Testing Constructor of Uint32Array with ArrayBuffer.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0099";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let uint32Array = new Uint32Array(arrayBuffer);
        uint32Array[0] = 21;
        uint32Array[1] = 31;
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
        expect(String(uint32Array[3])).assertEqual('0');   
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_10000
     * @tc.name        testUint32ArrayConstructor0100
     * @tc.desc        Testing Constructor of Uint32Array with ArrayBuffer.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayConstructor0100";
      try {
        let arrayBuffer = new ArrayBuffer(16);
        let uint32Array = new Uint32Array(arrayBuffer, 0, 2);
        uint32Array[0] = 21;
        uint32Array[1] = 31;
        expect(String(uint32Array[0])).assertEqual('21');
        expect(String(uint32Array[1])).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_11000
     * @tc.name        testUint32Constructor0110
     * @tc.desc        Testing Constructor of Uint32Array with threshold value([0]),and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0110";
      try {
        let array = new Uint32Array([0]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_11100
     * @tc.name        testUint32Constructor0111
     * @tc.desc        Testing Constructor of Uint32Array with out of bounds value([-1]),
     * and get value of index 0 is 4294967295.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0111";
      try {
        let array = new Uint32Array([-1]);
        expect(String(array[0])).assertEqual('4294967295');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_11200
     * @tc.name        testUint32Constructor0112
     * @tc.desc        Testing Constructor of Uint32Array with threshold value([4294967295]),
     * and get value of index 0 is 255.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0112";
      try {
        let array = new Uint32Array([4294967295]);
        expect(String(array[0])).assertEqual('4294967295');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_11300
     * @tc.name        testUint32Constructor0113
     * @tc.desc        Testing Constructor of Uint32Array with out of bounds value([4294967296]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0113";
      try {
        let array = new Uint32Array([4294967296]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_11400
     * @tc.name        testUint32Constructor0114
     * @tc.desc        Testing Constructor of Uint32Array with Int8Array threshold value([-128]),
     * and get value of index 0 is 4294967168.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0114";
      try {
        let array = new Uint32Array(new Int8Array([-128]));
        expect(String(array[0])).assertEqual('4294967168');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_11500
     * @tc.name        testUint32Constructor0115
     * @tc.desc        Testing Constructor of Uint32Array with Int8Array out of bounds value([-129]),
     * and get value of index 0 is 127.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0115";
      try {
        let array = new Uint32Array(new Int8Array([-129]));
        expect(String(array[0])).assertEqual('127');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_11600
     * @tc.name        testUint32Constructor0116
     * @tc.desc        Testing Constructor of Uint32Array with Int8Array threshold value([127]),
     * and get value of index 0 is 127.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0116";
      try {
        let array = new Uint32Array(new Int8Array([127]));
        expect(String(array[0])).assertEqual('127');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_11700
     * @tc.name        testUint32Constructor0117
     * @tc.desc        Testing Constructor of Uint32Array with Int8Array value([126]),
     * and get value of index 0 is 126.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0117";
      try {
        let array = new Uint32Array(new Int8Array([126]));
        expect(String(array[0])).assertEqual('126');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_11800
     * @tc.name        testUint32Constructor0118
     * @tc.desc        Testing Constructor of Uint32Array with Int8Array out of bounds value([128]),
     * and get value of index 0 is 4294967168.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0118";
      try {
        let array = new Uint32Array(new Int8Array([128]));
        expect(String(array[0])).assertEqual('4294967168');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_11900
     * @tc.name        testUint32Constructor0119
     * @tc.desc        Testing Constructor of Uint32Array with Uint8ClampedArray threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0119";
      try {
        let array = new Uint32Array(new Uint8ClampedArray([0]));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_12000
     * @tc.name        testUint32Constructor0120
     * @tc.desc        Testing Constructor of Uint32Array with Uint8ClampedArray out of bounds value([-1]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0120";
      try {
        let array = new Uint32Array(new Uint8ClampedArray([-1]));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_12100
     * @tc.name        testUint32Constructor0121
     * @tc.desc        Testing Constructor of Uint32Array with Uint8ClampedArray threshold value([255]),
     * and get value of index 0 is 255.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0121";
      try {
        let array = new Uint32Array(new Uint8ClampedArray([255]));
        expect(String(array[0])).assertEqual('255');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_12200
     * @tc.name        testUint32Constructor0122
     * @tc.desc        Testing Constructor of Uint32Array with Uint8ClampedArray out of bounds value([256]),
     * and get value of index 0 is 255.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0122";
      try {
        let array = new Uint32Array(new Uint8ClampedArray([256]));
        expect(String(array[0])).assertEqual('255');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_12300
     * @tc.name        testUint32Constructor0123
     * @tc.desc        Testing Constructor of Uint32Array with Uint8ClampedArray value([254]),
     * and get value of index 0 is 254.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0123";
      try {
        let array = new Uint32Array(new Uint8ClampedArray([254]));
        expect(String(array[0])).assertEqual('254');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_12400
     * @tc.name        testUint32Constructor0124
     * @tc.desc        Testing Constructor of Uint32Array with Int16Array threshold value([-32768]),
     * and get value of index 0 is 4294934528.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0124";
      try {
        let array = new Uint32Array(new Int16Array([-32768]));
        expect(String(array[0])).assertEqual('4294934528');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_12500
     * @tc.name        testUint32Constructor0125
     * @tc.desc        Testing Constructor of Uint32Array with Int16Array out of bounds value([-32769]),
     * and get value of index 0 is 32767.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0125";
      try {
        let array = new Uint32Array(new Int16Array([-32769]));
        expect(String(array[0])).assertEqual('32767');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_12600
     * @tc.name        testUint32Constructor0126
     * @tc.desc        Testing Constructor of Uint32Array with Int16Array threshold value([32767]),
     * and get value of index 0 is 32767.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0126";
      try {
        let array = new Uint32Array(new Int16Array([32767]));
        expect(String(array[0])).assertEqual('32767');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_12700
     * @tc.name        testUint32Constructor0127
     * @tc.desc        Testing Constructor of Uint32Array with Int16Array out of bounds value([32768]),
     * and get value of index 0 is 4294934528.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0127";
      try {
        let array = new Uint32Array(new Int16Array([32768]));
        expect(String(array[0])).assertEqual('4294934528');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_12800
     * @tc.name        testUint32Constructor0128
     * @tc.desc        Testing Constructor of Uint32Array with Int16Array value([32766]),
     * and get value of index 0 is 32766.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0128";
      try {
        let array = new Uint32Array(new Int16Array([32766]));
        expect(String(array[0])).assertEqual('32766');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_12900
     * @tc.name        testUint32Constructor0129
     * @tc.desc        Testing Constructor of Uint32Array with Uint16Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0129";
      try {
        let array = new Uint32Array(new Uint16Array([0]));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_13000
     * @tc.name        testUint32Constructor0130
     * @tc.desc        Testing Constructor of Uint32Array with Uint16Array out of bounds value([-1]),
     * and get value of index 0 is 65535.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0130";
      try {
        let array = new Uint32Array(new Uint16Array([-1]));
        expect(String(array[0])).assertEqual('65535');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_13100
     * @tc.name        testUint32Constructor0131
     * @tc.desc        Testing Constructor of Uint32Array with Uint16Array threshold value([65535]),
     * and get value of index 0 is 65535.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0131";
      try {
        let array = new Uint32Array(new Uint16Array([65535]));
        expect(String(array[0])).assertEqual('65535');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_13200
     * @tc.name        testUint32Constructor0132
     * @tc.desc        Testing Constructor of Uint32Array with Uint16Array out of bounds value([65536]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0132";
      try {
        let array = new Uint32Array(new Uint16Array([65536]));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_13300
     * @tc.name        testUint32Constructor0133
     * @tc.desc        Testing Constructor of Uint32Array with Uint16Array value([65534]),
     * and get value of index 0 is 65534.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0133";
      try {
        let array = new Uint32Array(new Uint16Array([65534]));
        expect(String(array[0])).assertEqual('65534');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_13400
     * @tc.name        testUint32Constructor0134
     * @tc.desc        Testing Constructor of Uint32Array with Int32Array threshold value([-2147483648]),
     * and get value of index 0 is 2147483648.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0134";
      try {
        let array = new Uint32Array(new Int32Array([-2147483648]));
        expect(String(array[0])).assertEqual('2147483648');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_13500
     * @tc.name        testUint32Constructor0135
     * @tc.desc        Testing Constructor of Uint32Array with Int32Array out of bounds value([-2147483649]),
     * and get value of index 0 is 2147483647.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0135";
      try {
        let array = new Uint32Array(new Int32Array([-2147483649]));
        expect(String(array[0])).assertEqual('2147483647');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_13600
     * @tc.name        testUint32Constructor0136
     * @tc.desc        Testing Constructor of Uint32Array with Int32Array threshold value([2147483647]),
     * and get value of index 0 is 2147483647.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0136";
      try {
        let array = new Uint32Array(new Int32Array([2147483647]));
        expect(String(array[0])).assertEqual('2147483647');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_13700
     * @tc.name        testUint32Constructor0137
     * @tc.desc        Testing Constructor of Uint32Array with Int32Array out of bounds value([2147483648]),
     * and get value of index 0 is 2147483648.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0137";
      try {
        let array = new Uint32Array(new Int32Array( new Array<number>(2147483648)));
        expect(String(array[0])).assertEqual('2147483648');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_13800
     * @tc.name        testUint32Constructor0138
     * @tc.desc        Testing Constructor of Uint32Array with Int32Array value([2147483646]),
     * and get value of index 0 is 2147483646.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0138";
      try {
        let array = new Uint32Array(new Int32Array([2147483646]));
        expect(String(array[0])).assertEqual('2147483646');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_13900
     * @tc.name        testUint32Constructor0139
     * @tc.desc        Testing Constructor of Uint32Array with Uint8Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0139";
      try {
        let array = new Uint32Array(new Uint8Array([0]));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_14000
     * @tc.name        testUint32Constructor0140
     * @tc.desc        Testing Constructor of Uint32Array with Uint8Array out of bounds value([-1]),
     * and get value of index 0 is 255.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0140";
      try {
        let array = new Uint32Array(new Uint8Array([-1]));
        expect(String(array[0])).assertEqual('255');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_14100
     * @tc.name        testUint32Constructor0141
     * @tc.desc        Testing Constructor of Uint32Array with Uint8Array threshold value([255]),
     * and get value of index 0 is 255.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0141";
      try {
        let array = new Uint32Array(new Uint8Array([255]));
        expect(String(array[0])).assertEqual('255');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_14200
     * @tc.name        testUint32Constructor0142
     * @tc.desc        Testing Constructor of Uint32Array with Uint32Array out of bounds value([256]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0142";
      try {
        let array = new Uint32Array(new Uint8Array([256]));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_14300
     * @tc.name        testUint32Constructor0143
     * @tc.desc        Testing Constructor of Uint32Array with Uint8Array value([254]),
     * and get value of index 0 is 254.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0143";
      try {
        let array = new Uint32Array(new Uint8Array([254]));
        expect(String(array[0])).assertEqual('254');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_14400
     * @tc.name        testUint32Constructor0144
     * @tc.desc        Testing Constructor of Uint32Array with Float32Array threshold value([-3.4028235 * 10^38]),
     * and get value of index 0 is 4294967288.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0144";
      try {
        let MIN_VALUE = -3.4028235e38;
        let array = new Uint32Array(new Float32Array([MIN_VALUE]));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_14500
     * @tc.name        testUint32Constructor0145
     * @tc.desc        Testing Constructor of Uint32Array with Float32Array out of bounds value([-3.4028235 * 10^38 -1]),
     * and get value of index 0 is 4294967291.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0145";
      try {
        let MIN_VALUE = -3.4028235e38 -1;
        let array = new Uint32Array(new Float32Array([MIN_VALUE]));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_14600
     * @tc.name        testUint32Constructor0146
     * @tc.desc        Testing Constructor of Uint32Array with Float32Array threshold value([3.4028235 x 10^38]),
     * and get value of index 0 is 4.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0146";
      try {
        let MAX_VALUE = 3.4028235e38;
        let array = new Uint32Array(new Float32Array([MAX_VALUE]));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_1479100
     * @tc.name        testUint32Constructor0147
     * @tc.desc        Testing Constructor of Uint32Array with Float32Array out of bounds value([3.4028235 x 10^38 + 1]),
     * and get value of index 0 is 5.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0147";
      try {
        let MAX_VALUE = 3.4028235e38 + 1;
        let array = new Uint32Array(new Float32Array([MAX_VALUE]));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_14800
     * @tc.name        testUint32Constructor0148
     * @tc.desc        Testing Constructor of Uint32Array with Float64Array threshold value([-1.8e308]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0148";
      try {
        let MIN_VALUE = -1.8e308;
        let array = new Uint32Array(new Float64Array(new Array<number>(MIN_VALUE)));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_14900
     * @tc.name        testUint32Constructor0149
     * @tc.desc        Testing Constructor of Uint32Array with Float64Array out of bounds value([-1.8e308 -1]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0149";
      try {
        let MIN_VALUE = -1.8e308 -1;
        let array = new Uint32Array(new Float64Array([MIN_VALUE]));
        expect(array[0]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_15200
     * @tc.name        testUint32Constructor0152
     * @tc.desc        Testing Constructor of Uint32Array with BigInt64Array threshold value([-(2^63)]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0152";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([-9223372036854775808n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const uint32Array  = new Uint32Array(byteLength * 3); // because Uint32 is 4 byte,bigInt64 is 8 byte,buffer * 2.
    
        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint32Array
          const bytes = new Uint32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(String(uint32Array[0])).assertEqual('0');
        expect(String(uint32Array[1])).assertEqual('9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_15300
     * @tc.name        testUint32Constructor0153
     * @tc.desc        Testing Constructor of Uint32Array with BigInt64Array out of bounds value([-(2^63) -1]),
     * and get value of index 0 is 9.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0153";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([-9223372036854775809n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const uint32Array  = new Uint32Array(byteLength * 3); // because Uint32 is 4 byte,BigInt64 is 8 byte,buffer * 2.
    
        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint32Array
          const bytes = new Uint32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(String(uint32Array[0])).assertEqual('9');
        expect(String(uint32Array[1])).assertEqual('2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_15400
     * @tc.name        testUint32Constructor0154
     * @tc.desc        Testing Constructor of Uint32Array with BigInt64Array threshold value([2^63 - 1]),
     * and get value of index 0 is error.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0154";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([9223372036854775807n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const uint32Array  = new Uint32Array(byteLength * 3); // because Uint32 is 4 byte,BigInt64 is 8 byte,buffer * 2.
    
        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint32Array
          const bytes = new Uint32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(String(uint32Array[0])).assertEqual('9');
        expect(String(uint32Array[1])).assertEqual('2');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_15500
     * @tc.name        testUint32Constructor0155
     * @tc.desc        Testing Constructor of Uint32Array with BigInt64Array out of bounds value([2^63]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0155";
      try {
        // creat bigInt64Array
        const bigint64Array = new BigInt64Array([9223372036854775808n]);
        console.info(`${TAG} bigint64Array is: ${bigint64Array}`);
        // new Uint32Array
        const byteLength = bigint64Array.buffer.byteLength;
        const uint32Array  = new Uint32Array(byteLength * 3);
    
        let offset = 0;
        for (const num of bigint64Array) {
          // BigInt => Uint32Array
          const bytes = new Uint32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.info(`${TAG} bytes is: ${bytes}`);
          uint32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(String(uint32Array[0])).assertEqual('0');
        expect(String(uint32Array[1])).assertEqual('9');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_15600
     * @tc.name        testUint32Constructor0156
     * @tc.desc        Testing Constructor of Uint32Array with BigUint64Array threshold value([0]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0156";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([0n]);
        // new Uint32Array
        const byteLength = bigUint64Array.buffer.byteLength;
        const uint32Array  = new Uint32Array(byteLength * 2); // because Uint32 is 4 byte,BigInt64 is 8 byte,buffer * 2.
    
        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint32Array
          const bytes = new Uint32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint32Array .set(bytes, offset);
          offset += bytes.length;
        }
        expect(String(uint32Array[0])).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_15700
     * @tc.name        testUint32Constructor0157
     * @tc.desc        Testing Constructor of Uint32Array with BigUint64Array out of bounds value([-1]),
     * and get value of index 0 is 1.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0157";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([-1n]);
        // new Uint32Array
        const byteLength = bigUint64Array.buffer.byteLength;
        console.info(`${TAG} byteLength is: ${byteLength}`);
        const uint32Array  = new Uint32Array(byteLength * 3); // because Uint32 is 4 byte,BigInt64 is 8 byte,buffer * 2.
    
        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint32Array
          const bytes = new Uint32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint32Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(String(uint32Array[0])).assertEqual('1');
        expect(String(uint32Array[1])).assertEqual('8');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_15800
     * @tc.name        testUint32Constructor0158
     * @tc.desc        Testing Constructor of Uint32Array with BigUint64Array threshold value([2^64-1n]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0158";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([18446744073709551615n]);
        // new Uint32Array
        const byteLength = bigUint64Array.buffer.byteLength;
        console.info(`${TAG} byteLength is: ${byteLength}`);
        const uint32Array  = new Uint32Array(byteLength * 3); // because Uint32 is 4 byte,BigInt64 is 8 byte,buffer * 2.
    
        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint32Array
          const bytes = new Uint32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          uint32Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(String(uint32Array[0])).assertEqual('1');
        expect(String(uint32Array[2])).assertEqual('4');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_CONSTRUCTOR_15900
     * @tc.name        testUint32Constructor0159
     * @tc.desc        Testing Constructor of Uint32Array with BigUint64Array out of bounds value([2^64n]),
     * and get value of index 0 is 0.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32Constructor0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32Constructor0159";
      try {
        // creat bigInt64Array
        const bigUint64Array = new BigUint64Array([18446744073709551616n]);
        console.info(`${TAG} BigUint64Array is: ${bigUint64Array}`);
        // new Int32Array
        const byteLength = bigUint64Array.buffer.byteLength;
        const uint32Array  = new Uint32Array(byteLength * 3); // because Uint32 is 4 byte,BigInt64 is 8 byte,buffer * 2.
    
        let offset = 0;
        for (const num of bigUint64Array) {
          // BigInt => Uint32Array
          const bytes = new Uint32Array(BigInt(num).toString().split('').map(n => parseInt(n)));
          console.error(`${TAG} bytes, is: ${bytes}`);
          uint32Array.set(bytes, offset);
          offset += bytes.length;
        }
        expect(String(uint32Array[0])).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYOF_16000
     * @tc.name        testUint32ArrayOf0160
     * @tc.desc        Testing static function of, of Uint32Array value is positive infinity(+infinity).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0160";
      try {
        let infinity = 1 / 0.0;
        let array = Uint32Array.of(infinity);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYOF_16100
     * @tc.name        testUint32ArrayOf0161
     * @tc.desc        Testing static function of, of Uint32Array value is negative infinity(-infinity).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0161";
      try {
        let infinity = -1 / 0.0;
        let array = Uint32Array.of(infinity);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYOF_16200
     * @tc.name        testUint32ArrayOf0162
     * @tc.desc        Testing static function of, of Uint32Array value is (NaN).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0162";
      try {
        let nan = 0 / 0.0;
        let array = Uint32Array.of(nan);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYOF_16300
     * @tc.name        testUint32ArrayOf0163
     * @tc.desc        Testing static function of, of Uint32Array value is bigint(12345678901234567890n).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0163";
      try {
        let bigintValue = BigInt(12345678901234567890n);
        let numberValue = Number(bigintValue);
        let uint32Array = Uint32Array.of(numberValue);
        console.info(`${TAG} uint32Array is: ${uint32Array}`);
        expect(String(uint32Array[0])).assertEqual('3944679424');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYOF_16400
     * @tc.name        testUint32ArrayOf0164
     * @tc.desc        Testing static function of, of Uint32Array threshold value is MAX_NUMBER(4294967295).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0164";
      try {
        let array = Uint32Array.of(4294967295);
        expect(String(array[0])).assertEqual('4294967295');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYOF_16500
     * @tc.name        testUint32ArrayOf0165
     * @tc.desc        Testing static function of, of Uint32Array threshold value is MIN_NUMBER(0).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0165";
      try {
        let array = Uint32Array.of(0);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYOF_16600
     * @tc.name        testUint32ArrayOf0166
     * @tc.desc        Testing static function of, Int32Array value is out of bounds (-1).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0166";
      try {
        let array = Uint32Array.of(-1);
        expect(String(array[0])).assertEqual('4294967295');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYOF_16700
     * @tc.name        testUint32ArrayOf0167
     * @tc.desc        Testing static function of, Uint32Array value is out of bounds (4294967296).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0167";
      try {
        let array = Uint32Array.of(4294967296);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYOF_16800
     * @tc.name        testUint32ArrayOf0168
     * @tc.desc        Testing static function of, Uint32Array value is normal (4294967294).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayOf0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayOf0168";
      try {
        let array = Uint32Array.of(4294967294);
        expect(String(array[0])).assertEqual('4294967294');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYFROM_17000
     * @tc.name        testUint32ArrayFrom0170
     * @tc.desc        Testing static function from => func of Uint32Array, value is normal (+infinity).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayFrom0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayFrom0170";
      try {
        let infinity = 1/0.0;
        let array = Uint32Array.from([infinity]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYFROM_17100
     * @tc.name        testUint32ArrayFrom0171
     * @tc.desc        Testing static function from => func of Uint32Array, value is normal (-infinity).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayFrom0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayFrom0171";
      try {
        let infinity = -1/0.0;
        let array = Uint32Array.from([infinity]);
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYFROM_17200
     * @tc.name        testUint32ArrayFrom0172
     * @tc.desc        Testing static function from => func of Uint32Array, value is normal (NaN).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayFrom0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayFrom0172";
      try {
        let nan = 0/0.0;
        let array = Uint32Array.from(new Array<number>(nan));
        expect(String(array[0])).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYFROM_17300
     * @tc.name        testUint32ArrayFrom0173
     * @tc.desc        Testing static function from => func of Uint32Array, value is normal ([1,2,3]).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayFrom0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayFrom0173";
      try {
        let array = Uint32Array.from(new Array<number>(1,2,3));
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
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYFROM_17400
     * @tc.name        testUint32ArrayFrom0174
     * @tc.desc        Testing static function from => func of Uint32Array, value is normal ([1.1,2.83]).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayFrom0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayFrom0174";
      try {
        let array = Uint32Array.from(new Array<number>(1.1,2.83));
        expect(String(array[0])).assertEqual('1');
        expect(String(array[1])).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number      SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAYFROM_17500
     * @tc.name        testUint32ArrayFrom0175
     * @tc.desc        Testing static function from => func of Uint32Array, value is normal ([12345678901234567890n]).
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testUint32ArrayFrom0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () :void=> {
      const TAG = "testUint32ArrayFrom0175";
      try {
        let bigintValue = BigInt(12345678901234567890n);
        let numberValue = Number(bigintValue);
        let array = Uint32Array.from([numberValue]);
        expect(String(array[0])).assertEqual('3944679424');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
  })
}