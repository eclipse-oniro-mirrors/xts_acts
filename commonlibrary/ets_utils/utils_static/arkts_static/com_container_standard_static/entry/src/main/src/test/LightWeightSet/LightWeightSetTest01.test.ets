/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { LightWeightSet } from '@kit.ArkTS';

class testLightWeightSet{
  name:string = ' ';
  age:number = 0;
  grade:Int8Array = new Int8Array([80,95,87]);

  constructor(name:string,age:number,grade:Int8Array){
    this.name=name;
    this.age=age;
    this.grade=grade;
  }
}

interface ITestXYZ {
  x: number;
  y: string;
  z: Int8Array;
}

interface IObjABC {
  a: number;
  b: string;
  c: Array<number>;
}

interface IKeyValueObj {
  key: string;
  a: number;
}

interface IBObj {
  b: number;
}

interface ICObj {
  c: number;
}

interface IBufferObj {
  buffer: ArrayBuffer;
}

interface IViewObj {
  view: DataView;
}

interface IEmptyObj {}

interface IUint8BufferObj {
  buffer: Uint8Array;
}

interface IMapObj {
  map: Map<number, number>;
}

interface ISetObj {
  setValue: Set<number>;
}

interface IUndefinedBObj {
  a: number | undefined;
  b: number;
}

interface INullBObj {
  a: number | null;
  b: number;
}

interface INumberBObj {
  a: number;
  b: number;
}

interface IFuncObj {
  a: number;
  b: () => void;
}

