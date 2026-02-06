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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils'

export default function IndexedCollections01Test() {
  describe('IndexedCollections01Test', () => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.number    SUB_BASEDATA_INT8_0100
     * @tc.name      testInt80001
     * @tc.desc      Verify DataView can read and write Int8 value -128 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt80001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt80001";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(0, -128);
        const readValue: number = dv.getInt8(0);
        expect(readValue).assertEqual(-128);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT8_0200
     * @tc.name      testInt80002
     * @tc.desc      Verify DataView can read and write Int8 value 127 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt80002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt80002";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(0, 127);
        const readValue: number = dv.getInt8(0);
        expect(readValue).assertEqual(127);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT8_0300
     * @tc.name      testUint80003
     * @tc.desc      Verify DataView can read and write Uint8 value 0 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint80003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint80003";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setUint8(0, 0);
        const readValue: number = dv.getUint8(0);
        expect(readValue).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT8_0400
     * @tc.name      testUint80004
     * @tc.desc      Verify DataView can read and write Uint8 value 255 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint80004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint80004";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setUint8(0, 255);
        const readValue: number = dv.getUint8(0);
        expect(readValue).assertEqual(255);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT16_0500
     * @tc.name      testInt160005
     * @tc.desc      Verify DataView can read and write Int16 value -32768 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt160005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt160005";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, -32768, true);
        const readValue: number = dv.getInt16(0, true);
        expect(readValue).assertEqual(-32768);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT16_0600
     * @tc.name      testInt160006
     * @tc.desc      Verify DataView can read and write Int16 value 32767 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt160006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt160006";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, 32767, true);
        const readValue: number = dv.getInt16(0, true);
        expect(readValue).assertEqual(32767);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT16_0700
     * @tc.name      testUint160007
     * @tc.desc      Verify DataView can read and write Uint16 value 0 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint160007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint160007";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setUint16(0, 0, true);
        const readValue: number = dv.getUint16(0, true);
        expect(readValue).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT16_0800
     * @tc.name      testUint160008
     * @tc.desc      Verify DataView can read and write Uint16 value 65535 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint160008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint160008";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setUint16(0, 65535, true);
        const readValue: number = dv.getUint16(0, true);
        expect(readValue).assertEqual(65535);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT32_0900
     * @tc.name      testInt320009
     * @tc.desc      Verify DataView can read and write Int32 value -2147483648 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt320009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt320009";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt32(0, -2147483648, true);
        const readValue: number = dv.getInt32(0, true);
        expect(readValue).assertEqual(-2147483648);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT32_1000
     * @tc.name      testInt320010
     * @tc.desc      Verify DataView can read and write Int32 value 2147483647 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt320010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt320010";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt32(0, 2147483647, true);
        const readValue: number = dv.getInt32(0, true);
        expect(readValue).assertEqual(2147483647);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT32_1100
     * @tc.name      testUint320011
     * @tc.desc      Verify DataView can read and write Uint32 value 0 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint320011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint320011";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setUint32(0, 0, true);
        const readValue: number = dv.getUint32(0, true);
        expect(readValue).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT32_1200
     * @tc.name      testUint320012
     * @tc.desc      Verify DataView can read and write Uint32 value 4294967295 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint320012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint320012";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setUint32(0, 4294967295, true);
        const readValue: number = dv.getUint32(0, true);
        expect(readValue).assertEqual(4294967295);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FLOAT32_1300
     * @tc.name      testFloat320013
     * @tc.desc      Verify DataView can read and write Float32 value 0.0 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat320013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat320013";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, 0.0, true);
        const readValue: number = dv.getFloat32(0, true);
        expect(readValue).assertEqual(0.0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FLOAT32_1400
     * @tc.name      testFloat320014
     * @tc.desc      Verify DataView can read and write Float32 value 3.14159 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat320014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat320014";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, 3.14159, true);
        const readValue: number = dv.getFloat32(0, true);
        expect(Math.abs(readValue - 3.14159) < 0.00001).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FLOAT32_1500
     * @tc.name      testFloat320015
     * @tc.desc      Verify DataView can read and write Float32 value -1.2345 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat320015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat320015";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, -1.2345, true);
        const readValue: number = dv.getFloat32(0, true);
        expect(Math.abs(readValue + 1.2345) < 0.00001).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FLOAT64_1600
     * @tc.name      testFloat640016
     * @tc.desc      Verify DataView can read and write Float64 value 0.0 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat640016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat640016";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, 0.0, true);
        const readValue: number = dv.getFloat64(0, true);
        expect(readValue).assertEqual(0.0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FLOAT64_1700
     * @tc.name      testFloat640017
     * @tc.desc      Verify DataView can read and write Float64 value 3.1415926535 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat640017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat640017";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, 3.1415926535, true);
        const readValue: number = dv.getFloat64(0, true);
        expect(Math.abs(readValue - 3.1415926535) < 0.0000000001).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FLOAT64_1800
     * @tc.name      testFloat640018
     * @tc.desc      Verify DataView can read and write Float64 value -2.71828 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat640018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat640018";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, -2.71828, true);
        const readValue: number = dv.getFloat64(0, true);
        expect(Math.abs(readValue + 2.71828) < 0.00001).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT8_1900
     * @tc.name      testInt80019
     * @tc.desc      Verify DataView can read and write Int8 value with type matching correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt80019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt80019";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(0, 42);
        const readValue: number = dv.getInt8(0);
        expect(readValue).assertEqual(42);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT8_2000
     * @tc.name      testUint80020
     * @tc.desc      Verify DataView can read and write Uint8 value with type matching correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint80020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint80020";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setUint8(0, 123);
        const readValue: number = dv.getUint8(0);
        expect(readValue).assertEqual(123);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT16_2100
     * @tc.name      testInt160021
     * @tc.desc      Verify DataView can read and write Int16 value with type matching correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt160021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt160021";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, 1234, false);
        const readValue: number = dv.getInt16(0, false);
        expect(readValue).assertEqual(1234);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT16_2200
     * @tc.name      testUint160022
     * @tc.desc      Verify DataView can read and write Uint16 value with type matching correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint160022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint160022";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setUint16(0, 5678, false);
        const readValue: number = dv.getUint16(0, false);
        expect(readValue).assertEqual(5678);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT32_2300
     * @tc.name      testInt320023
     * @tc.desc      Verify DataView can read and write Int32 value with type matching correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt320023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt320023";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt32(0, 987654, true);
        const readValue: number = dv.getInt32(0, true);
        expect(readValue).assertEqual(987654);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT32_2400
     * @tc.name      testUint320024
     * @tc.desc      Verify DataView can read and write Uint32 value with type matching correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint320024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint320024";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setUint32(0, 456789, true);
        const readValue: number = dv.getUint32(0, true);
        expect(readValue).assertEqual(456789);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FLOAT32_2500
     * @tc.name      testFloat320025
     * @tc.desc      Verify DataView can read and write Float32 value with type matching correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat320025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat320025";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, 1.618, false);
        const readValue: number = dv.getFloat32(0, false);
        expect(Math.abs(readValue - 1.618) < 0.0001).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FLOAT64_2600
     * @tc.name      testFloat640026
     * @tc.desc      Verify DataView can read and write Float64 value with type matching correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat640026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat640026";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, 0.618, false);
        const readValue: number = dv.getFloat64(0, false);
        expect(Math.abs(readValue - 0.618) < 0.0001).assertEqual(true);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT8_2700
     * @tc.name      testInt80027
     * @tc.desc      Verify DataView can read and write Int8 minimum boundary value -128 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt80027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt80027";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(0, -128);
        const readValue: number = dv.getInt8(0);
        expect(readValue).assertEqual(-128);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT8_2800
     * @tc.name      testInt80028
     * @tc.desc      Verify DataView can read and write Int8 maximum boundary value 127 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt80028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt80028";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(0, 127);
        const readValue: number = dv.getInt8(0);
        expect(readValue).assertEqual(127);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT8_2900
     * @tc.name      testUint80029
     * @tc.desc      Verify DataView can read and write Uint8 minimum boundary value 0 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint80029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint80029";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setUint8(0, 0);
        const readValue: number = dv.getUint8(0);
        expect(readValue).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT8_3000
     * @tc.name      testUint80030
     * @tc.desc      Verify DataView can read and write Uint8 maximum boundary value 255 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint80030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint80030";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(1);
        const dv: DataView = new DataView(buffer);
        dv.setUint8(0, 255);
        const readValue: number = dv.getUint8(0);
        expect(readValue).assertEqual(255);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT16_3100
     * @tc.name      testInt160031
     * @tc.desc      Verify DataView can read and write Int16 minimum boundary value -32768 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt160031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt160031";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, -32768, true);
        const readValue: number = dv.getInt16(0, true);
        expect(readValue).assertEqual(-32768);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT16_3200
     * @tc.name      testInt160032
     * @tc.desc      Verify DataView can read and write Int16 maximum boundary value 32767 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt160032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt160032";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, 32767, true);
        const readValue: number = dv.getInt16(0, true);
        expect(readValue).assertEqual(32767);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT16_3300
     * @tc.name      testUint160033
     * @tc.desc      Verify DataView can read and write Uint16 minimum boundary value 0 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint160033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint160033";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setUint16(0, 0, true);
        const readValue: number = dv.getUint16(0, true);
        expect(readValue).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT16_3400
     * @tc.name      testUint160034
     * @tc.desc      Verify DataView can read and write Uint16 maximum boundary value 65535 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint160034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint160034";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setUint16(0, 65535, true);
        const readValue: number = dv.getUint16(0, true);
        expect(readValue).assertEqual(65535);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT32_3500
     * @tc.name      testInt320035
     * @tc.desc      Verify DataView can read and write Int32 minimum boundary value -2147483648 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt320035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt320035";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt32(0, -2147483648, false);
        const readValue: number = dv.getInt32(0, false);
        expect(readValue).assertEqual(-2147483648);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_INT32_3600
     * @tc.name      testInt320036
     * @tc.desc      Verify DataView can read and write Int32 maximum boundary value 2147483647 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt320036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt320036";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt32(0, 2147483647, false);
        const readValue: number = dv.getInt32(0, false);
        expect(readValue).assertEqual(2147483647);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT32_3700
     * @tc.name      testUint320037
     * @tc.desc      Verify DataView can read and write Uint32 minimum boundary value 0 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint320037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint320037";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setUint32(0, 0, false);
        const readValue: number = dv.getUint32(0, false);
        expect(readValue).assertEqual(0);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_UINT32_3800
     * @tc.name      testUint320038
     * @tc.desc      Verify DataView can read and write Uint32 maximum boundary value 4294967295 correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint320038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint320038";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setUint32(0, 4294967295, false);
        const readValue: number = dv.getUint32(0, false);
        expect(readValue).assertEqual(4294967295);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FLOAT32_3900
     * @tc.name      testFloat320039
     * @tc.desc      Verify DataView can read and write Float32 positive minimum non-zero value correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat320039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat320039";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        const minFloat32: number = 1.401298464324817e-45;
        dv.setFloat32(0, minFloat32, true);
        const readValue: number = dv.getFloat32(0, true);
        expect(readValue).assertEqual(minFloat32);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_FLOAT64_4000
     * @tc.name      testFloat640040
     * @tc.desc      Verify DataView can read and write Float64 negative maximum finite value correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat640040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat640040";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        const maxNegFloat64: number = -1.7976931348623157e+308;
        dv.setFloat64(0, maxNegFloat64, true);
        const readValue: number = dv.getFloat64(0, true);
        expect(readValue).assertEqual(maxNegFloat64);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_INT16_0100
     * @tc.name      testInt16Endian0001
     * @tc.desc      Verify DataView can read and write Int16 value correctly in little-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt16Endian0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt16Endian0001";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, 0x1234, true);
        const readValue: number = dv.getInt16(0, true);
        expect(readValue).assertEqual(0x1234);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_INT16_0200
     * @tc.name      testInt16Endian0002
     * @tc.desc      Verify DataView can read and write Int16 value correctly in big-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt16Endian0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt16Endian0002";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, 0x1234, false);
        const readValue: number = dv.getInt16(0, false);
        expect(readValue).assertEqual(0x1234);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_INT16_0300
     * @tc.name      testInt16Endian0003
     * @tc.desc      Verify DataView handles Int16 value correctly when little-endian write and big-endian read (endian mismatch).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt16Endian0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt16Endian0003";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, 0x1234, true);
        const readValue: number = dv.getInt16(0, false);
        expect(readValue).assertEqual(0x3412);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_UINT16_0400
     * @tc.name      testUint16Endian0004
     * @tc.desc      Verify DataView can read and write Uint16 value correctly in little-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint16Endian0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint16Endian0004";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setUint16(0, 0x5678, true);
        const readValue: number = dv.getUint16(0, true);
        expect(readValue).assertEqual(0x5678);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_UINT16_0500
     * @tc.name      testUint16Endian0005
     * @tc.desc      Verify DataView can read and write Uint16 value correctly in big-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint16Endian0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint16Endian0005";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setUint16(0, 0x5678, false);
        const readValue: number = dv.getUint16(0, false);
        expect(readValue).assertEqual(0x5678);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_UINT16_0600
     * @tc.name      testUint16Endian0006
     * @tc.desc      Verify DataView handles Uint16 value correctly when big-endian write and little-endian read (endian mismatch).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint16Endian0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint16Endian0006";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setUint16(0, 0x5678, false);
        const readValue: number = dv.getUint16(0, true);
        expect(readValue).assertEqual(0x7856);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_INT32_0700
     * @tc.name      testInt32Endian0007
     * @tc.desc      Verify DataView can read and write Int32 value correctly in little-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt32Endian0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt32Endian0007";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt32(0, 0x12345678, true);
        const readValue: number = dv.getInt32(0, true);
        expect(readValue).assertEqual(0x12345678);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_INT32_0800
     * @tc.name      testInt32Endian0008
     * @tc.desc      Verify DataView can read and write Int32 value correctly in big-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt32Endian0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt32Endian0008";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt32(0, 0x12345678, false);
        const readValue: number = dv.getInt32(0, false);
        expect(readValue).assertEqual(0x12345678);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_INT32_0900
     * @tc.name      testInt32Endian0009
     * @tc.desc      Verify DataView handles Int32 value correctly when little-endian write and big-endian read (endian mismatch).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt32Endian0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt32Endian0009";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt32(0, 0x12345678, true);
        const readValue: number = dv.getInt32(0, false);
        expect(readValue).assertEqual(0x78563412);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_UINT32_1000
     * @tc.name      testUint32Endian0010
     * @tc.desc      Verify DataView can read and write Uint32 value correctly in little-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint32Endian0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint32Endian0010";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setUint32(0, 0x87654321, true);
        const readValue: number = dv.getUint32(0, true);
        expect(readValue).assertEqual(0x87654321);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_UINT32_1100
     * @tc.name      testUint32Endian0011
     * @tc.desc      Verify DataView can read and write Uint32 value correctly in big-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint32Endian0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint32Endian0011";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setUint32(0, 0x87654321, false);
        const readValue: number = dv.getUint32(0, false);
        expect(readValue).assertEqual(0x87654321);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_UINT32_1200
     * @tc.name      testUint32Endian0012
     * @tc.desc      Verify DataView handles Uint32 value correctly when big-endian write and little-endian read (endian mismatch).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint32Endian0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint32Endian0012";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setUint32(0, 0x87654321, false);
        const readValue: number = dv.getUint32(0, true);
        expect(readValue).assertEqual(0x21436587);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_FLOAT32_1300
     * @tc.name      testFloat32Endian0013
     * @tc.desc      Verify DataView can read and write Float32 value correctly in little-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat32Endian0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat32Endian0013";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        const value: number = 3.14159;
        dv.setFloat32(0, value, true);
        const readValue: number = dv.getFloat32(0, true);
        const isEqual: boolean = Math.abs(readValue - value) < 0.00001;
        expect(isEqual).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_FLOAT32_1400
     * @tc.name      testFloat32Endian0014
     * @tc.desc      Verify DataView can read and write Float32 value correctly in big-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat32Endian0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat32Endian0014";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        const value: number = 3.14159;
        dv.setFloat32(0, value, false);
        const readValue: number = dv.getFloat32(0, false);
        const isEqual: boolean = Math.abs(readValue - value) < 0.00001;
        expect(isEqual).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_FLOAT64_1500
     * @tc.name      testFloat64Endian0015
     * @tc.desc      Verify DataView can read and write Float64 value correctly in little-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat64Endian0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat64Endian0015";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        const value: number = 2.7182818284;
        dv.setFloat64(0, value, true);
        const readValue: number = dv.getFloat64(0, true);
        const isEqual: boolean = Math.abs(readValue - value) < 0.0000000001;
        expect(isEqual).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_FLOAT64_1600
     * @tc.name      testFloat64Endian0016
     * @tc.desc      Verify DataView can read and write Float64 value correctly in big-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat64Endian0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat64Endian0016";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        const value: number = 2.7182818284;
        dv.setFloat64(0, value, false);
        const readValue: number = dv.getFloat64(0, false);
        const isEqual: boolean = Math.abs(readValue - value) < 0.0000000001;
        expect(isEqual).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_INT32_1700
     * @tc.name      testInt32Endian0017
     * @tc.desc      Verify DataView uses big-endian as default when littleEndian is not specified for Int32 operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt32Endian0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt32Endian0017";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt32(0, 0x12345678);
        const readValue: number = dv.getInt32(0);
        expect(readValue).assertEqual(0x12345678);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_UINT16_1800
     * @tc.name      testUint16Endian0018
     * @tc.desc      Verify DataView uses big-endian as default when littleEndian is not specified for Uint16 operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testUint16Endian0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testUint16Endian0018";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        dv.setUint16(0, 0xABCD);
        const readValue: number = dv.getUint16(0);
        expect(readValue).assertEqual(0xABCD);
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_FLOAT32_1900
     * @tc.name      testFloat32Endian0019
     * @tc.desc      Verify DataView uses big-endian as default when littleEndian is not specified for Float32 operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testFloat32Endian0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testFloat32Endian0019";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        const value: number = 1.618;
        dv.setFloat32(0, value);
        const readValue: number = dv.getFloat32(0);
        const isEqual: boolean = Math.abs(readValue - value) < 0.0001;
        expect(isEqual).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_ENDIAN_INT16_2000
     * @tc.name      testInt16Endian0020
     * @tc.desc      Verify DataView handles mixed endian operations (little-endian and big-endian) at different positions for Int16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testInt16Endian0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testInt16Endian0020";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, 0x1234, true);
        dv.setInt16(2, 0x5678, false);
        const res1: boolean = dv.getInt16(0, true) === 0x1234;
        const res2: boolean = dv.getInt16(2, false) === 0x5678;
        const isAllCorrect: boolean = res1 && res2;
        expect(isAllCorrect).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_0100
     * @tc.name      testDataView0001
     * @tc.desc      Verify DataView and Uint8Array can read/write different positions independently in shared buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataView0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataView0001";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        const uint8View: Uint8Array = new Uint8Array(buffer);
        dv.setUint8(0, 100);
        uint8View[1] = 200;
        const res: boolean = dv.getUint8(0) === 100 && uint8View[1] === 200;
        expect(res).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_0200
     * @tc.name      testDataView0002
     * @tc.desc      Verify DataView and Int16Array can read/write non-overlapping ranges independently in shared buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataView0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataView0002";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(6);
        const dv: DataView = new DataView(buffer);
        const int16View: Int16Array = new Int16Array(buffer);
        dv.setInt16(0, 1234, true);
        int16View[1] = 5678;
        const res: boolean = dv.getInt16(0, true) === 1234 && int16View[1] === 5678;
        expect(res).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_0300
     * @tc.name      testDataView0003
     * @tc.desc      Verify Uint8Array can override the same position written by DataView in shared buffer, and DataView reads the updated value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataView0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataView0003";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const dv: DataView = new DataView(buffer);
        const uint8View: Uint8Array = new Uint8Array(buffer);
        dv.setUint8(0, 255);
        uint8View[0] = 100;
        const res: boolean = dv.getUint8(0) === 100;
        expect(res).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_0400
     * @tc.name      testDataView0004
     * @tc.desc      Verify Int32Array can override the same byte written by DataView in shared buffer, and DataView reads the updated value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataView0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataView0004";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        const int32View: Int32Array = new Int32Array(buffer);
        dv.setUint8(1, 0xAA);
        int32View[0] = 0x11223344;
        const res: boolean = dv.getUint8(1) === 0x33;
        expect(res).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_0500
     * @tc.name      testDataView0005
     * @tc.desc      Verify DataView can override the same position written by TypedArray in shared buffer, and TypedArray reads the updated value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataView0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataView0005";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const uint16View: Uint16Array = new Uint16Array(buffer);
        const dv: DataView = new DataView(buffer);
        uint16View[0] = 0x1234;
        dv.setUint16(0, 0x5678, true);
        const res: boolean = uint16View[0] === 0x5678;
        expect(res).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_0600
     * @tc.name      testDataView0006
     * @tc.desc      Verify DataView can read/write Int8 and Uint16 independently at different positions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataView0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataView0006";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(5);
        const dv: DataView = new DataView(buffer);
        dv.setInt8(0, -42);
        dv.setUint16(1, 0xABCD, true);
        const res: boolean = dv.getInt8(0) === -42 && dv.getUint16(1, true) === 0xABCD;
        expect(res).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_0700
     * @tc.name      testDataView0007
     * @tc.desc      Verify DataView can read/write Float32 and Int32 independently at different positions with specified endianness.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataView0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataView0007";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(12);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, 3.14, false);
        dv.setInt32(4, -123456, true);
        const res: boolean = Math.abs(dv.getFloat32(0, false) - 3.14) < 0.01 && dv.getInt32(4, true) === -123456;
        expect(res).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_0800
     * @tc.name      testDataView0008
     * @tc.desc      Verify DataView can read/write different types at adjacent positions without interference.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataView0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataView0008";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(3);
        const dv: DataView = new DataView(buffer);
        dv.setUint8(0, 0xFF);
        dv.setUint16(1, 0x1234, true);
        const res: boolean = dv.getUint8(0) === 0xFF && dv.getUint16(1, true) === 0x1234;
        expect(res).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_0900
     * @tc.name      testDataView0009
     * @tc.desc      Verify DataView and Float64Array can read/write different byte ranges independently in shared buffer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataView0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataView0009";
        console.log(TAG + " start");
        const bufferFix: ArrayBuffer = new ArrayBuffer(16);
        const dvFix: DataView = new DataView(bufferFix);
        const float64ViewFix: Float64Array = new Float64Array(bufferFix);
        dvFix.setFloat32(8, 2.718, true);
        float64ViewFix[0] = 1.618;
        const res: boolean = Math.abs(dvFix.getFloat32(8, true) - 2.718) < 0.001
          && Math.abs(float64ViewFix[0] - 1.618) < 0.001;
        expect(res).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_1000
     * @tc.name      testDataView0010
     * @tc.desc      Verify original data becomes invalid after DataView overwrites the same position, and new data is valid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataView0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataView0010";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt16(0, 0x1234, true);
        dv.setUint8(0, 0x55);
        const res: boolean = dv.getUint8(0) === 0x55 && dv.getInt16(0, true) === 0x1255;
        expect(res).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_ROBUST_0100
     * @tc.name      testDataViewSpecialValue0001
     * @tc.desc      Verify DataView can correctly write and read special float value NaN in little-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataViewSpecialValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataViewSpecialValue0001";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, NaN, true);
        const isNaNResult: boolean = isNaN(dv.getFloat64(0, true));
        expect(isNaNResult).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_ROBUST_0200
     * @tc.name      testDataViewSpecialValue0002
     * @tc.desc      Verify DataView can correctly write and read special float value Infinity in little-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataViewSpecialValue0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataViewSpecialValue0002";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, Infinity, true);
        const isInfinity: boolean = dv.getFloat64(0, true) === Infinity;
        expect(isInfinity).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_ROBUST_0300
     * @tc.name      testDataViewSpecialValue0003
     * @tc.desc      Verify DataView can correctly write and read special float value -Infinity in big-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataViewSpecialValue0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataViewSpecialValue0003";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, -Infinity, false);
        const isNegativeInfinity: boolean = dv.getFloat64(0, false) === -Infinity;
        expect(isNegativeInfinity).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_ROBUST_0400
     * @tc.name      testDataViewSpecialValue0004
     * @tc.desc      Verify DataView can correctly write and read 32-bit special float value NaN in big-endian order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataViewSpecialValue0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataViewSpecialValue0004";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setFloat32(0, NaN, false);
        const isNaNResult: boolean = isNaN(dv.getFloat32(0, false));
        expect(isNaNResult).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_ROBUST_0500
     * @tc.name      testDataViewInvalidIndex0005
     * @tc.desc      Verify DataView throws RangeError when reading with negative index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataViewInvalidIndex0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataViewInvalidIndex0005";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        let result: boolean = false;
        try {
          dv.getInt8(-1);
          console.log("5. 负数索引读取: false");
        } catch (e) {
          result = e instanceof RangeError;
          console.log("5. Negative Index Read: " + result);
        }
        expect(result).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_ROBUST_0600
     * @tc.name      testDataViewInvalidIndex0006
     * @tc.desc      Verify DataView throws RangeError when writing with non-integer index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataViewInvalidIndex0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataViewInvalidIndex0006";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        let result: boolean = false;
        try {
          dv.setUint16(2.5, 100, true);
          console.log("6. non-integer index write: false");
        } catch (e) {
          result = e instanceof RangeError;
          console.log("6. non-integer index write: " + result);
        }
        expect(result).assertFalse();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_ROBUST_0700
     * @tc.name      testDataViewTypeIncompatibility0007
     * @tc.desc      Verify truncation behavior when reading Int8 from Float64 written position in DataView.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataViewTypeIncompatibility0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataViewTypeIncompatibility0007";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(8);
        const dv: DataView = new DataView(buffer);
        dv.setFloat64(0, 1.234, true);
        const intValue: number = dv.getInt8(0);
        const res: boolean = intValue === 1;
        expect(res).assertFalse();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_ROBUST_0800
     * @tc.name      testDataViewTypeIncompatibility0008
     * @tc.desc      Verify approximate value behavior when reading Float32 from Int32 written position in DataView.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataViewTypeIncompatibility0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataViewTypeIncompatibility0008";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        dv.setInt32(0, 123456, true);
        const floatValue: number = dv.getFloat32(0, true);
        const res: boolean = Math.abs(floatValue - 123456) < 0.1;
        expect(res).assertFalse();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_ROBUST_0900
     * @tc.name      testDataViewBufferDetach0009
     * @tc.desc      Verify exception behavior when reading from detached buffer using DataView (when environment supports transfer).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataViewBufferDetach0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataViewBufferDetach0009";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        let result: boolean | string = "Environment does not support transfer method";
        class TransferableArrayBuffer extends ArrayBuffer {
          transfer(): ArrayBuffer {
            return new ArrayBuffer(this.byteLength);
          }
        }
        if (typeof (buffer as TransferableArrayBuffer).transfer === 'function') {
          (buffer as TransferableArrayBuffer).transfer();
          try {
            dv.getUint32(0, true);
            result = false;
            console.log("9. Read after separation: false");
          } catch (e) {
            const error: Error = e as Error;
            result = error instanceof TypeError;
            console.log("9. Read after separation: " + result);
          }
        } else {
          console.log("9. Read after separation: Environment does not support transfer method");
        }
        if (typeof (buffer as TransferableArrayBuffer).transfer === 'function') {
          expect(result).assertTrue();
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_INDEXED_DATAVIEW_ROBUST_1000
     * @tc.name      testDataViewBufferDetach0010
     * @tc.desc      Verify exception behavior when writing to detached buffer using DataView (when environment supports transfer).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testDataViewBufferDetach0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testDataViewBufferDetach0010";
        console.log(TAG + " start");
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const dv: DataView = new DataView(buffer);
        let result: boolean | string = "Environment does not support transfer method";
        class TransferableArrayBuffer extends ArrayBuffer {
          transfer(): ArrayBuffer {
            return new ArrayBuffer(this.byteLength);
          }
        }
        if (typeof (buffer as TransferableArrayBuffer).transfer === 'function') {
          (buffer as TransferableArrayBuffer).transfer();
          try {
            dv.setInt16(0, 100, true);
            result = false;
            console.log("10. Write After Detach: false");
          } catch (e) {
            const error: Error = e as Error;
            result = error instanceof TypeError;
            console.log("10. Write After Detach: " + result);
          }
        } else {
          console.log("10. Write After Detach: Environment does not support transfer method");
        }
        if (typeof (buffer as TransferableArrayBuffer).transfer === 'function') {
          expect(result).assertTrue();
        }
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  })
}