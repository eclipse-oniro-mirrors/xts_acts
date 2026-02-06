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
class A_empty {
}
class A {
  valueOf = (): number => {
    return 0
  }
}
class B {
  toString1 = (): number => {
    return 0
  }
}
export default function EsArrayBufferTest(){
  describe('EsArrayBufferTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0001
     * @tc.name ESArrayBufferTest0001
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0001';
      console.info(`${caseName}, test start`);
      let view = new DataView(new ArrayBuffer(9));
      expect(view.getUint8(0)).assertEqual(0);
      expect(view.getUint8(1)).assertEqual(0);
      expect(view.getUint8(2)).assertEqual(0);
      expect(view.getUint8(3)).assertEqual(0);
      expect(view.getUint8(4)).assertEqual(0);
      expect(view.getUint8(5)).assertEqual(0);
      expect(view.getUint8(6)).assertEqual(0);
      expect(view.getUint8(7)).assertEqual(0);
      expect(view.getUint8(8)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0002
     * @tc.name ESArrayBufferTest0002
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0002';
      console.info(`${caseName}, test start`);
      let obj1: A = {
        valueOf: (): number => {
          return 42;
        }
      };
      let obj2: B = {
        toString1: (): number => {
          return 42;
        }
      };
      let buffer:ArrayBuffer;
      buffer = new ArrayBuffer(obj1.valueOf());
      expect(buffer.byteLength).assertEqual(42);
      buffer = new ArrayBuffer(obj2.toString1());
      expect(buffer.byteLength).assertEqual(42);
      buffer = new ArrayBuffer(NaN);
      expect(buffer.byteLength).assertEqual(0);
      buffer = new ArrayBuffer(0.1);
      expect(buffer.byteLength).assertEqual(0);
      buffer = new ArrayBuffer(0.9);
      expect(buffer.byteLength).assertEqual(0);
      buffer = new ArrayBuffer(1.1);
      expect(buffer.byteLength).assertEqual(1);
      buffer = new ArrayBuffer(1.9);
      expect(buffer.byteLength).assertEqual(1);
      buffer = new ArrayBuffer(-0.1);
      expect(buffer.byteLength).assertEqual(0);
      buffer = new ArrayBuffer(-0.99999);
      expect(buffer.byteLength).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0003
     * @tc.name ESArrayBufferTest0003
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0003';
      console.info(`${caseName}, test start`);
      let positiveZero = new ArrayBuffer(+0);
      expect(positiveZero.byteLength).assertEqual(0);
      let negativeZero = new ArrayBuffer(-0);
      expect(negativeZero.byteLength).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0004
     * @tc.name ESArrayBufferTest0004
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0004';
      console.info(`${caseName}, test start`);
      expect(ArrayBuffer.isView({} as A_empty)).assertEqual(false);
      expect(ArrayBuffer.isView([] as [])).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0005
     * @tc.name ESArrayBufferTest0005
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0005';
      console.info(`${caseName}, test start`);
      let sample = new ArrayBuffer(1);
      expect(ArrayBuffer.isView(sample)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0006
     * @tc.name ESArrayBufferTest0006
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0006';
      console.info(`${caseName}, test start`);
      let sample = new DataView(new ArrayBuffer(1), 0, 0).buffer;
      expect(ArrayBuffer.isView(sample)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0007
     * @tc.name ESArrayBufferTest0007
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0007';
      console.info(`${caseName}, test start`);
      let sample = new DataView(new ArrayBuffer(1), 0, 0);
      expect(ArrayBuffer.isView(sample)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0008
     * @tc.name ESArrayBufferTest0008
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0008';
      console.info(`${caseName}, test start`);
      expect(ArrayBuffer.isView(1)).assertEqual(false);
      expect(ArrayBuffer.isView("")).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0009
     * @tc.name ESArrayBufferTest0009
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0009';
      console.info(`${caseName}, test start`);
      let ab1 = new ArrayBuffer(0);
      expect(ab1.byteLength).assertEqual(0);
      let ab2 = new ArrayBuffer(42);
      expect(ab2.byteLength).assertEqual(42);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0010
     * @tc.name ESArrayBufferTest0010
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0010';
      console.info(`${caseName}, test start`);
      let arrayBuffer = new ArrayBuffer(8);
      let start = 6;
      let result = arrayBuffer.slice(start);
      expect(result.byteLength).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0011
     * @tc.name ESArrayBufferTest0011
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0011';
      console.info(`${caseName}, test start`);
      let arrayBuffer = new ArrayBuffer(8);
      let start = 6,
        end = undefined;
      let result = arrayBuffer.slice(start, end);
      expect(result.byteLength).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0012
     * @tc.name ESArrayBufferTest0012
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0012';
      console.info(`${caseName}, test start`);
      let arrayBuffer = new ArrayBuffer(8);
      let start1 = 1,
        end1 = 12;
      let result1 = arrayBuffer.slice(start1, end1);
      expect(result1.byteLength).assertEqual(7);
      let start2 = 2,
        end2 = 0x100000000;
      let result2 = arrayBuffer.slice(start2, end2);
      expect(result2.byteLength).assertEqual(6);
      let start3 = 3,
        end3 = +Infinity;
      let result3 = arrayBuffer.slice(start3, end3);
      expect(result3.byteLength).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0013
     * @tc.name ESArrayBufferTest0013
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0013';
      console.info(`${caseName}, test start`);
      let arrayBuffer = new ArrayBuffer(8);
      let start1 = 2,
        end1 = -4;
      let result1 = arrayBuffer.slice(start1, end1);
      expect(result1.byteLength).assertEqual(2);
      let start2 = 2,
        end2 = -10;
      let result2 = arrayBuffer.slice(start2, end2);
      expect(result2.byteLength).assertEqual(0);
      let start3 = 2,
        end3 = -Infinity;
      let result3 = arrayBuffer.slice(start3, end3);
      expect(result3.byteLength).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0014
     * @tc.name ESArrayBufferTest0014
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0014';
      console.info(`${caseName}, test start`);
      let arrayBuffer = new ArrayBuffer(8);
      let start1 = -5,
        end1 = 6;
      let result1 = arrayBuffer.slice(start1, end1);
      expect(result1.byteLength).assertEqual(3);
      let start2 = -12,
        end2 = 6;
      let result2 = arrayBuffer.slice(start2, end2);
      expect(result2.byteLength).assertEqual(6);
      let start3 = -Infinity,
        end3 = 6;
      let result3 = arrayBuffer.slice(start3, end3);
      expect(result3.byteLength).assertEqual(6);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0015
     * @tc.name ESArrayBufferTest0015
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0015';
      console.info(`${caseName}, test start`);
      let arrayBuffer = new ArrayBuffer(8);
      let log = "";
      let start: A = {
        valueOf: ():number => {
          log += "start-";
          return 0;
        }
      };
      let end: A = {
        valueOf: ():number => {
          log += "end";
          return 8;
        }
      };
      arrayBuffer.slice(start.valueOf(), end.valueOf());
      expect(log).assertEqual("start-end");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0016
     * @tc.name ESArrayBufferTest0016
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0016';
      console.info(`${caseName}, test start`);
      let arrayBuffer = new ArrayBuffer(8);
      let start = 5,
        end = 4;
      let result = arrayBuffer.slice(start, end);
      expect(result.byteLength).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0017
     * @tc.name ESArrayBufferTest0017
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0017';
      console.info(`${caseName}, test start`);
      let arrayBuffer = new ArrayBuffer(8);
      let start1 = 10,
        end1 = 8;
      let result1 = arrayBuffer.slice(start1, end1);
      expect(result1.byteLength).assertEqual(0);
      let start2 = 0x100000000,
        end2 = 7;
      let result2 = arrayBuffer.slice(start2, end2);
      expect(result2.byteLength).assertEqual(0);
      let start3 = +Infinity,
        end3 = 6;
      let result3 = arrayBuffer.slice(start3, end3);
      expect(result3.byteLength).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0018
     * @tc.name ESArrayBufferTest0018
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0018';
      console.info(`${caseName}, test start`);
      let arrayBuffer = new ArrayBuffer(8);
      let start1 = 0,
        end1 = 4.5;
      let result1 = arrayBuffer.slice(start1, end1);
      expect(result1.byteLength).assertEqual(4);
      let start2 = 0,
        end2 = NaN;
      let result2 = arrayBuffer.slice(start2, end2);
      expect(result2.byteLength).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAYBUFFER_0019
     * @tc.name ESArrayBufferTest0019
     * @tc.desc Test ES Builtins-Api in ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayBufferTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayBufferTest0019';
      console.info(`${caseName}, test start`);
      let arrayBuffer = new ArrayBuffer(8);
      let start1 = 4.5,
        end1 = 8;
      let result1 = arrayBuffer.slice(start1, end1);
      expect(result1.byteLength).assertEqual(4);
      let start2 = NaN,
        end2 = 8;
      let result2 = arrayBuffer.slice(start2, end2);
      expect(result2.byteLength).assertEqual(8);
      console.info(`${caseName}, test end`);
    });

  })
}