interface IIndexedObj {
  abc: number;
  aaa: number;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function testLightWeightSetTest01(): void {
  describe('testLightWeightSetTest01', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_0100
     * @tc.name      testLightWeightSetTest01Chapter0001
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0001';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string | number>();
      expect(lightWeightSet.length).assertEqual(0);
      expect(lightWeightSet != null).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_0200
     * @tc.name      testLightWeightSetTest01Chapter0002
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0002';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      expect(lightWeightSet.length).assertEqual(0);
      expect(lightWeightSet != null).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_0300
     * @tc.name      testLightWeightSetTest01Chapter0003
     * @tc.desc      Verify that the newly created LightWeightSet is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0003';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number>();
      const result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_0400
     * @tc.name      testLightWeightSetTest01Chapter0004
     * @tc.desc      Verify that the newly created LightWeightSet is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0004';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number | number>();
      const result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_0500
     * @tc.name      testLightWeightSetTest01Chapter0005
     * @tc.desc      Verify that the newly created LightWeightSet is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0005';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number | string>();
      const result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_0600
     * @tc.name      testLightWeightSetTest01Chapter0006
     * @tc.desc      Verify that the newly created LightWeightSet is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0006';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number | string | number>();
      const result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_0700
     * @tc.name      testLightWeightSetTest01Chapter0007
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0007';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<Int8Array>();
      const result = lightWeightSet.add(new Int8Array([20]));
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_0800
     * @tc.name      testLightWeightSetTest01Chapter0008
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0008';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<Uint8Array>();
      const result = lightWeightSet.add(new Uint8Array([-1]));
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_0900
     * @tc.name      testLightWeightSetTest01Chapter0009
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0009';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<Float32Array>();
      const result = lightWeightSet.add(new Float32Array([-3.4028234663852886e38]));
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_1000
     * @tc.name      testLightWeightSetTest01Chapter0010
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0010';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<BigInt64Array>();
      const result = lightWeightSet.add(new BigInt64Array([-9223372036854775808n]));
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_1100
     * @tc.name      testLightWeightSetTest01Chapter0011
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0011';
      console.log(TAG + 'start');
      const test_value:Float32Array = new Float32Array([Infinity]);
      const lightWeightSet = new LightWeightSet<Float32Array>();
      const result = lightWeightSet.add(test_value);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_1200
     * @tc.name      testLightWeightSetTest01Chapter0012
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0012';
      console.log(TAG + 'start');
      const test_value:Float64Array = new Float64Array([NaN]);
      const lightWeightSet = new LightWeightSet<Float64Array>();
      const result = lightWeightSet.add(test_value);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_1300
     * @tc.name      testLightWeightSetTest01Chapter0013
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0013';
      console.log(TAG + 'start');
      const test_value:Int32Array = new Int32Array([0]);
      const lightWeightSet = new LightWeightSet<Int32Array>();
      const result = lightWeightSet.add(test_value);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_1400
     * @tc.name      testLightWeightSetTest01Chapter0014
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0014';
      console.log(TAG + 'start');
      const test_value:Uint8ClampedArray = new Uint8ClampedArray([Infinity]);
      const lightWeightSet = new LightWeightSet<Uint8ClampedArray>();
      const result = lightWeightSet.add(test_value);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_1500
     * @tc.name      testLightWeightSetTest01Chapter0015
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0015';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<BigInt64Array>();
      let result:boolean = false;
      try{
        const test_value:BigInt64Array = new BigInt64Array([BigInt(NaN)]);
        lightWeightSet.add(test_value);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_1600
     * @tc.name      testLightWeightSetTest01Chapter0016
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0016';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string | undefined>();
      const result = lightWeightSet.add(undefined);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_1700
     * @tc.name      testLightWeightSetTest01Chapter0017
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0017';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add(" ");
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_1800
     * @tc.name      testLightWeightSetTest01Chapter0018
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0018';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add('<=>');
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_1900
     * @tc.name      testLightWeightSetTest01Chapter0019
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0019';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add('\n\t');
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_2000
     * @tc.name      testLightWeightSetTest01Chapter0020
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0020';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add('👀');
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_2100
     * @tc.name      testLightWeightSetTest01Chapter0021
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0021';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add("{k1:value1,k2:value2}");
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_2200
     * @tc.name      testLightWeightSetTest01Chapter0022
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0022';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add("NaN");
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_2300
     * @tc.name      testLightWeightSetTest01Chapter0023
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0023';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number>();
      const result = lightWeightSet.add(Number.EPSILON);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_2400
     * @tc.name      testLightWeightSetTest01Chapter0024
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0024';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number>();
      const result = lightWeightSet.add(1e3);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_2500
     * @tc.name      testLightWeightSetTest01Chapter0025
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0025';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number>();
      const result = lightWeightSet.add(0x0102);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_2600
     * @tc.name      testLightWeightSetTest01Chapter0026
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0026';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number>();
      const result = lightWeightSet.add(Number(BigInt(9007199254740991n)));
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_2700
     * @tc.name      testLightWeightSetTest01Chapter0027
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0027';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<boolean>();
      const result = lightWeightSet.add(false);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_2800
     * @tc.name      testLightWeightSetTest01Chapter0028
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0028';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<boolean | null>();
      const result = lightWeightSet.add(null);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_2900
     * @tc.name      testLightWeightSetTest01Chapter0029
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0029';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<boolean>();
      const result = lightWeightSet.add(!'s');
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_3000
     * @tc.name      testLightWeightSetTest01Chapter0030
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0030';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<Int8Array>();
      const test_value:Int8Array = new Int8Array([20,-30,58,100]);
      const result = lightWeightSet.add(test_value);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_3100
     * @tc.name      testLightWeightSetTest01Chapter0031
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0031';
      console.log(TAG + 'start');
      const Test1: ITestXYZ = {x:1,y:"test",z:new Int8Array([20])};
      const lightWeightSet = new LightWeightSet<object>();
      const result = lightWeightSet.add(Test1);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_3200
     * @tc.name      testLightWeightSetTest01Chapter0032
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0032';
      console.log(TAG + 'start');
      const testA = new testLightWeightSet("li",20,new Int8Array([20,30,40]));
      const lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const result = lightWeightSet.add(testA);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_3300
     * @tc.name      testLightWeightSetTest01Chapter0033
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0033';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      let set = new LightWeightSet<string>();
      set.add("gull");
      lightWeightSet.addAll(set);
      let result = lightWeightSet.has("gull");
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_3400
     * @tc.name      testLightWeightSetTest01Chapter0034
     * @tc.desc      Verify LightWeightSet can store Int8Array with boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0034';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      const arr1 = new Int8Array([-128, 127]);
      lightWeightSet.add(arr1);

      let set = new LightWeightSet<Int8Array>();
      const arr2 = new Int8Array([-129, 128]);
      set.add(arr2);

      lightWeightSet.addAll(set);
      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_3500
     * @tc.name      testLightWeightSetTest01Chapter0035
     * @tc.desc      Verify LightWeightSet can store Uint8Array with boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0035';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8Array>();
      const arr1 = new Uint8Array([0, 255]);
      lightWeightSet.add(arr1);

      let set = new LightWeightSet<Uint8Array>();
      const arr2 = new Uint8Array([256]);
      set.add(arr2);

      lightWeightSet.addAll(set);
      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_3600
     * @tc.name      testLightWeightSetTest01Chapter0036
     * @tc.desc      Verify LightWeightSet can store special strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0036';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');

      let set = new LightWeightSet<string>();
      set.add("");
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_3700
     * @tc.name      testLightWeightSetTest01Chapter0037
     * @tc.desc      Verify LightWeightSet can store ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0037';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add('!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');

      let set = new LightWeightSet<string>();
      set.add("abc123");
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has('!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_3800
     * @tc.name      testLightWeightSetTest01Chapter0038
     * @tc.desc      Verify LightWeightSet can store emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0038';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("👆");
      lightWeightSet.add("👿");

      let set = new LightWeightSet<string>();
      set.add("👀");
      set.add("💯");
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has("💯");
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_3900
     * @tc.name      testLightWeightSetTest01Chapter0039
     * @tc.desc      Verify LightWeightSet can store number 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0039';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(0);

      let set = new LightWeightSet<number>();
      set.add(1);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(0);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_4000
     * @tc.name      testLightWeightSetTest01Chapter0040
     * @tc.desc      Verify LightWeightSet can store NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0040';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(42);

      let set = new LightWeightSet<number>();
      set.add(1);
      lightWeightSet.addAll(set);

      expect(lightWeightSet.length).assertEqual(2);
      let result = lightWeightSet.has(42);
      expect(result).assertTrue();
      let result2 = lightWeightSet.has(1);
      expect(result2).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_4100
     * @tc.name      testLightWeightSetTest01Chapter0041
     * @tc.desc      Verify LightWeightSet can store Infinity and -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0041';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Infinity);

      let set = new LightWeightSet<number>();
      set.add(-Infinity);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(Infinity);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_4200
     * @tc.name      testLightWeightSetTest01Chapter0042
     * @tc.desc      Verify LightWeightSet can store boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0042';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(true);

      let set = new LightWeightSet<boolean>();
      set.add(false);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(false);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_4300
     * @tc.name      testLightWeightSetTest01Chapter0043
     * @tc.desc      Verify LightWeightSet can store array with normal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0043';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1: Array<number> = [72.0, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      lightWeightSet.add(arr1);

      let set = new LightWeightSet<Array<number>>();
      const arr2: Array<number> = [72.0, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      set.add(arr2);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_4400
     * @tc.name      testLightWeightSetTest01Chapter0044
     * @tc.desc      Verify LightWeightSet can store array with negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0044';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1: Array<number> = [72.0, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      lightWeightSet.add(arr1);

      let set = new LightWeightSet<Array<number>>();
      set.add([1.0, 2, 3]);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_4500
     * @tc.name      testLightWeightSetTest01Chapter0045
     * @tc.desc      Verify LightWeightSet can store special array object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0045';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const arr: IIndexedObj = { abc: 111, aaa: 222 };
      lightWeightSet.add(arr);

      let set = new LightWeightSet<object>();
      const emptyObj1: IEmptyObj = {};
      set.add(emptyObj1);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(arr);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_4600
     * @tc.name      testLightWeightSetTest01Chapter0046
     * @tc.desc      Verify LightWeightSet can store array with mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0046';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number | string | boolean | null | undefined>>();
      const arr1: Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108];
      lightWeightSet.add(arr1);

      let set = new LightWeightSet<Array<number | string | boolean | null | undefined>>();
      const emptyArr1: Array<number | string | boolean | null | undefined> = [];
      set.add(emptyArr1);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_4700
     * @tc.name      testLightWeightSetTest01Chapter0047
     * @tc.desc      Verify LightWeightSet can store normal object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0047';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1: IObjABC = { a: 1, b: "test", c: [1, 2, 3] };
      lightWeightSet.add(obj1);

      let set = new LightWeightSet<object>();
      const obj2: IObjABC = { a: 10, b: "key", c: [20,4] };
      set.add(obj2);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(obj1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_4800
     * @tc.name      testLightWeightSetTest01Chapter0048
     * @tc.desc      Verify LightWeightSet can store object with Symbol key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0048';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const kvObj1: IKeyValueObj = { key: "value", a: 1 };
      lightWeightSet.add(kvObj1);

      let set = new LightWeightSet<object>();
      const bObj1: IBObj = { b: 2 };
      set.add(bObj1);
      lightWeightSet.addAll(set);

      const bObj2: IBObj = { b: 2 };
      let result = lightWeightSet.has(bObj2);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_4900
     * @tc.name      testLightWeightSetTest01Chapter0049
     * @tc.desc      Verify LightWeightSet can store object with function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0049';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const funcObj1: IFuncObj = { a: 1, b: () => { } };
      lightWeightSet.add(funcObj1);

      let set = new LightWeightSet<object>();
      const cObj1: ICObj = { c: 3 };
      set.add(cObj1);
      lightWeightSet.addAll(set);

      const cObj2: ICObj = { c: 3 };
      let result = lightWeightSet.has(cObj2);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_5000
     * @tc.name      testLightWeightSetTest01Chapter0050
     * @tc.desc      Verify LightWeightSet can store object with ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0050';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const bufObj1: IBufferObj = { buffer: new ArrayBuffer(16) };
      lightWeightSet.add(bufObj1);

      let set = new LightWeightSet<object>();
      const viewObj1: IViewObj = { view: new DataView(new ArrayBuffer(16)) };
      set.add(viewObj1);
      lightWeightSet.addAll(set);

      const viewObj2: IViewObj = { view: new DataView(new ArrayBuffer(16)) };
      let result = lightWeightSet.has(viewObj2);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_5100
     * @tc.name      testLightWeightSetTest01Chapter0051
     * @tc.desc      Verify LightWeightSet can store object with TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0051';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const u8Obj1: IUint8BufferObj = { buffer: new Uint8Array([72, 101, 108, 108, 111]) };
      lightWeightSet.add(u8Obj1);

      let set = new LightWeightSet<object>();
      const emptyObj2: IEmptyObj = {};
      set.add(emptyObj2);
      lightWeightSet.addAll(set);

      const emptyObj3: IEmptyObj = {};
      let result = lightWeightSet.has(emptyObj3);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_5200
     * @tc.name      testLightWeightSetTest01Chapter0052
     * @tc.desc      Verify LightWeightSet can store object with Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0052';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const mapObj1: IMapObj = { map: new Map<number,number>() };
      lightWeightSet.add(mapObj1);

      let set = new LightWeightSet<object>();
      const setObj1: ISetObj = { setValue: new Set<number>([1, 2, 3, 2, 1]) };
      set.add(setObj1);
      lightWeightSet.addAll(set);

      const setObj2: ISetObj = { setValue: new Set<number>([1, 2, 3, 2, 1]) };
      let result = lightWeightSet.has(setObj2);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_5300
     * @tc.name      testLightWeightSetTest01Chapter0053
     * @tc.desc      Verify LightWeightSet can store class instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0053';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const test = new testLightWeightSet("wang",25,new Int8Array([20,10]));
      lightWeightSet.add(test);

      let set = new LightWeightSet<testLightWeightSet>();
      const test1 = new testLightWeightSet("xie",19,new Int8Array([80,90]));
      set.add(test1);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(test1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_5400
     * @tc.name      testLightWeightSetTest01Chapter0054
     * @tc.desc      Verify LightWeightSet can store object with undefined property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0054';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const undefObj1: IUndefinedBObj = { a: undefined, b: 1 };
      lightWeightSet.add(undefObj1);

      let set = new LightWeightSet<object>();
      const nullObj1: INullBObj = { a: null, b: 1 };
      set.add(nullObj1);
      lightWeightSet.addAll(set);

      const nullObj2: INullBObj = { a: null, b: 1 };
      let result = lightWeightSet.has(nullObj2);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_5500
     * @tc.name      testLightWeightSetTest01Chapter0055
     * @tc.desc      Verify LightWeightSet can store object with NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0055';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const nanObj1: INumberBObj = { a: NaN, b: 1 };
      lightWeightSet.add(nanObj1);

      let set = new LightWeightSet<object>();
      const infObj1: INumberBObj = { a: Infinity, b: 1 };
      set.add(infObj1);
      lightWeightSet.addAll(set);

      const infObj2: INumberBObj = { a: Infinity, b: 1 };
      let result = lightWeightSet.has(infObj2);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_5600
     * @tc.name      testLightWeightSetTest01Chapter0056
     * @tc.desc      Verify LightWeightSet's hasAll method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0056';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");

      let set = new LightWeightSet<string>();
      set.add("sparrow");
      set.add("gull");

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_5700
     * @tc.name      testLightWeightSetTest01Chapter0057
     * @tc.desc      Verify LightWeightSet's hasAll method with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0057';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      const arr1 = new Int8Array([-128, 127]);
      const arr2 = new Int8Array([-129, 128]);
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let set = new LightWeightSet<Int8Array>();
      set.add(arr1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_5800
     * @tc.name      testLightWeightSetTest01Chapter0058
     * @tc.desc      Verify LightWeightSet's hasAll method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0058';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8Array>();
      const arr1 = new Uint8Array([0, 255]);
      const arr2 = new Uint8Array([256]);
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let set = new LightWeightSet<Uint8Array>();
      set.add(arr1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_5900
     * @tc.name      testLightWeightSetTest01Chapter0059
     * @tc.desc      Verify LightWeightSet's hasAll method with special strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0059';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      lightWeightSet.add("");

      let set = new LightWeightSet<string>();
      set.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_6000
     * @tc.name      testLightWeightSetTest01Chapter0060
     * @tc.desc      Verify LightWeightSet's hasAll method with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0060';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const asciiStr = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      lightWeightSet.add(asciiStr);
      lightWeightSet.add("abc123");

      let set = new LightWeightSet<string>();
      set.add(asciiStr);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_6100
     * @tc.name      testLightWeightSetTest01Chapter0061
     * @tc.desc      Verify LightWeightSet's hasAll method with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0061';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("👆");
      lightWeightSet.add("👿");
      lightWeightSet.add("👀");
      lightWeightSet.add("💯");

      let set = new LightWeightSet<string>();
      set.add("💯");
      set.add("👀");

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_6200
     * @tc.name      testLightWeightSetTest01Chapter0062
     * @tc.desc      Verify LightWeightSet's hasAll method with number 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0062';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number | undefined>();
      lightWeightSet.add(0);
      lightWeightSet.add(undefined);

      let set = new LightWeightSet<number | undefined>();
      set.add(0);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_6300
     * @tc.name      testLightWeightSetTest01Chapter0063
     * @tc.desc      Verify LightWeightSet's hasAll method with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0063';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);

      let set = new LightWeightSet<number>();
      set.add(2);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_6400
     * @tc.name      testLightWeightSetTest01Chapter0064
     * @tc.desc      Verify LightWeightSet's hasAll method with Infinity and -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0064';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Infinity);
      lightWeightSet.add(-Infinity);

      let set = new LightWeightSet<number>();
      set.add(Infinity);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_6500
     * @tc.name      testLightWeightSetTest01Chapter0065
     * @tc.desc      Verify LightWeightSet's hasAll method with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0065';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(true);
      lightWeightSet.add(false);

      let set = new LightWeightSet<boolean>();
      set.add(false);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_6600
     * @tc.name      testLightWeightSetTest01Chapter0066
     * @tc.desc      Verify LightWeightSet's hasAll method with array with normal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0066';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1 = [72.0, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const arr2 = [72.0, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let set = new LightWeightSet<Array<number>>();
      set.add(arr1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_6700
     * @tc.name      testLightWeightSetTest01Chapter0067
     * @tc.desc      Verify LightWeightSet's hasAll method with array with negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0067';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1 = [72.0, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      lightWeightSet.add(arr1);
      lightWeightSet.add([1.0, 2, 3]);

      let set = new LightWeightSet<Array<number>>();
      set.add(arr1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_6800
     * @tc.name      testLightWeightSetTest01Chapter0068
     * @tc.desc      Verify LightWeightSet's hasAll method with special array object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0068';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const arr: IIndexedObj = { abc: 111, aaa: 222 };
      lightWeightSet.add(arr);
      const emptyObj4: IEmptyObj = {};
      lightWeightSet.add(emptyObj4);

      let set = new LightWeightSet<object>();
      set.add(arr);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_6900
     * @tc.name      testLightWeightSetTest01Chapter0069
     * @tc.desc      Verify LightWeightSet's hasAll method with array with mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0069';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number | string | boolean | null | undefined>>();
      const arr1: Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108];
      lightWeightSet.add(arr1);
      const emptyArr2: Array<number | string | boolean | null | undefined> = [];
      lightWeightSet.add(emptyArr2);

      let set = new LightWeightSet<Array<number | string | boolean | null | undefined>>();
      set.add(arr1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_7000
     * @tc.name      testLightWeightSetTest01Chapter0070
     * @tc.desc      Verify LightWeightSet's hasAll method with normal object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0070';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1: IObjABC = { a: 1, b: "test", c: [1, 2, 3] };
      const obj2: IObjABC = { a: 10, b: "key", c: [20, 4] };
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);

      let set = new LightWeightSet<object>();
      set.add(obj1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_7100
     * @tc.name      testLightWeightSetTest01Chapter0071
     * @tc.desc      Verify LightWeightSet's hasAll method with object with Symbol key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0071';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const kvObj2: IKeyValueObj = { key: "value", a: 1 };
      lightWeightSet.add(kvObj2);
      const bObj3: IBObj = { b: 2 };
      lightWeightSet.add(bObj3);

      let set = new LightWeightSet<object>();
      const bObj4: IBObj = { b: 2 };
      set.add(bObj4);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_7200
     * @tc.name      testLightWeightSetTest01Chapter0072
     * @tc.desc      Verify LightWeightSet's hasAll method with object with function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0072';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const funcObj2: IFuncObj = { a: 1, b: () => { } };
      lightWeightSet.add(funcObj2);
      const cObj3: ICObj = { c: 3 };
      lightWeightSet.add(cObj3);

      let set = new LightWeightSet<object>();
      const cObj4: ICObj = { c: 3 };
      set.add(cObj4);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_7300
     * @tc.name      testLightWeightSetTest01Chapter0073
     * @tc.desc      Verify LightWeightSet's hasAll method with object with ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0073';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const bufObj2: IBufferObj = { buffer: new ArrayBuffer(16) };
      lightWeightSet.add(bufObj2);
      const viewObj3: IViewObj = { view: new DataView(new ArrayBuffer(16)) };
      lightWeightSet.add(viewObj3);

      let set = new LightWeightSet<object>();
      const viewObj4: IViewObj = { view: new DataView(new ArrayBuffer(16)) };
      set.add(viewObj4);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_7400
     * @tc.name      testLightWeightSetTest01Chapter0074
     * @tc.desc      Verify LightWeightSet's hasAll method with object with TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0074';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const u8Obj2: IUint8BufferObj = { buffer: new Uint8Array([72, 101, 108, 108, 111]) };
      lightWeightSet.add(u8Obj2);
      const emptyObj5: IEmptyObj = {};
      lightWeightSet.add(emptyObj5);

      let set = new LightWeightSet<object>();
      const emptyObj6: IEmptyObj = {};
      set.add(emptyObj6);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_7500
     * @tc.name      testLightWeightSetTest01Chapter0075
     * @tc.desc      Verify LightWeightSet's hasAll method with object with Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0075';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const mapObj2: IMapObj = { map: new Map<number, number>() };
      lightWeightSet.add(mapObj2);
      const setObj3: ISetObj = { setValue: new Set<number>([1, 2, 3, 2, 1]) };
      lightWeightSet.add(setObj3);

      let set = new LightWeightSet<object>();
      const setObj4: ISetObj = { setValue: new Set<number>([1, 2, 3, 2, 1]) };
      set.add(setObj4);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_7600
     * @tc.name      testLightWeightSetTest01Chapter0076
     * @tc.desc      Verify LightWeightSet's hasAll method with class instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0076';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const test = new testLightWeightSet("wang", 25, new Int8Array([20, 10]));
      const test1 = new testLightWeightSet("xie", 19, new Int8Array([80, 90]));
      lightWeightSet.add(test);
      lightWeightSet.add(test1);

      let set = new LightWeightSet<testLightWeightSet>();
      set.add(test1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_7700
     * @tc.name      testLightWeightSetTest01Chapter0077
     * @tc.desc      Verify LightWeightSet's hasAll method with object with undefined property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0077';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const undefObj2: IUndefinedBObj = { a: undefined, b: 1 };
      lightWeightSet.add(undefObj2);
      const nullObj3: INullBObj = { a: null, b: 1 };
      lightWeightSet.add(nullObj3);

      let set = new LightWeightSet<object>();
      const nullObj4: INullBObj = { a: null, b: 1 };
      set.add(nullObj4);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_7800
     * @tc.name      testLightWeightSetTest01Chapter0078
     * @tc.desc      Verify LightWeightSet's hasAll method with object with NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0078';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const nanObj2: INumberBObj = { a: NaN, b: 1 };
      lightWeightSet.add(nanObj2);
      const infObj3: INumberBObj = { a: Infinity, b: 1 };
      lightWeightSet.add(infObj3);

      let set = new LightWeightSet<object>();
      const infObj4: INumberBObj = { a: Infinity, b: 1 };
      set.add(infObj4);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_7900
     * @tc.name      testLightWeightSetTest01Chapter0079
     * @tc.desc      Verify LightWeightSet's has method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0079';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");

      let result = lightWeightSet.has("sparrow");
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_8000
     * @tc.name      testLightWeightSetTest01Chapter0080
     * @tc.desc      Verify LightWeightSet's has method with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0080';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      const arr1 = new Int8Array([-128, 127]);
      const arr2 = new Int8Array([-129, 128]);
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_8100
     * @tc.name      testLightWeightSetTest01Chapter0081
     * @tc.desc      Verify LightWeightSet's has method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0081';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8Array>();
      const arr1 = new Uint8Array([0, 255]);
      const arr2 = new Uint8Array([256]);
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_8200
     * @tc.name      testLightWeightSetTest01Chapter0082
     * @tc.desc      Verify LightWeightSet's has method with special strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0082';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      lightWeightSet.add("");

      let result = lightWeightSet.has('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_8300
     * @tc.name      testLightWeightSetTest01Chapter0083
     * @tc.desc      Verify LightWeightSet's has method with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0083';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const asciiStr = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      lightWeightSet.add(asciiStr);
      lightWeightSet.add("abc123");

      let result = lightWeightSet.has(asciiStr);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_8400
     * @tc.name      testLightWeightSetTest01Chapter0084
     * @tc.desc      Verify LightWeightSet's has method with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0084';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("👆");
      lightWeightSet.add("👿");
      lightWeightSet.add("👀");
      lightWeightSet.add("💯");

      let result = lightWeightSet.has("💯");
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTONE_8500
     * @tc.name      testLightWeightSetTest01Chapter0085
     * @tc.desc      Verify LightWeightSet's has method with number 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0085';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number | undefined>();
      lightWeightSet.add(0);
      lightWeightSet.add(undefined);

      let result = lightWeightSet.has(0);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });
  });
}
