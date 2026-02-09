/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
function getBI(data: int, ...dataEx: int[]): BigInt{
  let bi: BigInt = 0n;
  if (data < 0){
    bi = new BigInt(data & 0x7fffffff) + 2147483648n
  } else {
    bi = new BigInt(data)
  }
  let xishu = 4294967296n;
  for(let i = 0;i < dataEx.length; i++) {
    if(dataEx[i] < 0) {
      let tmp: BigInt = new BigInt(dataEx[i] & 0x7fffffff) + 2147483648n
      bi = tmp * xishu + bi;
    } else {
      bi = new BigInt(dataEx[i]) * xishu + bi;
    }

    xishu *= 4294967296n;
  }
  return bi;
}
export default function EsDataViewTest(){
  describe('EsDataViewTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0001
     * @tc.name ESDataViewTest0001
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0001';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let dv1 = new DataView(buffer, 0);
      let dv2 = new DataView(buffer, 0);
      expect(dv1.buffer).assertEqual(buffer);
      expect(dv2.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0002
     * @tc.name ESDataViewTest0002
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0002';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let dv1 = new DataView(buffer, 0);
      let dv2 = new DataView(buffer, 0);
      expect(dv1.buffer).assertEqual(buffer);
      expect(dv2.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0003
     * @tc.name ESDataViewTest0003
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0003';
      console.info(`${caseName}, test start`);
      let threw = false;
      let ab = new ArrayBuffer(42);
      try{
        new DataView(ab, -1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0004
     * @tc.name ESDataViewTest0004
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0004';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(3);
      let sample = new DataView(buffer, 1, 2);
      expect(sample.byteLength).assertEqual(2);
      expect(sample.byteOffset).assertEqual(1);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 1, 0);
      expect(sample.byteLength).assertEqual(0);
      expect(sample.byteOffset).assertEqual(1);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 0, 3);
      expect(sample.byteLength).assertEqual(3);
      expect(sample.byteOffset).assertEqual(0);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 3, 0);
      expect(sample.byteLength).assertEqual(0);
      expect(sample.byteOffset).assertEqual(3);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 0, 1);
      expect(sample.byteLength).assertEqual(1);
      expect(sample.byteOffset).assertEqual(0);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 0, 2);
      expect(sample.byteLength).assertEqual(2);
      expect(sample.byteOffset).assertEqual(0);
      expect(sample.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0005
     * @tc.name ESDataViewTest0005
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0005';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0, undefined);
      expect(sample.byteLength).assertEqual(4);
      expect(sample.byteOffset).assertEqual(0);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 1, undefined);
      expect(sample.byteLength).assertEqual(3);
      expect(sample.byteOffset).assertEqual(1);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 2, undefined);
      expect(sample.byteLength).assertEqual(2);
      expect(sample.byteOffset).assertEqual(2);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 3, undefined);
      expect(sample.byteLength).assertEqual(1);
      expect(sample.byteOffset).assertEqual(3);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 4, undefined);
      expect(sample.byteLength).assertEqual(0);
      expect(sample.byteOffset).assertEqual(4);
      expect(sample.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0006
     * @tc.name ESDataViewTest0006
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0006';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      expect(sample.byteLength).assertEqual(4);
      expect(sample.byteOffset).assertEqual(0);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 1);
      expect(sample.byteLength).assertEqual(3);
      expect(sample.byteOffset).assertEqual(1);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 2);
      expect(sample.byteLength).assertEqual(2);
      expect(sample.byteOffset).assertEqual(2);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 3);
      expect(sample.byteLength).assertEqual(1);
      expect(sample.byteOffset).assertEqual(3);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 4);
      expect(sample.byteLength).assertEqual(0);
      expect(sample.byteOffset).assertEqual(4);
      expect(sample.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0007
     * @tc.name ESDataViewTest0007
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0007';
      console.info(`${caseName}, test start`);
      let threw = false;
      let ab = new ArrayBuffer(3);
      try{
        let sample = new DataView(ab, 2, 2);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0008
     * @tc.name ESDataViewTest0008
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0008';
      console.info(`${caseName}, test start`);
      let threw = false;
      let ab = new ArrayBuffer(1);
      try{
        let sample = new DataView(ab, 2);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0009
     * @tc.name ESDataViewTest0009
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0009';
      console.info(`${caseName}, test start`);
      let ab = new ArrayBuffer(42);
      let sample = new DataView(ab, 0, -0);
      let threw = false;
      expect(sample.byteLength).assertEqual(0);
      sample = new DataView(ab, 0, 0);
      expect(sample.byteLength).assertEqual(0);
      sample = new DataView(ab, 0, 1);
      expect(sample.byteLength).assertEqual(1);
      sample = new DataView(ab, 0, 2);
      expect(sample.byteLength).assertEqual(2);
      try {
        sample = new DataView(ab, 0, -1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0010
     * @tc.name ESDataViewTest0010
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0010';
      console.info(`${caseName}, test start`);
      let threw = false;
      let ab = new ArrayBuffer(42);
      let sample = new DataView(ab, -0);
      expect(sample.byteLength).assertEqual(42);
      sample = new DataView(ab, 0);
      expect(sample.byteLength).assertEqual(42);
      sample = new DataView(ab, 1);
      expect(sample.byteLength).assertEqual(41);
      sample = new DataView(ab, 2);
      expect(sample.byteLength).assertEqual(40);
      try{
        sample = new DataView(ab, -1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0011
     * @tc.name ESDataViewTest0011
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0011';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(1);
      let dv = new DataView(buffer, 0);
      expect(dv.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0012
     * @tc.name ESDataViewTest0012
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0012';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample1 = new DataView(buffer, 0);
      let sample2 = new DataView(buffer, 4);
      let sample3 = new DataView(buffer, 6, 4);
      let sample4 = new DataView(buffer, 12);
      expect(sample1.byteLength).assertEqual(12);
      expect(sample2.byteLength).assertEqual(8);
      expect(sample3.byteLength).assertEqual(4);
      expect(sample4.byteLength).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0013
     * @tc.name ESDataViewTest0013
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0013';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample1 = new DataView(buffer, 0);
      let sample2 = new DataView(buffer, 4);
      let sample3 = new DataView(buffer, 6, 4);
      let sample4 = new DataView(buffer, 12);
      let sample5 = new DataView(buffer, 0, 2);
      expect(sample1.byteOffset).assertEqual(0);
      expect(sample2.byteOffset).assertEqual(4);
      expect(sample3.byteOffset).assertEqual(6);
      expect(sample4.byteOffset).assertEqual(12);
      expect(sample5.byteOffset).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0014
     * @tc.name ESDataViewTest0014
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0014';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int): void => {
        let threw = false;
        try {
          sample.getBigInt64(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13);
      expectError(sample, 9);
      expectError(sample, 5);
      expect(sample.getBigInt64(4)).assertEqual(0n);
      sample = new DataView(buffer, 4);
      expectError(sample, 1);
      expect(sample.getBigInt64(0)).assertEqual(0n);
      sample = new DataView(buffer, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 9);
      expectError(sample, 0);
      sample = new DataView(buffer, 0, 8);
      expectError(sample, 1);
      expect(sample.getBigInt64(0)).assertEqual(0n);
      sample = new DataView(buffer, 0, 7);
      expectError(sample, 0);
      sample = new DataView(buffer, 4, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 4, 7);
      expectError(sample, 0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0015
     * @tc.name ESDataViewTest0015
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0015';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try {
        sample.getBigInt64(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0016
     * @tc.name ESDataViewTest0016
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0016';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expect(sample.getBigInt64(0, true)).assertEqual(0n);
      expect(sample.getBigInt64(1, true)).assertEqual(0n);
      expect(sample.getBigInt64(2, true)).assertEqual(0n);
      expect(sample.getBigInt64(3, true)).assertEqual(0n);
      expect(sample.getBigInt64(4, true)).assertEqual(0n);
      expect(sample.getBigInt64(0, false)).assertEqual(0n);
      expect(sample.getBigInt64(1, false)).assertEqual(0n);
      expect(sample.getBigInt64(2, false)).assertEqual(0n);
      expect(sample.getBigInt64(3, false)).assertEqual(0n);
      expect(sample.getBigInt64(4, false)).assertEqual(0n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0017
     * @tc.name ESDataViewTest0017
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0017';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      sample.setUint8(12, 0x80);
      sample.setUint8(13, 0x7f);
      sample.setUint8(14, 0xff);
      sample.setUint8(15, 0x80);
      sample = new DataView(buffer, 4);
      expect(sample.getBigInt64(0, false)).assertEqual(new BigInt(-0x7fff7ffe80fffefe));
      expect(sample.getBigInt64(1, false)).assertEqual(new BigInt(0x80017f00010280));
      expect(sample.getBigInt64(2, false)).assertEqual(new BigInt(-0x7ffe80fffefd7f81));
      expect(sample.getBigInt64(3, false)).assertEqual(new BigInt(0x17f000102807fff));
      expect(sample.getBigInt64(4, false)).assertEqual(new BigInt(0x7f000102807fff80));
      expect(sample.getBigInt64(0, true)).assertEqual(new BigInt(0x201007f01800080));
      expect(sample.getBigInt64(1, true)).assertEqual(new BigInt(-0x7ffdfeff80fe8000));
      expect(sample.getBigInt64(2, true)).assertEqual(new BigInt(0x7f800201007f0180));
      expect(sample.getBigInt64(3, true)).assertEqual(new BigInt(-0x807ffdfeff80ff));
      expect(sample.getBigInt64(4, true)).assertEqual(new BigInt(-0x7f00807ffdfeff81));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0018
     * @tc.name ESDataViewTest0018
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0018';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      sample.setUint8(12, 0x80);
      sample.setUint8(13, 0x7f);
      sample.setUint8(14, 0xff);
      sample.setUint8(15, 0x80);
      expect(sample.getBigInt64(0, false)).assertEqual(new BigInt(0x2702060280008001));
      expect(sample.getBigInt64(1, false)).assertEqual(new BigInt(0x20602800080017f));
      expect(sample.getBigInt64(2, false)).assertEqual(new BigInt(0x602800080017f00));
      expect(sample.getBigInt64(3, false)).assertEqual(new BigInt(0x2800080017f0001));
      expect(sample.getBigInt64(4, false)).assertEqual(new BigInt(-0x7fff7ffe80fffefe));
      expect(sample.getBigInt64(5, false)).assertEqual(new BigInt(0x80017f00010280));
      expect(sample.getBigInt64(6, false)).assertEqual(new BigInt(-0x7ffe80fffefd7f81));
      expect(sample.getBigInt64(7, false)).assertEqual(new BigInt(0x17f000102807fff));
      expect(sample.getBigInt64(8, false)).assertEqual(new BigInt(0x7f000102807fff80));
      expect(sample.getBigInt64(0, true)).assertEqual(new BigInt(0x180008002060227));
      expect(sample.getBigInt64(1, true)).assertEqual(new BigInt(0x7f01800080020602));
      expect(sample.getBigInt64(2, true)).assertEqual(new BigInt(0x7f018000800206));
      expect(sample.getBigInt64(3, true)).assertEqual(new BigInt(0x1007f0180008002));
      expect(sample.getBigInt64(4, true)).assertEqual(new BigInt(0x201007f01800080));
      expect(sample.getBigInt64(5, true)).assertEqual(new BigInt(-0x7ffdfeff80fe8000));
      expect(sample.getBigInt64(6, true)).assertEqual(new BigInt(0x7f800201007f0180));
      expect(sample.getBigInt64(7, true)).assertEqual(new BigInt(-0x807ffdfeff80ff));
      expect(sample.getBigInt64(8, true)).assertEqual(new BigInt(-0x7f00807ffdfeff81));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0019
     * @tc.name ESDataViewTest0019
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0019';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(7, 0xff);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(0xff));
      expect(sample.getBigInt64(0, false)).assertEqual(new BigInt(0xff));
      expect(sample.getBigInt64(0, true)).assertEqual(new BigInt(-0x100000000000000));
      expect(sample.getBigInt64(0, undefined)).assertEqual(new BigInt(0xff));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0020
     * @tc.name ESDataViewTest0020
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0020';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg1: string, msg2: string): void =>{
        let threw = false;
        try {
          sample.getBigInt64(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(0x2702060280008001));
      expect(sample.getBigInt64(1)).assertEqual(new BigInt(0x20602800080017f));
      expect(sample.getBigInt64(2)).assertEqual(new BigInt(0x602800080017F00));
      expect(sample.getBigInt64(3)).assertEqual(new BigInt(0x2800080017F0001));
      expectError(sample, -1, "-1", "wrong index");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0021
     * @tc.name ESDataViewTest0021
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0021';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int): void => {
        let threw = false;
        try {
          sample.getBigUint64(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }

      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13);
      expectError(sample, 9);
      expectError(sample, 5);
      expect(sample.getBigUint64(4)).assertEqual(0n);
      sample = new DataView(buffer, 4);
      expectError(sample, 1);
      expect(sample.getBigUint64(0)).assertEqual(0n);
      sample = new DataView(buffer, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 9);
      expectError(sample, 0);
      sample = new DataView(buffer, 0, 8);
      expectError(sample, 1);
      expect(sample.getBigUint64(0)).assertEqual(0n);
      sample = new DataView(buffer, 0, 7);
      expectError(sample, 0);
      sample = new DataView(buffer, 4, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 4, 7);
      expectError(sample, 0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0022
     * @tc.name ESDataViewTest0022
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0022';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getBigUint64(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0023
     * @tc.name ESDataViewTest0023
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0023';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expect(sample.getBigUint64(0, true)).assertEqual(0n);
      expect(sample.getBigUint64(1, true)).assertEqual(0n);
      expect(sample.getBigUint64(2, true)).assertEqual(0n);
      expect(sample.getBigUint64(3, true)).assertEqual(0n);
      expect(sample.getBigUint64(4, true)).assertEqual(0n);
      expect(sample.getBigUint64(0, false)).assertEqual(0n);
      expect(sample.getBigUint64(1, false)).assertEqual(0n);
      expect(sample.getBigUint64(2, false)).assertEqual(0n);
      expect(sample.getBigUint64(3, false)).assertEqual(0n);
      expect(sample.getBigUint64(4, false)).assertEqual(0n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0024
     * @tc.name ESDataViewTest0024
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0024';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      sample.setUint8(12, 0x80);
      sample.setUint8(13, 0x7f);
      sample.setUint8(14, 0xff);
      sample.setUint8(15, 0x80);
      sample = new DataView(buffer, 4);
      expect(sample.getBigUint64(0, false)).assertEqual(new BigInt(0x800080017f0001) * 256n + 2n);
      expect(sample.getBigUint64(1, false)).assertEqual(new BigInt(0x80017f00010280));
      expect(sample.getBigUint64(2, false)).assertEqual(new BigInt(0x80017f00010280) * 256n + 127n);
      expect(sample.getBigUint64(3, false)).assertEqual(new BigInt(0x17f000102807fff));
      expect(sample.getBigUint64(4, false)).assertEqual(new BigInt(0x7f000102807fff80));
      expect(sample.getBigUint64(0, true)).assertEqual(new BigInt(0x201007f01800080));
      expect(sample.getBigUint64(1, true)).assertEqual(new BigInt(0x800201007f0180) * 256n);
      expect(sample.getBigUint64(2, true)).assertEqual(new BigInt(0x7f800201007f0180));
      expect(sample.getBigUint64(3, true)).assertEqual(new BigInt(0xff7f800201007f) * 256n + 1n);
      expect(sample.getBigUint64(4, true)).assertEqual(new BigInt(0x80ff7f80020100) * 256n + 127n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0025
     * @tc.name ESDataViewTest0025
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0025';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      sample.setUint8(12, 0x80);
      sample.setUint8(13, 0x7f);
      sample.setUint8(14, 0xff);
      sample.setUint8(15, 0x80);
      expect(sample.getBigUint64(0, false)).assertEqual(new BigInt(0x2702060280008001));
      expect(sample.getBigUint64(1, false)).assertEqual(new BigInt(0x20602800080017f));
      expect(sample.getBigUint64(2, false)).assertEqual(new BigInt(0x602800080017f00));
      expect(sample.getBigUint64(3, false)).assertEqual(new BigInt(0x2800080017f0001));
      expect(sample.getBigUint64(4, false)).assertEqual(new BigInt(0x800080017f0001) * 256n + 2n);
      expect(sample.getBigUint64(5, false)).assertEqual(new BigInt(0x80017f00010280));
      expect(sample.getBigUint64(6, false)).assertEqual(new BigInt(0x80017f00010280) * 256n + 127n);
      expect(sample.getBigUint64(7, false)).assertEqual(new BigInt(0x17f000102807fff));
      expect(sample.getBigUint64(8, false)).assertEqual(new BigInt(0x7f000102807fff80));
      expect(sample.getBigUint64(0, true)).assertEqual(new bigint(0x180008002060227));
      expect(sample.getBigUint64(1, true)).assertEqual(new bigint(0x7f01800080020602));
      expect(sample.getBigUint64(2, true)).assertEqual(new bigint(0x7f018000800206));
      expect(sample.getBigUint64(3, true)).assertEqual(new bigint(0x1007f0180008002));
      expect(sample.getBigUint64(4, true)).assertEqual(new bigint(0x201007f01800080));
      expect(sample.getBigUint64(5, true)).assertEqual(new bigint(0x800201007F0180) * 256n);
      expect(sample.getBigUint64(6, true)).assertEqual(new bigint(0x7f800201007f0180));
      expect(sample.getBigUint64(7, true)).assertEqual(new bigint(0xff7f800201007f) * 256n + 1n);
      expect(sample.getBigUint64(8, true)).assertEqual(new bigint(0x80ff7f80020100) * 256n + 127n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0026
     * @tc.name ESDataViewTest0026
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0026';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(7, 0xff);
      expect(sample.getBigUint64(0)).assertEqual(new BigInt(0xff));
      expect(sample.getBigUint64(0, false)).assertEqual(new BigInt(0xff));
      expect(sample.getBigUint64(0, true)).assertEqual(new BigInt(0xff000000000000) * 256n);
      expect(sample.getBigUint64(0, undefined)).assertEqual(new BigInt(0xff));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0027
     * @tc.name ESDataViewTest0027
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0027';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg1: string, msg2: string): void => {
        let threw = false;
        try {
          sample.getBigUint64(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      expect(sample.getBigUint64(0)).assertEqual(new BigInt(0x2702060280008001));
      expect(sample.getBigUint64(1)).assertEqual(new BigInt(0x20602800080017f));
      expect(sample.getBigUint64(2)).assertEqual(new BigInt(0x602800080017F00));
      expect(sample.getBigUint64(3)).assertEqual(new BigInt(0x2800080017F0001));
      expect(sample.getBigUint64(4)).assertEqual(new BigInt(0x800080017F0001) * 256n + 2n);
      expectError(sample, -1, "-1", "wrong index");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0028
     * @tc.name ESDataViewTest0028
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0028';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int): void => {
        let threw = false;
        try {
          sample.getFloat32(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }

      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13);
      expectError(sample, 11);
      expectError(sample, 9);
      expect(sample.getFloat32(8)).assertEqual(0);
      sample = new DataView(buffer, 8);
      expectError(sample, 1);
      expect(sample.getFloat32(0)).assertEqual(0);
      sample = new DataView(buffer, 9);
      expectError(sample, 0);
      sample = new DataView(buffer, 0, 4);
      expectError(sample, 1);
      sample = new DataView(buffer, 0, 3);
      expectError(sample, 0);
      sample = new DataView(buffer, 4, 4);
      expectError(sample, 1);
      expect(sample.getFloat32(0)).assertEqual(0);
      sample = new DataView(buffer, 4, 3);
      expectError(sample, 0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0029
     * @tc.name ESDataViewTest0029
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0029';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getFloat32(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0030
     * @tc.name ESDataViewTest0030
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0030';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 128);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 255);
      sample.setUint8(5, 128);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(sample.getFloat32(0)).assertEqual(Infinity);
      expect(sample.getFloat32(4)).assertEqual(-Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0031
     * @tc.name ESDataViewTest0031
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0031';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 192);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 255);
      sample.setUint8(5, 192);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(Number.isNaN(sample.getFloat32(0))).assertEqual(true);
      expect(Number.isNaN(sample.getFloat32(4))).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0032
     * @tc.name ESDataViewTest0032
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0032';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      expect(sample.getFloat32(0, true)).assertEqual(0);
      expect(sample.getFloat32(1, true)).assertEqual(0);
      expect(sample.getFloat32(2, true)).assertEqual(0);
      expect(sample.getFloat32(3, true)).assertEqual(0);
      expect(sample.getFloat32(4, true)).assertEqual(0);
      expect(sample.getFloat32(0, false)).assertEqual(0);
      expect(sample.getFloat32(1, false)).assertEqual(0);
      expect(sample.getFloat32(2, false)).assertEqual(0);
      expect(sample.getFloat32(3, false)).assertEqual(0);
      expect(sample.getFloat32(4, false)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0033
     * @tc.name ESDataViewTest0033
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0033';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(4, 75);
      sample.setUint8(5, 75);
      sample.setUint8(6, 75);
      sample.setUint8(7, 75);
      sample.setUint8(8, 76);
      sample.setUint8(9, 76);
      sample.setUint8(10, 77);
      sample.setUint8(11, 77);
      sample = new DataView(buffer, 4);
      expect(sample.getFloat32(0, false)).assertEqual(13323083);
      expect(sample.getFloat32(1, false)).assertEqual(13323084);
      expect(sample.getFloat32(2, false)).assertEqual(13323340);
      expect(sample.getFloat32(3, false)).assertEqual(13388877);
      expect(sample.getFloat32(4, false)).assertEqual(53556532);
      expect(sample.getFloat32(0, true)).assertEqual(13323083);
      expect(sample.getFloat32(1, true)).assertEqual(53292332);
      expect(sample.getFloat32(2, true)).assertEqual(53554476);
      expect(sample.getFloat32(3, true)).assertEqual(214222000);
      expect(sample.getFloat32(4, true)).assertEqual(215270592);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0034
     * @tc.name ESDataViewTest0034
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0034';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 66);
      sample.setUint8(1, 40);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 64);
      sample.setUint8(5, 224);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(sample.getFloat32(0, false)).assertEqual(42);
      expect(sample.getFloat32(1, false)).assertEqual(7.105481567709626e-15);
      expect(sample.getFloat32(2, false)).assertEqual(2.327276489550656e-41);
      expect(sample.getFloat32(3, false)).assertEqual(5.95782781324968e-39);
      expect(sample.getFloat32(4, false)).assertEqual(7);
      expect(sample.getFloat32(0, true)).assertEqual(1.4441781973331565e-41);
      expect(sample.getFloat32(1, true)).assertEqual(2.000009536743164);
      expect(sample.getFloat32(2, true)).assertEqual(-55340232221128655000.0);
      expect(sample.getFloat32(3, true)).assertEqual(2.059411001342953e-38);
      expect(sample.getFloat32(4, true)).assertEqual(8.04457422399591e-41);
      sample.setUint8(0, 75);
      sample.setUint8(1, 75);
      sample.setUint8(2, 76);
      sample.setUint8(3, 76);
      sample.setUint8(4, 75);
      sample.setUint8(5, 75);
      sample.setUint8(6, 76);
      sample.setUint8(7, 76);
      expect(sample.getFloat32(0, false)).assertEqual(13323340);
      expect(sample.getFloat32(1, false)).assertEqual(13388875);
      expect(sample.getFloat32(2, false)).assertEqual(53554476);
      expect(sample.getFloat32(3, false)).assertEqual(53292336);
      expect(sample.getFloat32(4, false)).assertEqual(13323340);
      expect(sample.getFloat32(0, true)).assertEqual(53554476);
      expect(sample.getFloat32(1, true)).assertEqual(13388875);
      expect(sample.getFloat32(2, true)).assertEqual(13323340);
      expect(sample.getFloat32(3, true)).assertEqual(53292336);
      expect(sample.getFloat32(4, true)).assertEqual(53554476);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0035
     * @tc.name ESDataViewTest0035
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0035';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 75);
      sample.setUint8(1, 75);
      sample.setUint8(2, 76);
      sample.setUint8(3, 76);
      expect(sample.getFloat32(0)).assertEqual(13323340);
      expect(sample.getFloat32(0, undefined)).assertEqual(13323340);
      expect(sample.getFloat32(0, false)).assertEqual(13323340);
      expect(sample.getFloat32(0, true)).assertEqual(53554476);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0036
     * @tc.name ESDataViewTest0036
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0036';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 75);
      sample.setUint8(1, 75);
      sample.setUint8(2, 76);
      sample.setUint8(3, 76);
      sample.setUint8(4, 75);
      sample.setUint8(5, 75);
      sample.setUint8(6, 76);
      sample.setUint8(7, 76);
      expect(sample.getFloat32(0)).assertEqual(13323340);
      expect(sample.getFloat32(-0)).assertEqual(13323340);
      expect(sample.getFloat32(1)).assertEqual(13388875);
      expect(sample.getFloat32(2)).assertEqual(53554476);
      expect(sample.getFloat32(3)).assertEqual(53292336);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0037
     * @tc.name ESDataViewTest0037
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0037';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int): void => {
        let threw = false;
        try {
          sample.getFloat64(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13);
      expectError(sample, 9);
      expectError(sample, 5);
      expect(sample.getFloat64(4)).assertEqual(0);
      sample = new DataView(buffer, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 9);
      expectError(sample, 0);
      sample = new DataView(buffer, 0, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 0, 7);
      expectError(sample, 0);
      sample = new DataView(buffer, 4, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 4, 7);
      expectError(sample, 0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0038
     * @tc.name ESDataViewTest0038
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0038';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getFloat64(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0039
     * @tc.name ESDataViewTest0039
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0039';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 240);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(sample.getFloat64(0)).assertEqual(Infinity);
      sample.setUint8(0, 255);
      sample.setUint8(1, 240);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(sample.getFloat64(0)).assertEqual(-Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0040
     * @tc.name ESDataViewTest0040
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0040';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 248);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(Number.isNaN(sample.getFloat64(0))).assertEqual(true);
      sample.setUint8(0, 127);
      sample.setUint8(1, 249);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(Number.isNaN(sample.getFloat64(0))).assertEqual(true);
      sample.setUint8(0, 127);
      sample.setUint8(1, 250);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(Number.isNaN(sample.getFloat64(0))).assertEqual(true);
      sample.setUint8(0, 127);
      sample.setUint8(1, 251);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(Number.isNaN(sample.getFloat64(0))).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0041
     * @tc.name ESDataViewTest0041
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0041';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expect(sample.getFloat64(0, true)).assertEqual(0);
      expect(sample.getFloat64(1, true)).assertEqual(0);
      expect(sample.getFloat64(2, true)).assertEqual(0);
      expect(sample.getFloat64(3, true)).assertEqual(0);
      expect(sample.getFloat64(4, true)).assertEqual(0);
      expect(sample.getFloat64(0, false)).assertEqual(0);
      expect(sample.getFloat64(1, false)).assertEqual(0);
      expect(sample.getFloat64(2, false)).assertEqual(0);
      expect(sample.getFloat64(3, false)).assertEqual(0);
      expect(sample.getFloat64(4, false)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0042
     * @tc.name ESDataViewTest0042
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0042';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(4, 67);
      sample.setUint8(5, 67);
      sample.setUint8(6, 68);
      sample.setUint8(7, 68);
      sample.setUint8(8, 67);
      sample.setUint8(9, 67);
      sample.setUint8(10, 68);
      sample.setUint8(11, 68);
      sample.setUint8(12, 67);
      sample.setUint8(13, 67);
      sample.setUint8(14, 68);
      sample.setUint8(15, 68);
      sample = new DataView(buffer, 4);
      expect(sample.getFloat64(0, false)).assertEqual(10846169068898440);
      expect(sample.getFloat64(1, false)).assertEqual(11409110432516230);
      expect(sample.getFloat64(2, false)).assertEqual(747563348316297500000.0);
      expect(sample.getFloat64(3, false)).assertEqual(710670423110242000000.0);
      expect(sample.getFloat64(4, false)).assertEqual(10846169068898440);
      expect(sample.getFloat64(0, true)).assertEqual(747563348316297500000.0);
      expect(sample.getFloat64(1, true)).assertEqual(11409110432516230);
      expect(sample.getFloat64(2, true)).assertEqual(10846169068898440);
      expect(sample.getFloat64(3, true)).assertEqual(710670423110242000000.0);
      expect(sample.getFloat64(4, true)).assertEqual(747563348316297500000.0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0043
     * @tc.name ESDataViewTest0043
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0043';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 67);
      sample.setUint8(1, 67);
      sample.setUint8(2, 68);
      sample.setUint8(3, 68);
      sample.setUint8(4, 67);
      sample.setUint8(5, 67);
      sample.setUint8(6, 68);
      sample.setUint8(7, 68);
      sample.setUint8(8, 67);
      sample.setUint8(9, 67);
      sample.setUint8(10, 68);
      sample.setUint8(11, 68);
      sample.setUint8(12, 0);
      sample.setUint8(13, 0);
      sample.setUint8(14, 0);
      sample.setUint8(15, 0);
      expect(sample.getFloat64(0, false)).assertEqual(10846169068898440);
      expect(sample.getFloat64(1, false)).assertEqual(11409110432516230);
      expect(sample.getFloat64(2, false)).assertEqual(747563348316297500000.0);
      expect(sample.getFloat64(3, false)).assertEqual(710670423110242000000.0);
      expect(sample.getFloat64(4, false)).assertEqual(10846169068898440);
      expect(sample.getFloat64(5, false)).assertEqual(11409110432516096);
      expect(sample.getFloat64(6, false)).assertEqual(747563348314040600000.0);
      expect(sample.getFloat64(7, false)).assertEqual(710670422532459300000.0);
      expect(sample.getFloat64(8, false)).assertEqual(10846166811934720);
      expect(sample.getFloat64(0, true)).assertEqual(747563348316297500000.0);
      expect(sample.getFloat64(1, true)).assertEqual(11409110432516230);
      expect(sample.getFloat64(2, true)).assertEqual(10846169068898440);
      expect(sample.getFloat64(3, true)).assertEqual(710670423110242000000.0);
      expect(sample.getFloat64(4, true)).assertEqual(747563348316297500000.0);
      expect(sample.getFloat64(5, true)).assertEqual(2.254739805726094e-307);
      expect(sample.getFloat64(6, true)).assertEqual(3.7084555987028e-310);
      expect(sample.getFloat64(7, true)).assertEqual(1.44861546824e-312);
      expect(sample.getFloat64(8, true)).assertEqual(5.65865417e-315);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0044
     * @tc.name ESDataViewTest0044
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0044';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 67);
      sample.setUint8(1, 17);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 20);
      sample.setUint8(7, 68);
      expect(sample.getFloat64(0)).assertEqual(1196268651021585);
      expect(sample.getFloat64(0, undefined)).assertEqual(1196268651021585);
      expect(sample.getFloat64(0, false)).assertEqual(1196268651021585);
      expect(sample.getFloat64(0, true)).assertEqual(92233720368620160000.0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0045
     * @tc.name ESDataViewTest0045
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0045';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 67);
      sample.setUint8(1, 67);
      sample.setUint8(2, 68);
      sample.setUint8(3, 68);
      sample.setUint8(4, 67);
      sample.setUint8(5, 67);
      sample.setUint8(6, 68);
      sample.setUint8(7, 68);
      sample.setUint8(8, 67);
      sample.setUint8(9, 68);
      sample.setUint8(10, 68);
      sample.setUint8(11, 68);
      expect(sample.getFloat64(0)).assertEqual(10846169068898440);
      expect(sample.getFloat64(1)).assertEqual(11409110432516230);
      expect(sample.getFloat64(2)).assertEqual(747563348316297600000.0);
      expect(sample.getFloat64(-0)).assertEqual(10846169068898440);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0046
     * @tc.name ESDataViewTest0046
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0046';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg: string): void => {
        let threw = false;
        try {
          sample.getInt16(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13, "13 + 2 > 12");
      expectError(sample, 11, "11 + 2 > 12");
      expect(sample.getInt16(10)).assertEqual(0);
      sample = new DataView(buffer, 10);
      expectError(sample, 1, "1 + 2 > 2 (offset)");
      sample = new DataView(buffer, 11);
      expectError(sample, 0, "0 + 2 > 1 (offset)");
      sample = new DataView(buffer, 0, 2);
      expectError(sample, 1, "1 + 2 > 2 (length)");
      sample = new DataView(buffer, 0, 1);
      expectError(sample, 0, "0 + 2 > 1 (length)");
      sample = new DataView(buffer, 4, 2);
      expectError(sample, 1, "1 + 2 > 2 (offset+length)");
      sample = new DataView(buffer, 4, 1);
      expectError(sample, 0, "0 + 2 > 1 (offset+length)");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0047
     * @tc.name ESDataViewTest0047
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0047';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getInt16(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0048
     * @tc.name ESDataViewTest0048
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0048';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(6);
      let sample = new DataView(buffer, 0);
      expect(sample.getInt16(0, true)).assertEqual(0);
      expect(sample.getInt16(1, true)).assertEqual(0);
      expect(sample.getInt16(2, true)).assertEqual(0);
      expect(sample.getInt16(3, true)).assertEqual(0);
      expect(sample.getInt16(4, true)).assertEqual(0);
      expect(sample.getInt16(0, false)).assertEqual(0);
      expect(sample.getInt16(1, false)).assertEqual(0);
      expect(sample.getInt16(2, false)).assertEqual(0);
      expect(sample.getInt16(3, false)).assertEqual(0);
      expect(sample.getInt16(4, false)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0049
     * @tc.name ESDataViewTest0049
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0049';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0);
      sample.setUint8(1, 2);
      sample.setUint8(2, 6);
      sample.setUint8(3, 2);
      sample.setUint8(4, 128);
      sample.setUint8(5, 42);
      sample.setUint8(6, 128);
      sample.setUint8(7, 39);
      sample = new DataView(buffer, 4);
      expect(sample.getInt16(0, false)).assertEqual(-32726);
      expect(sample.getInt16(1, false)).assertEqual(10880);
      expect(sample.getInt16(2, false)).assertEqual(-32729);
      expect(sample.getInt16(0, true)).assertEqual(10880);
      expect(sample.getInt16(1, true)).assertEqual(-32726);
      expect(sample.getInt16(2, true)).assertEqual(10112);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0050
     * @tc.name ESDataViewTest0050
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0050';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 255);
      sample.setUint8(3, 255);
      sample.setUint8(4, 128);
      sample.setUint8(5, 0);
      sample.setUint8(6, 1);
      sample.setUint8(7, 0);
      expect(sample.getInt16(0, false)).assertEqual(32767);
      expect(sample.getInt16(1, false)).assertEqual(-1);
      expect(sample.getInt16(2, false)).assertEqual(-1);
      expect(sample.getInt16(3, false)).assertEqual(-128);
      expect(sample.getInt16(4, false)).assertEqual(-32768);
      expect(sample.getInt16(5, false)).assertEqual(1);
      expect(sample.getInt16(6, false)).assertEqual(256);
      expect(sample.getInt16(0, true)).assertEqual(-129);
      expect(sample.getInt16(1, true)).assertEqual(-1);
      expect(sample.getInt16(2, true)).assertEqual(-1);
      expect(sample.getInt16(3, true)).assertEqual(-32513);
      expect(sample.getInt16(4, true)).assertEqual(128);
      expect(sample.getInt16(5, true)).assertEqual(256);
      expect(sample.getInt16(6, true)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0051
     * @tc.name ESDataViewTest0051
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0051';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(2);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0);
      sample.setUint8(1, 42);
      expect(sample.getInt16(0)).assertEqual(42);
      expect(sample.getInt16(0, undefined)).assertEqual(42);
      expect(sample.getInt16(0, false)).assertEqual(42);
      expect(sample.getInt16(0, true)).assertEqual(10752);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0052
     * @tc.name ESDataViewTest0052
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0052';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 1);
      sample.setUint8(3, 127);
      sample.setUint8(4, 255);
      expect(sample.getInt16(-0)).assertEqual(32767);
      expect(sample.getInt16(0)).assertEqual(32767);
      expect(sample.getInt16(1)).assertEqual(-255);
      expect(sample.getInt16(2)).assertEqual(383);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0053
     * @tc.name ESDataViewTest0053
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0053';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      let expectError = (sample: DataView, offset: int, msg: string): void => {
        let threw = false;
        try {
          sample.getInt32(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      expectError(sample, 13, "13 + 4 > 12");
      expectError(sample, 12, "12 + 4 > 12");
      expectError(sample, 11, "11 + 4 > 12");
      expectError(sample, 10, "10 + 4 > 12");
      expectError(sample, 9, "9 + 4 > 12");
      expect(sample.getInt32(8)).assertEqual(0);
      sample = new DataView(buffer, 8);
      expectError(sample, 1, "1 + 4 > 4 (offset)");
      sample = new DataView(buffer, 9);
      expectError(sample, 0, "0 + 4 > 3 (offset)");
      sample = new DataView(buffer, 0, 4);
      expectError(sample, 1, "1 + 4 > 4 (length)");
      sample = new DataView(buffer, 0, 3);
      expectError(sample, 0, "0 + 4 > 3 (length)");
      sample = new DataView(buffer, 4, 4);
      expectError(sample, 1, "1 + 4 > 4 (offset+length)");
      sample = new DataView(buffer, 4, 3);
      expectError(sample, 0, "0 + 4 > 3 (offset+length)");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0054
     * @tc.name ESDataViewTest0054
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0054';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getInt32(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0055
     * @tc.name ESDataViewTest0055
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0055';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      expect(sample.getInt32(0, true)).assertEqual(0);
      expect(sample.getInt32(1, true)).assertEqual(0);
      expect(sample.getInt32(2, true)).assertEqual(0);
      expect(sample.getInt32(3, true)).assertEqual(0);
      expect(sample.getInt32(4, true)).assertEqual(0);
      expect(sample.getInt32(0, false)).assertEqual(0);
      expect(sample.getInt32(1, false)).assertEqual(0);
      expect(sample.getInt32(2, false)).assertEqual(0);
      expect(sample.getInt32(3, false)).assertEqual(0);
      expect(sample.getInt32(4, false)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0056
     * @tc.name ESDataViewTest0056
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0056';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 39);
      sample.setUint8(1, 2);
      sample.setUint8(2, 6);
      sample.setUint8(3, 2);
      sample.setUint8(4, 128);
      sample.setUint8(5, 0);
      sample.setUint8(6, 128);
      sample.setUint8(7, 1);
      sample.setUint8(8, 127);
      sample.setUint8(9, 0);
      sample.setUint8(10, 127);
      sample.setUint8(11, 1);
      sample = new DataView(buffer, 4);
      expect(sample.getInt32(0, false)).assertEqual(-2147450879);
      expect(sample.getInt32(1, false)).assertEqual(8388991);
      expect(sample.getInt32(2, false)).assertEqual(-2147385600);
      expect(sample.getInt32(3, false)).assertEqual(25100415);
      expect(sample.getInt32(0, true)).assertEqual(25165952);
      expect(sample.getInt32(1, true)).assertEqual(2130804736);
      expect(sample.getInt32(2, true)).assertEqual(8323456);
      expect(sample.getInt32(3, true)).assertEqual(2130738945);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0057
     * @tc.name ESDataViewTest0057
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0057';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 255);
      sample.setUint8(3, 255);
      sample.setUint8(4, 128);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      sample.setUint8(8, 1);
      sample.setUint8(9, 0);
      sample.setUint8(10, 0);
      sample.setUint8(11, 0);
      expect(sample.getInt32(0, false)).assertEqual(2147483647);
      expect(sample.getInt32(1, false)).assertEqual(-128);
      expect(sample.getInt32(2, false)).assertEqual(-32768);
      expect(sample.getInt32(3, false)).assertEqual(-8388608);
      expect(sample.getInt32(4, false)).assertEqual(-2147483648);
      expect(sample.getInt32(5, false)).assertEqual(1);
      expect(sample.getInt32(6, false)).assertEqual(256);
      expect(sample.getInt32(7, false)).assertEqual(65536);
      expect(sample.getInt32(8, false)).assertEqual(16777216);
      expect(sample.getInt32(0, true)).assertEqual(-129);
      expect(sample.getInt32(1, true)).assertEqual(-2130706433);
      expect(sample.getInt32(2, true)).assertEqual(8454143);
      expect(sample.getInt32(3, true)).assertEqual(33023);
      expect(sample.getInt32(4, true)).assertEqual(128);
      expect(sample.getInt32(5, true)).assertEqual(16777216);
      expect(sample.getInt32(6, true)).assertEqual(65536);
      expect(sample.getInt32(7, true)).assertEqual(256);
      expect(sample.getInt32(8, true)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0058
     * @tc.name ESDataViewTest0058
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0058';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0);
      sample.setUint8(1, 17);
      sample.setUint8(2, 4);
      sample.setUint8(3, 0);
      expect(sample.getInt32(0)).assertEqual(1115136);
      expect(sample.getInt32(0, undefined)).assertEqual(1115136);
      expect(sample.getInt32(0, false)).assertEqual(1115136);
      expect(sample.getInt32(0, true)).assertEqual(266496);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0059
     * @tc.name ESDataViewTest0059
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0059';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 255);
      sample.setUint8(3, 255);
      sample.setUint8(4, 128);
      sample.setUint8(5, 255);
      sample.setUint8(6, 255);
      sample.setUint8(7, 255);
      expect(sample.getInt32(-0)).assertEqual(2147483647);
      expect(sample.getInt32(0)).assertEqual(2147483647);
      expect(sample.getInt32(1)).assertEqual(-128);
      expect(sample.getInt32(2)).assertEqual(-32513);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0060
     * @tc.name ESDataViewTest0060
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0060';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      let expectError = (sample: DataView, offset: int, msg: string): void =>{
        let threw = false;
        try {
          sample.getInt8(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      expectError(sample, 13, "13 + 1 > 12");
      expectError(sample, 12, "12 + 1 > 12");
      expect(sample.getInt8(11)).assertEqual(0);
      sample = new DataView(buffer, 11);
      expectError(sample, 1, "1 + 1 > 1 (offset)");
      sample = new DataView(buffer, 0, 1);
      expectError(sample, 1, "1 + 1 > 1 (length)");
      sample = new DataView(buffer, 4, 1);
      expectError(sample, 1, "1 + 1 > 1 (offset+length)");
      sample = new DataView(buffer, 4, 0);
      expectError(sample, 0, "0 + 1 > 0 (offset+length)");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0061
     * @tc.name ESDataViewTest0061
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0061';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try {
        sample.getInt8(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0062
     * @tc.name ESDataViewTest0062
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0062';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      expect(sample.getInt8(0)).assertEqual(0);
      expect(sample.getInt8(1)).assertEqual(0);
      expect(sample.getInt8(2)).assertEqual(0);
      expect(sample.getInt8(3)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0063
     * @tc.name ESDataViewTest0063
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0063';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 7);
      sample.setUint8(1, 7);
      sample.setUint8(2, 7);
      sample.setUint8(3, 7);
      sample.setUint8(4, 1);
      sample.setUint8(5, 127);
      sample.setUint8(6, 128);
      sample.setUint8(7, 255);
      sample = new DataView(buffer, 4);
      expect(sample.getInt8(0)).assertEqual(1);
      expect(sample.getInt8(1)).assertEqual(127);
      expect(sample.getInt8(2)).assertEqual(-128);
      expect(sample.getInt8(3)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0064
     * @tc.name ESDataViewTest0064
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0064';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 0);
      sample.setUint8(3, 1);
      expect(sample.getInt8(0)).assertEqual(127);
      expect(sample.getInt8(1)).assertEqual(-1);
      expect(sample.getInt8(2)).assertEqual(0);
      expect(sample.getInt8(3)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0065
     * @tc.name ESDataViewTest0065
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0065';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 39);
      sample.setUint8(1, 42);
      sample.setUint8(2, 7);
      sample.setUint8(3, 77);
      expect(sample.getInt8(-0)).assertEqual(39);
      expect(sample.getInt8(0)).assertEqual(39);
      expect(sample.getInt8(1)).assertEqual(42);
      expect(sample.getInt8(2)).assertEqual(7);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0066
     * @tc.name ESDataViewTest0066
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0066';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg: string): void =>{
        let threw = false;
        try {
          sample.getUint16(offset);
          expect(false).assertEqual(true);
        } catch (err){
          if(err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13, "13 + 2 > 12");
      expectError(sample, 11, "11 + 2 > 12");
      expect(sample.getUint16(10)).assertEqual(0);
      sample = new DataView(buffer, 10);
      expectError(sample, 1, "1 + 2 > 2 (offset)");
      sample = new DataView(buffer, 11);
      expectError(sample, 0, "0 + 2 > 1 (offset)");
      sample = new DataView(buffer, 0, 2);
      expectError(sample, 1, "1 + 2 > 2 (length)");
      sample = new DataView(buffer, 0, 1);
      expectError(sample, 0, "0 + 2 > 1 (length)");
      sample = new DataView(buffer, 4, 2);
      expectError(sample, 1, "1 + 2 > 2 (offset+length)");
      sample = new DataView(buffer, 4, 1);
      expectError(sample, 0, "0 + 2 > 1 (offset+length)");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0067
     * @tc.name ESDataViewTest0067
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0067';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getUint16(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0068
     * @tc.name ESDataViewTest0068
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0068';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(6);
      let sample = new DataView(buffer, 0);
      expect(sample.getUint16(0, true)).assertEqual(0);
      expect(sample.getUint16(1, true)).assertEqual(0);
      expect(sample.getUint16(2, true)).assertEqual(0);
      expect(sample.getUint16(3, true)).assertEqual(0);
      expect(sample.getUint16(4, true)).assertEqual(0);
      expect(sample.getUint16(0, false)).assertEqual(0);
      expect(sample.getUint16(1, false)).assertEqual(0);
      expect(sample.getUint16(2, false)).assertEqual(0);
      expect(sample.getUint16(3, false)).assertEqual(0);
      expect(sample.getUint16(4, false)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0069
     * @tc.name ESDataViewTest0069
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0069';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0);
      sample.setUint8(1, 2);
      sample.setUint8(2, 6);
      sample.setUint8(3, 2);
      sample.setUint8(4, 128);
      sample.setUint8(5, 42);
      sample.setUint8(6, 128);
      sample.setUint8(7, 39);
      sample = new DataView(buffer, 4);
      expect(sample.getUint16(0, false)).assertEqual(32810);
      expect(sample.getUint16(1, false)).assertEqual(10880);
      expect(sample.getUint16(2, false)).assertEqual(32807);
      expect(sample.getUint16(0, true)).assertEqual(10880);
      expect(sample.getUint16(1, true)).assertEqual(32810);
      expect(sample.getUint16(2, true)).assertEqual(10112);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0070
     * @tc.name ESDataViewTest0070
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0070';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 255);
      sample.setUint8(3, 255);
      sample.setUint8(4, 128);
      sample.setUint8(5, 0);
      sample.setUint8(6, 1);
      sample.setUint8(7, 0);
      expect(sample.getUint16(0, false)).assertEqual(32767);
      expect(sample.getUint16(1, false)).assertEqual(65535);
      expect(sample.getUint16(2, false)).assertEqual(65535);
      expect(sample.getUint16(3, false)).assertEqual(65408);
      expect(sample.getUint16(4, false)).assertEqual(32768);
      expect(sample.getUint16(5, false)).assertEqual(1);
      expect(sample.getUint16(6, false)).assertEqual(256);
      expect(sample.getUint16(0, true)).assertEqual(65407);
      expect(sample.getUint16(1, true)).assertEqual(65535);
      expect(sample.getUint16(2, true)).assertEqual(65535);
      expect(sample.getUint16(3, true)).assertEqual(33023);
      expect(sample.getUint16(4, true)).assertEqual(128);
      expect(sample.getUint16(5, true)).assertEqual(256);
      expect(sample.getUint16(6, true)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0071
     * @tc.name ESDataViewTest0071
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0071';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(2);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0);
      sample.setUint8(1, 42);
      expect(sample.getUint16(0)).assertEqual(42);
      expect(sample.getUint16(0, undefined)).assertEqual(42);
      expect(sample.getUint16(0, false)).assertEqual(42);
      expect(sample.getUint16(0, true)).assertEqual(10752);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0072
     * @tc.name ESDataViewTest0072
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0072';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 1);
      sample.setUint8(3, 127);
      sample.setUint8(4, 255);
      sample.setUint8(5, 1);
      expect(sample.getUint16(-0)).assertEqual(32767);
      expect(sample.getUint16(0)).assertEqual(32767);
      expect(sample.getUint16(1)).assertEqual(65281);
      expect(sample.getUint16(2)).assertEqual(383);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0073
     * @tc.name ESDataViewTest0073
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0073';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg: string): void => {
        let threw = false;
        try {
          sample.getUint32(offset);
          expect(false).assertEqual(true);
        } catch (err){
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13, "13 + 4 > 12");
      expectError(sample, 12, "12 + 4 > 12");
      expectError(sample, 11, "11 + 4 > 12");
      expectError(sample, 10, "10 + 4 > 12");
      expectError(sample, 9, "9 + 4 > 12");
      expect(sample.getUint32(8)).assertEqual(0);
      sample = new DataView(buffer, 8);
      expectError(sample, 1, "1 + 4 > 4 (offset)");
      sample = new DataView(buffer, 9);
      expectError(sample, 0, "0 + 4 > 3 (offset)");
      sample = new DataView(buffer, 0, 4);
      expectError(sample, 1, "1 + 4 > 4 (length)");
      sample = new DataView(buffer, 0, 3);
      expectError(sample, 0, "0 + 4 > 3 (length)");
      sample = new DataView(buffer, 4, 4);
      expectError(sample, 1, "1 + 4 > 4 (offset+length)");
      sample = new DataView(buffer, 4, 3);
      expectError(sample, 0, "0 + 4 > 3 (offset+length)");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0074
     * @tc.name ESDataViewTest0074
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0074';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getUint32(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0075
     * @tc.name ESDataViewTest0075
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0075';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      expect(sample.getUint32(0, true)).assertEqual(0);
      expect(sample.getUint32(1, true)).assertEqual(0);
      expect(sample.getUint32(2, true)).assertEqual(0);
      expect(sample.getUint32(3, true)).assertEqual(0);
      expect(sample.getUint32(4, true)).assertEqual(0);
      expect(sample.getUint32(0, false)).assertEqual(0);
      expect(sample.getUint32(1, false)).assertEqual(0);
      expect(sample.getUint32(2, false)).assertEqual(0);
      expect(sample.getUint32(3, false)).assertEqual(0);
      expect(sample.getUint32(4, false)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0076
     * @tc.name ESDataViewTest0076
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0076';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 39);
      sample.setUint8(1, 2);
      sample.setUint8(2, 6);
      sample.setUint8(3, 2);
      sample.setUint8(4, 128);
      sample.setUint8(5, 0);
      sample.setUint8(6, 128);
      sample.setUint8(7, 1);
      sample.setUint8(8, 127);
      sample.setUint8(9, 0);
      sample.setUint8(10, 127);
      sample.setUint8(11, 1);
      sample = new DataView(buffer, 4);
      expect(sample.getUint32(0, false)).assertEqual(2147516417);
      expect(sample.getUint32(1, false)).assertEqual(8388991);
      expect(sample.getUint32(2, false)).assertEqual(2147581696);
      expect(sample.getUint32(3, false)).assertEqual(25100415);
      expect(sample.getUint32(0, true)).assertEqual(25165952);
      expect(sample.getUint32(1, true)).assertEqual(2130804736);
      expect(sample.getUint32(2, true)).assertEqual(8323456);
      expect(sample.getUint32(3, true)).assertEqual(2130738945);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0077
     * @tc.name ESDataViewTest0077
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0077';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 255);
      sample.setUint8(3, 255);
      sample.setUint8(4, 128);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      sample.setUint8(8, 1);
      sample.setUint8(9, 0);
      sample.setUint8(10, 0);
      sample.setUint8(11, 0);
      expect(sample.getUint32(0, false)).assertEqual(2147483647);
      expect(sample.getUint32(1, false)).assertEqual(4294967168);
      expect(sample.getUint32(2, false)).assertEqual(4294934528);
      expect(sample.getUint32(3, false)).assertEqual(4286578688);
      expect(sample.getUint32(4, false)).assertEqual(2147483648);
      expect(sample.getUint32(5, false)).assertEqual(1);
      expect(sample.getUint32(6, false)).assertEqual(256);
      expect(sample.getUint32(7, false)).assertEqual(65536);
      expect(sample.getUint32(8, false)).assertEqual(16777216);
      expect(sample.getUint32(0, true)).assertEqual(4294967167);
      expect(sample.getUint32(1, true)).assertEqual(2164260863);
      expect(sample.getUint32(2, true)).assertEqual(8454143);
      expect(sample.getUint32(3, true)).assertEqual(33023);
      expect(sample.getUint32(4, true)).assertEqual(128);
      expect(sample.getUint32(5, true)).assertEqual(16777216);
      expect(sample.getUint32(6, true)).assertEqual(65536);
      expect(sample.getUint32(7, true)).assertEqual(256);
      expect(sample.getUint32(8, true)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0078
     * @tc.name ESDataViewTest0078
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0078';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0);
      sample.setUint8(1, 17);
      sample.setUint8(2, 4);
      sample.setUint8(3, 0);
      expect(sample.getUint32(0)).assertEqual(1115136);
      expect(sample.getUint32(0, undefined)).assertEqual(1115136);
      expect(sample.getUint32(0, false)).assertEqual(1115136);
      expect(sample.getUint32(0, true)).assertEqual(266496);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0079
     * @tc.name ESDataViewTest0079
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0079';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 255);
      sample.setUint8(3, 255);
      sample.setUint8(4, 128);
      sample.setUint8(5, 255);
      sample.setUint8(6, 128);
      expect(sample.getUint32(-0)).assertEqual(2147483647);
      expect(sample.getUint32(0)).assertEqual(2147483647);
      expect(sample.getUint32(1)).assertEqual(4294967168);
      expect(sample.getUint32(2)).assertEqual(4294934783);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0080
     * @tc.name ESDataViewTest0080
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0080';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      let expectError = (sample: DataView, offset: int, msg: string): void => {
        let threw = false;
        try {
          sample.getUint8(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      expectError(sample, 13, "13 + 1 > 12");
      expectError(sample, 12, "12 + 1 > 12");
      expect(sample.getUint8(11)).assertEqual(0);
      sample = new DataView(buffer, 11);
      expectError(sample, 1, "1 + 1 > 1 (offset)");
      sample = new DataView(buffer, 0, 1);
      expectError(sample, 1, "1 + 1 > 1 (length)");
      sample = new DataView(buffer, 4, 1);
      expectError(sample, 1, "1 + 1 > 1 (offset+length)");
      sample = new DataView(buffer, 4, 0);
      expectError(sample, 0, "0 + 1 > 0 (offset+length)");

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0081
     * @tc.name ESDataViewTest0081
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0081';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getUint8(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0082
     * @tc.name ESDataViewTest0082
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0082';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      expect(sample.getUint8(0)).assertEqual(0);
      expect(sample.getUint8(1)).assertEqual(0);
      expect(sample.getUint8(2)).assertEqual(0);
      expect(sample.getUint8(3)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0083
     * @tc.name ESDataViewTest0083
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0083';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 7);
      sample.setUint8(1, 7);
      sample.setUint8(2, 7);
      sample.setUint8(3, 7);
      sample.setUint8(4, 1);
      sample.setUint8(5, 127);
      sample.setUint8(6, 128);
      sample.setUint8(7, 255);
      sample = new DataView(buffer, 4);
      expect(sample.getUint8(0)).assertEqual(1);
      expect(sample.getUint8(1)).assertEqual(127);
      expect(sample.getUint8(2)).assertEqual(128);
      expect(sample.getUint8(3)).assertEqual(255);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0084
     * @tc.name ESDataViewTest0084
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0084';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 0);
      sample.setUint8(3, 1);
      expect(sample.getUint8(0)).assertEqual(127);
      expect(sample.getUint8(1)).assertEqual(255);
      expect(sample.getUint8(2)).assertEqual(0);
      expect(sample.getUint8(3)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0085
     * @tc.name ESDataViewTest0085
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0085';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 39);
      sample.setUint8(1, 42);
      sample.setUint8(2, 7);
      sample.setUint8(3, 77);
      expect(sample.getUint8(-0)).assertEqual(39);
      expect(sample.getUint8(0)).assertEqual(39);
      expect(sample.getUint8(1)).assertEqual(42);
      expect(sample.getUint8(2)).assertEqual(7);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0086
     * @tc.name ESDataViewTest0086
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0086';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg: string): void => {
        let threw = false;
        try {
          sample.setBigInt64(offset, 39n);
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
      expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13, "13 + 8 > 12");
      expectError(sample, 12, "12 + 8 > 12");
      expectError(sample, 11, "11 + 8 > 12");
      expectError(sample, 10, "10 + 8 > 12");
      expectError(sample, 9, "9 + 8 > 12");
      expectError(sample, 8, "8 + 8 > 12");
      expectError(sample, 7, "7 + 8 > 12");
      expectError(sample, 6, "6 + 8 > 12");
      expectError(sample, 5, "5 + 8 > 12");
      sample = new DataView(buffer, 8);
      expectError(sample, 1, "1 + 8 > 4");
      sample = new DataView(buffer, 9);
      expectError(sample, 0, "0 + 8 > 3");
      sample = new DataView(buffer, 0, 8);
      expectError(sample, 1, "1 + 8 > 8");
      sample = new DataView(buffer, 4, 8);
      expectError(sample, 1, "1 + 8 > 7");
      sample = new DataView(buffer, 4, 7);
      expectError(sample, 0, "0 + 8 > 7");
      sample = new DataView(buffer, 0);
      expect(sample.getBigInt64(0)).assertEqual(0n);
      expect(sample.getBigInt64(4)).assertEqual(0n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0087
     * @tc.name ESDataViewTest0087
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0087';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.setBigInt64(-1, 39);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      expect(sample.getBigInt64(0)).assertEqual(0n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0088
     * @tc.name ESDataViewTest0088
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0088';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setBigInt64(0, 0n - getBI(0x6f80ff08), true);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(-0x7ff806f00000001));
      sample.setBigInt64(0, 0n - getBI(0x7ff8070), true);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(-0x6f80ff0700000001));
      sample.setBigInt64(0, getBI(0x6f80ff08), true);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(0x8ff806f00000000));
      sample.setBigInt64(0, getBI(0x8ff806f), true);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(0x6f80ff0800000000));
      sample.setBigInt64(0, getBI(0xf8007f90.toInt()), true);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(-0x6f80ff0800000000));
      sample.setBigInt64(0, getBI(0x907f00f8.toInt()), true);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(-0x7ff807000000000));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0089
     * @tc.name ESDataViewTest0089
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0089';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setBigInt64(0, 1n);
      expect(sample.getBigInt64(0)).assertEqual(1n);
      sample.setBigInt64(0, 2n, undefined);
      expect(sample.getBigInt64(0)).assertEqual(2n);
      sample.setBigInt64(0, 3n, false);
      expect(sample.getBigInt64(0)).assertEqual(3n);
      sample.setBigInt64(0, 6n, true);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(0x600000000000000));
      sample.setBigInt64(0, 7n, true);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(0x700000000000000));
      sample.setBigInt64(0, 8n, true);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(0x800000000000000));
      sample.setBigInt64(0, 9n, true);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(0x900000000000000));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0090
     * @tc.name ESDataViewTest0090
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0090';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setBigInt64(0, 0n);
      sample.setBigInt64(-0, 42n);
      expect(sample.getBigInt64(0)).assertEqual(42n);
      sample.setBigInt64(0, 0n);
      sample.setBigInt64(0, 42n);
      expect(sample.getBigInt64(0)).assertEqual(42n);
      sample.setBigInt64(1, 0n);
      sample.setBigInt64(1, 42n);
      expect(sample.getBigInt64(1)).assertEqual(42n);
      sample.setBigInt64(2, 0n);
      sample.setBigInt64(2, 42n);
      expect(sample.getBigInt64(2)).assertEqual(42n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0091
     * @tc.name ESDataViewTest0091
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0091';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      let expectError = (sample: DataView, offset: int, msg: string): void =>{
        let threw = false;
        try {
          sample.setFloat32(offset, 39);
          expect(false).assertEqual(true);
        } catch (err){
          if(err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      expectError(sample, 13, "13 + 4 > 12");
      expectError(sample, 11, "11 + 4 > 12");
      expectError(sample, 9, "9 + 4 > 12");
      sample = new DataView(buffer, 8);
      expectError(sample, 1, "1 + 4 > 4");
      sample = new DataView(buffer, 9);
      expectError(sample, 0, "0 + 4 > 3");
      sample = new DataView(buffer, 0, 4);
      expectError(sample, 1, "1 + 4 > 4");
      sample = new DataView(buffer, 0, 3);
      expectError(sample, 0, "0 + 4 > 3");
      sample = new DataView(buffer, 4, 4);
      expectError(sample, 1, "1 + 4 > 4");
      sample = new DataView(buffer, 4, 3);
      expectError(sample, 0, "0 + 4 > 3");
      sample = new DataView(buffer, 0);
      expect(sample.getFloat32(0)).assertEqual(0);
      expect(sample.getFloat32(4)).assertEqual(0);
      expect(sample.getFloat32(8)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0092
     * @tc.name ESDataViewTest0092
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0092';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.setFloat32(-1, 39);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      expect(sample.getFloat32(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0093
     * @tc.name ESDataViewTest0093
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0093';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      sample.setFloat32(0, 42, true);
      expect(sample.getFloat32(0)).assertEqual(1.4441781973331565e-41);
      sample.setFloat32(0, 1.4441781973331565e-41, true);
      expect(sample.getFloat32(0)).assertEqual(42);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0094
     * @tc.name ESDataViewTest0094
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0094';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      sample.setFloat32(0, 1);
      expect(sample.getFloat32(0)).assertEqual(1);
      sample.setFloat32(0, 2, undefined);
      expect(sample.getFloat32(0)).assertEqual(2);
      sample.setFloat32(0, 3, false);
      expect(sample.getFloat32(0)).assertEqual(3);
      sample.setFloat32(0, 6, true);
      expect(sample.getFloat32(0)).assertEqual(6.89663052202102e-41);
      sample.setFloat32(0, 7, true);
      expect(sample.getFloat32(0)).assertEqual(8.04457422399591e-41);
      sample.setFloat32(0, 8, true);
      expect(sample.getFloat32(0)).assertEqual(9.10844001811131e-44);
      sample.setFloat32(0, 9, true);
      expect(sample.getFloat32(0)).assertEqual(5.830802910055564e-42);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0095
     * @tc.name ESDataViewTest0095
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0095';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setFloat32(0, 0);
      sample.setFloat32(-0, 42);
      expect(sample.getFloat32(0)).assertEqual(42);
      sample.setFloat32(0, 0);
      sample.setFloat32(0, 42);
      expect(sample.getFloat32(0)).assertEqual(42);
      sample.setFloat32(1, 0);
      sample.setFloat32(1, 42);
      expect(sample.getFloat32(1)).assertEqual(42);
      sample.setFloat32(2, 0);
      sample.setFloat32(2, 42);
      expect(sample.getFloat32(2)).assertEqual(42);
      sample.setFloat32(2, 42.2);
      expect(sample.getFloat32(2) >= 42.2 - 0.00001).assertEqual(true);
      expect(sample.getFloat32(2) <= 42.2 + 0.00001).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0096
     * @tc.name ESDataViewTest0096
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0096';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      let expectError = (sample: DataView, offset: int, msg: string): void =>{
        let threw = false;
        try {
          sample.setFloat64(offset, 39)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      expectError(sample, 13, "13 + 8 > 12");
      expectError(sample, 9, "9 + 8 > 12");
      expectError(sample, 5, "5 + 8 > 12");
      sample = new DataView(buffer, 8);
      expectError(sample, 1, "1 + 8 > 4 (offset)");
      sample = new DataView(buffer, 9);
      expectError(sample, 0, "0 + 8 > 3 (offset)");
      sample = new DataView(buffer, 0, 8);
      expectError(sample, 1, "1 + 8 > 8");
      sample = new DataView(buffer, 0, 7);
      expectError(sample, 0, "0 + 8 > 7");
      sample = new DataView(buffer, 4, 8);
      expectError(sample, 1, "1 + 8 > 7");
      sample = new DataView(buffer, 4, 7);
      expectError(sample, 0, "0 + 8 > 7");
      sample = new DataView(buffer, 0);
      expect(sample.getFloat64(0)).assertEqual(0);
      expect(sample.getFloat64(4)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0097
     * @tc.name ESDataViewTest0097
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0097';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.setFloat64(-1, 39);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      expect(sample.getFloat64(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0098
     * @tc.name ESDataViewTest0098
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0098';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setFloat64(0, 42, true);
      expect(sample.getFloat64(0)).assertEqual(8.759e-320);
      sample.setFloat64(0, 8.759e-320, true);
      expect(sample.getFloat64(0)).assertEqual(42);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0099
     * @tc.name ESDataViewTest0099
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0099';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setFloat64(0, 1);
      expect(sample.getFloat64(0)).assertEqual(1);
      sample.setFloat64(0, 2, undefined);
      expect(sample.getFloat64(0)).assertEqual(2);
      sample.setFloat64(0, 3, false);
      expect(sample.getFloat64(0)).assertEqual(3);
      sample.setFloat64(0, 3.067e-320, true);
      expect(sample.getFloat64(0)).assertEqual(6);
      sample.setFloat64(0, 3.573e-320, true);
      expect(sample.getFloat64(0)).assertEqual(7);
      sample.setFloat64(0, 4.079e-320, true);
      expect(sample.getFloat64(0)).assertEqual(8);
      sample.setFloat64(0, 4.332e-320, true);
      expect(sample.getFloat64(0)).assertEqual(9);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0100
     * @tc.name ESDataViewTest0100
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0100';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setFloat64(0, 0);
      sample.setFloat64(-0, 42);
      expect(sample.getFloat64(0)).assertEqual(42);
      sample.setFloat64(0, 0);
      sample.setFloat64(0, 42);
      expect(sample.getFloat64(0)).assertEqual(42);
      sample.setFloat64(1, 0);
      sample.setFloat64(1, 42);
      expect(sample.getFloat64(1)).assertEqual(42);
      sample.setFloat64(2, 0);
      sample.setFloat64(2, 42);
      expect(sample.getFloat64(2)).assertEqual(42);
      sample.setFloat64(2, 42.2);
      expect(sample.getFloat64(2)).assertEqual(42.2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0101
     * @tc.name ESDataViewTest0101
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0101';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      let expectError = (sample: DataView, offset: int, msg: string): void =>{
        let threw = false;
        try {
          sample.setInt16(offset, 39);
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      expectError(sample, 13, "13 + 2 > 12");
      expectError(sample, 11, "11 + 2 > 12");
      sample = new DataView(buffer, 10);
      expectError(sample, 1, "1 + 2 > 2 (offset)");
      sample = new DataView(buffer, 11);
      expectError(sample, 0, "0 + 2 > 1 (offset)");
      sample = new DataView(buffer, 0, 2);
      expectError(sample, 1, "1 + 2 > 2 (length)");
      sample = new DataView(buffer, 0, 1);
      expectError(sample, 0, "0 + 2 > 1 (length)");
      sample = new DataView(buffer, 4, 2);
      expectError(sample, 1, "1 + 2 > 2 (offset+length)");
      sample = new DataView(buffer, 4, 1);
      expectError(sample, 0, "0 + 2 > 1 (offset+length)");
      sample = new DataView(buffer, 0);
      expect(sample.getInt16(0)).assertEqual(0);
      expect(sample.getInt16(2)).assertEqual(0);
      expect(sample.getInt16(4)).assertEqual(0);
      expect(sample.getInt16(6)).assertEqual(0);
      expect(sample.getInt16(8)).assertEqual(0);
      expect(sample.getInt16(10)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0102
     * @tc.name ESDataViewTest0102
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0102';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.setInt16(-1, 39);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      expect(sample.getInt16(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0103
     * @tc.name ESDataViewTest0103
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0103';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setInt16(0, -1870724872, true);
      expect(sample.getInt16(0)).assertEqual(-2048);
      sample.setInt16(0, -134185072, true);
      expect(sample.getInt16(0)).assertEqual(-28545);
      sample.setInt16(0, 1870724872, true);
      expect(sample.getInt16(0)).assertEqual(2303);
      sample.setInt16(0, 150962287, true);
      expect(sample.getInt16(0)).assertEqual(28544);
      sample.setInt16(0, 4160782224, true);
      expect(sample.getInt16(0)).assertEqual(-28545);
      sample.setInt16(0, 2424242424, true);
      expect(sample.getInt16(0)).assertEqual(-2048);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0104
     * @tc.name ESDataViewTest0104
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0104';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setInt16(0, 1);
      expect(sample.getInt16(0)).assertEqual(1);
      sample.setInt16(0, 2, undefined);
      expect(sample.getInt16(0)).assertEqual(2);
      sample.setInt16(0, 3, false);
      expect(sample.getInt16(0)).assertEqual(3);
      sample.setInt16(0, 1536, true);
      expect(sample.getInt16(0)).assertEqual(6);
      sample.setInt16(0, 1792, true);
      expect(sample.getInt16(0)).assertEqual(7);
      sample.setInt16(0, 2048, true);
      expect(sample.getInt16(0)).assertEqual(8);
      sample.setInt16(0, 2304, true);
      expect(sample.getInt16(0)).assertEqual(9);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0105
     * @tc.name ESDataViewTest0105
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0105';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setInt16(0, 0);
      sample.setInt16(-0, 42);
      expect(sample.getInt16(0)).assertEqual(42);
      sample.setInt16(0, 0);
      sample.setInt16(0, 42);
      expect(sample.getInt16(0)).assertEqual(42);
      sample.setInt16(1, 0);
      sample.setInt16(1, 42);
      expect(sample.getInt16(1)).assertEqual(42);
      sample.setInt16(2, 0);
      sample.setInt16(2, 42);
      expect(sample.getInt16(2)).assertEqual(42);
      sample.setInt16(2, 42.2);
      expect(sample.getInt16(2)).assertEqual(42);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0106
     * @tc.name ESDataViewTest0106
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0106';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      let expectError = (sample: DataView, offset: int, msg: string): void =>{
        let threw = false;
        try {
          sample.setInt32(offset, 39)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      expectError(sample, 13, "13 + 4 > 12");
      expectError(sample, 12, "12 + 4 > 12");
      expectError(sample, 11, "11 + 4 > 12");
      expectError(sample, 10, "10 + 4 > 12");
      expectError(sample, 9, "9 + 4 > 12");
      sample = new DataView(buffer, 8);
      expectError(sample, 1, "1 + 4 > 4 (offset)");
      sample = new DataView(buffer, 9);
      expectError(sample, 0, "0 + 4 > 3 (offset)");
      sample = new DataView(buffer, 0, 4);
      expectError(sample, 1, "1 + 4 > 4 (length)");
      sample = new DataView(buffer, 0, 3);
      expectError(sample, 0, "0 + 4 > 3 (length)");
      sample = new DataView(buffer, 4, 4);
      expectError(sample, 1, "1 + 4 > 4 (offset+length)");
      sample = new DataView(buffer, 4, 3);
      expectError(sample, 0, "0 + 4 > 3 (offset+length)");
      sample = new DataView(buffer, 0);
      expect(sample.getInt32(0)).assertEqual(0);
      expect(sample.getInt32(4)).assertEqual(0);
      expect(sample.getInt32(8)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0107
     * @tc.name ESDataViewTest0107
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0107';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.setInt32(-1, 39);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      expect(sample.getInt32(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0108
     * @tc.name ESDataViewTest0108
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0108';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setInt32(0, -1870724872, true);
      expect(sample.getInt32(0)).assertEqual(-134185072);
      sample.setInt32(0, -134185072, true);
      expect(sample.getInt32(0)).assertEqual(-1870724872);
      sample.setInt32(0, 1870724872, true);
      expect(sample.getInt32(0)).assertEqual(150962287);
      sample.setInt32(0, 150962287, true);
      expect(sample.getInt32(0)).assertEqual(1870724872);
      sample.setInt32(0, 2424242424, true);
      expect(sample.getInt32(0)).assertEqual(-134185072);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0109
     * @tc.name ESDataViewTest0109
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0109';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setInt32(0, 1);
      expect(sample.getInt32(0)).assertEqual(1);
      sample.setInt32(0, 2, undefined);
      expect(sample.getInt32(0)).assertEqual(2);
      sample.setInt32(0, 3, false);
      expect(sample.getInt32(0)).assertEqual(3);
      sample.setInt32(0, 6, true);
      expect(sample.getInt32(0)).assertEqual(100663296);
      sample.setInt32(0, 7, true);
      expect(sample.getInt32(0)).assertEqual(117440512);
      sample.setInt32(0, 8, true);
      expect(sample.getInt32(0)).assertEqual(134217728);
      sample.setInt32(0, 9, true);
      expect(sample.getInt32(0)).assertEqual(150994944);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0110
     * @tc.name ESDataViewTest0110
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0110';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setInt32(0, 0);
      sample.setInt32(-0, 42);
      expect(sample.getInt32(0)).assertEqual(42);
      sample.setInt32(0, 0);
      sample.setInt32(0, 42);
      expect(sample.getInt32(0)).assertEqual(42);
      sample.setInt32(1, 0);
      sample.setInt32(1, 42);
      expect(sample.getInt32(1)).assertEqual(42);
      sample.setInt32(2, 0);
      sample.setInt32(2, 42);
      expect(sample.getInt32(2)).assertEqual(42);
      sample.setInt32(2, 42.2);
      expect(sample.getInt32(2)).assertEqual(42);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0111
     * @tc.name ESDataViewTest0111
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0111';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg: string): void =>{
        let threw = false;
        try {
          sample.setInt8(offset, 39);
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(4);
      let typedArray = new Uint8Array(buffer, 0);
      let sample = new DataView(buffer, 0);
      expectError(sample, 5, "5 + 1 > 4");
      expectError(sample, 4, "4 + 1 > 4");
      sample = new DataView(buffer, 3);
      expectError(sample, 1, "1 + 1 > 1 (offset)");
      sample = new DataView(buffer, 0, 1);
      expectError(sample, 1, "1 + 1 > 1 (length)");
      sample = new DataView(buffer, 2, 1);
      expectError(sample, 1, "1 + 1 > 1 (offset+length)");
      sample = new DataView(buffer, 0);
      expect(sample.getInt8(0)).assertEqual(0);
      expect(sample.getInt8(1)).assertEqual(0);
      expect(sample.getInt8(2)).assertEqual(0);
      expect(sample.getInt8(3)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0112
     * @tc.name ESDataViewTest0112
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0112';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.setInt8(-1, 39);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      expect(sample.getInt8(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0113
     * @tc.name ESDataViewTest0113
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0113';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setInt8(0, 0);
      sample.setInt8(-0, 42);
      expect(sample.getInt8(0)).assertEqual(42);
      sample.setInt8(0, 0);
      sample.setInt8(0, 42);
      expect(sample.getInt8(0)).assertEqual(42);
      sample.setInt8(1, 0);
      sample.setInt8(1, 42);
      expect(sample.getInt8(1)).assertEqual(42);
      sample.setInt8(2, 0);
      sample.setInt8(2, 42);
      expect(sample.getInt8(2)).assertEqual(42);
      sample.setInt8(2, 42.2);
      expect(sample.getInt8(2)).assertEqual(42);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0114
     * @tc.name ESDataViewTest0114
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0114';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg: string): void =>{
        let threw = false;
        try {
          sample.setUint16(offset, 39)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13, "13 + 2 > 12");
      expectError(sample, 11, "11 + 2 > 12");
      sample = new DataView(buffer, 10);
      expectError(sample, 1, "1 + 2 > 2 (offset)");
      sample = new DataView(buffer, 11);
      expectError(sample, 0, "0 + 2 > 1 (offset)");
      sample = new DataView(buffer, 0, 2);
      expectError(sample, 1, "1 + 2 > 2 (length)");
      sample = new DataView(buffer, 0, 1);
      expectError(sample, 0, "0 + 2 > 1 (length)");
      sample = new DataView(buffer, 4, 2);
      expectError(sample, 1, "1 + 2 > 2 (offset+length)");
      sample = new DataView(buffer, 4, 1);
      expectError(sample, 0, "0 + 2 > 1 (offset+length)");
      sample = new DataView(buffer, 0);
      expect(sample.getUint16(0)).assertEqual(0);
      expect(sample.getUint16(2)).assertEqual(0);
      expect(sample.getUint16(4)).assertEqual(0);
      expect(sample.getUint16(6)).assertEqual(0);
      expect(sample.getUint16(8)).assertEqual(0);
      expect(sample.getUint16(10)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0115
     * @tc.name ESDataViewTest0115
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0115';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.setUint16(-1, 39);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      expect(sample.getUint16(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0116
     * @tc.name ESDataViewTest0116
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0116';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint16(0, -1870724872, true);
      expect(sample.getUint16(0)).assertEqual(63488);
      sample.setUint16(0, -134185072, true);
      expect(sample.getUint16(0)).assertEqual(36991);
      sample.setUint16(0, 1870724872, true);
      expect(sample.getUint16(0)).assertEqual(2303);
      sample.setUint16(0, 150962287, true);
      expect(sample.getUint16(0)).assertEqual(28544);
      sample.setUint16(0, 4160782224, true);
      expect(sample.getUint16(0)).assertEqual(36991);
      sample.setUint16(0, 2424242424, true);
      expect(sample.getUint16(0)).assertEqual(63488);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0117
     * @tc.name ESDataViewTest0117
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0117';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint16(0, 1);
      expect(sample.getUint16(0)).assertEqual(1);
      sample.setUint16(0, 2, undefined);
      expect(sample.getUint16(0)).assertEqual(2);
      sample.setUint16(0, 3, false);
      expect(sample.getUint16(0)).assertEqual(3);
      sample.setUint16(0, 1536, true);
      expect(sample.getUint16(0)).assertEqual(6);
      sample.setUint16(0, 1792, true);
      expect(sample.getUint16(0)).assertEqual(7);
      sample.setUint16(0, 2048, true);
      expect(sample.getUint16(0)).assertEqual(8);
      sample.setUint16(0, 2304, true);
      expect(sample.getUint16(0)).assertEqual(9);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0118
     * @tc.name ESDataViewTest0118
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0118';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint16(0, 0);
      sample.setUint16(-0, 42);
      expect(sample.getUint16(0)).assertEqual(42);
      sample.setUint16(0, 0);
      sample.setUint16(0, 42);
      expect(sample.getUint16(0)).assertEqual(42);
      sample.setUint16(1, 0);
      sample.setUint16(1, 42);
      expect(sample.getUint16(1)).assertEqual(42);
      sample.setUint16(2, 0);
      sample.setUint16(2, 42);
      expect(sample.getUint16(2)).assertEqual(42);
      sample.setUint16(2, 42.2);
      expect(sample.getUint16(2)).assertEqual(42);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0119
     * @tc.name ESDataViewTest0119
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0119';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      let expectError = (sample: DataView, offset: int, msg: string): void =>{
        let threw = false;
        try {
          sample.setUint32(offset, 39);
          expect(false).assertEqual(true);
        } catch (err){
          if (err instanceof RangeError) threw = true;
          expect(threw).assertEqual(true);
        }
      }

      expectError(sample, 13, "13 + 4 > 12");
      expectError(sample, 12, "12 + 4 > 12");
      expectError(sample, 11, "11 + 4 > 12");
      expectError(sample, 10, "10 + 4 > 12");
      expectError(sample, 9, "9 + 4 > 12");
      sample = new DataView(buffer, 8);
      expectError(sample, 1, "1 + 4 > 4 (offset)");
      sample = new DataView(buffer, 9);
      expectError(sample, 0, "0 + 4 > 3 (offset)");
      sample = new DataView(buffer, 0, 4);
      expectError(sample, 1, "1 + 4 > 4 (length)");
      sample = new DataView(buffer, 0, 3);
      expectError(sample, 0, "0 + 4 > 3 (length)");
      sample = new DataView(buffer, 4, 4);
      expectError(sample, 1, "1 + 4 > 4 (offset+length)");
      sample = new DataView(buffer, 4, 3);
      expectError(sample, 0, "0 + 4 > 3 (offset+length)");
      sample = new DataView(buffer, 0);
      expect(sample.getUint32(0)).assertEqual(0);
      expect(sample.getUint32(4)).assertEqual(0);
      expect(sample.getUint32(8)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0120
     * @tc.name ESDataViewTest0120
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0120';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.setUint32(-1, 39);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      expect(sample.getUint32(0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0121
     * @tc.name ESDataViewTest0121
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0121';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint32(0, -1870724872, true);
      expect(sample.getUint32(0)).assertEqual(4160782224);
      sample.setUint32(0, -134185072, true);
      expect(sample.getUint32(0)).assertEqual(2424242424);
      sample.setUint32(0, 1870724872, true);
      expect(sample.getUint32(0)).assertEqual(150962287);
      sample.setUint32(0, 150962287, true);
      expect(sample.getUint32(0)).assertEqual(1870724872);
      sample.setUint32(0, 4160782224, true);
      expect(sample.getUint32(0)).assertEqual(2424242424);
      sample.setUint32(0, 2424242424, true);
      expect(sample.getUint32(0)).assertEqual(4160782224);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0122
     * @tc.name ESDataViewTest0122
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0122';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint32(0, 1);
      expect(sample.getUint32(0)).assertEqual(1);
      sample.setUint32(0, 2, undefined);
      expect(sample.getUint32(0)).assertEqual(2);
      sample.setUint32(0, 3, false);
      expect(sample.getUint32(0)).assertEqual(3);
      sample.setUint32(0, 6, true);
      expect(sample.getUint32(0)).assertEqual(100663296);
      sample.setUint32(0, 7, true);
      expect(sample.getUint32(0)).assertEqual(117440512);
      sample.setUint32(0, 8, true);
      expect(sample.getUint32(0)).assertEqual(134217728);
      sample.setUint32(0, 9, true);
      expect(sample.getUint32(0)).assertEqual(150994944);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0123
     * @tc.name ESDataViewTest0123
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0123';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint32(0, 0);
      sample.setUint32(-0, 42);
      expect(sample.getUint32(0)).assertEqual(42);
      sample.setUint32(0, 0);
      sample.setUint32(0, 42);
      expect(sample.getUint32(0)).assertEqual(42);
      sample.setUint32(1, 0);
      sample.setUint32(1, 42);
      expect(sample.getUint32(1)).assertEqual(42);
      sample.setUint32(2, 0);
      sample.setUint32(2, 42);
      expect(sample.getUint32(2)).assertEqual(42);
      sample.setUint32(2, 42.2);
      expect(sample.getUint32(2)).assertEqual(42);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0124
     * @tc.name ESDataViewTest0124
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0124';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg: string): void =>{
        let threw = false;
        try {
          sample.setUint8(offset, 39);
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(4);
      let typedArray = new Uint8Array(buffer, 0);
      let sample = new DataView(buffer, 0);
      expectError(sample, 5, "5 + 1 > 4");
      expectError(sample, 4, "4 + 1 > 4");
      sample = new DataView(buffer, 3);
      expectError(sample, 1, "1 + 1 > 1 (offset)");
      sample = new DataView(buffer, 0, 1);
      expectError(sample, 1, "1 + 1 > 1 (length)");
      sample = new DataView(buffer, 2, 1);
      expectError(sample, 1, "1 + 1 > 1 (offset+length)");
      expect(typedArray[0]).assertEqual(0);
      expect(typedArray[1]).assertEqual(0);
      expect(typedArray[2]).assertEqual(0);
      expect(typedArray[3]).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0125
     * @tc.name ESDataViewTest0125
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0125';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(2);
      let sample = new DataView(buffer, 0);
      let typedArray = new Uint8Array(buffer, 0);
      try {
        sample.setUint8(-1, 39);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      expect(typedArray[0]).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0126
     * @tc.name ESDataViewTest0126
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0126';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      let typedArray = new Uint8Array(buffer, 0);
      sample.setUint8(0, 0);
      sample.setUint8(-0, 42);
      expect(typedArray[0]).assertEqual(42);
      sample.setUint8(0, 0);
      sample.setUint8(0, 42);
      expect(typedArray[0]).assertEqual(42);
      sample.setUint8(1, 0);
      sample.setUint8(1, 42);
      expect(typedArray[1]).assertEqual(42);
      sample.setUint8(2, 0);
      sample.setUint8(2, 42);
      expect(typedArray[2]).assertEqual(42);
      sample.setUint8(2, 42.2);
      expect(typedArray[2]).assertEqual(42);
      console.info(`${caseName}, test end`);
    });

  })
}
