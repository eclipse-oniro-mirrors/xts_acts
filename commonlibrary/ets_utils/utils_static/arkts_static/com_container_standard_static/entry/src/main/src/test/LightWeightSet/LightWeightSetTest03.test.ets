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

interface IEmptyObj {}
interface IABCObj { a: number; b: string; c: Array<number>; }
interface IKeyValueObj { key: string; a: number; }
interface IBObj { b: number; }
interface IABFuncObj { a: number; b: () => void; }
interface ICObj { c: number; }
interface IBufferObj { buffer: ArrayBuffer; }
interface IViewObj { view: DataView; }
interface IUint8BufferObj { buffer: Uint8Array; }
interface IMapObj { map: Map<number, number>; }
interface ISetObj { setValue: Set<number>; }
interface IABObj { a: number; b: number; }
interface IABUndefObj { a: number | undefined; b: number; }
interface IABNullObj { a: number | null; b: number; }

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function testLightWeightSetTest03(): void {
  describe('testLightWeightSetTest03', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_0100
     * @tc.name      testLightWeightSetTest03Chapter0001
     * @tc.desc      Verify LightWeightSet's remove method with special array object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0001';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const emptyArr0001: IEmptyObj = {};
      lightWeightSet.add(emptyArr0001);
      const emptyObj0001: IEmptyObj = {};
      lightWeightSet.add(emptyObj0001);
      let remove_data = lightWeightSet.remove(emptyArr0001);
      let result: boolean = remove_data !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_0200
     * @tc.name      testLightWeightSetTest03Chapter0002
     * @tc.desc      Verify LightWeightSet's remove method with array with mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0002';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number | string | boolean | null | undefined>>();
      lightWeightSet.add([72, "abc", true, null, undefined, 108]);
      lightWeightSet.add([]);
      let remove_data = lightWeightSet.remove([]);
      let result:boolean = remove_data === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_0300
     * @tc.name      testLightWeightSetTest03Chapter0003
     * @tc.desc      Verify LightWeightSet's remove method with normal object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0003';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj0003a: IABCObj = { a: 1, b: "test", c: [1.0, 2.0, 3.0] };
      const obj0003b: IABCObj = { a: 10, b: "key", c: [20.0, 4.0] };
      lightWeightSet.add(obj0003a);
      lightWeightSet.add(obj0003b);
      let remove_data = lightWeightSet.remove(obj0003a);
      let result:boolean = remove_data !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_0400
     * @tc.name      testLightWeightSetTest03Chapter0004
     * @tc.desc      Verify LightWeightSet's remove method with object with Symbol key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0004';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const kvObj0004: IKeyValueObj = { key: "value", a: 1 };
      const bObj0004: IBObj = { b: 2 };
      lightWeightSet.add(kvObj0004);
      lightWeightSet.add(bObj0004);
      let remove_data = lightWeightSet.remove(bObj0004);
      let result:boolean = remove_data !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_0500
     * @tc.name      testLightWeightSetTest03Chapter0005
     * @tc.desc      Verify LightWeightSet's remove method with object with function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0005';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const funcObj0005: IABFuncObj = { a: 1, b: () => { } };
      const cObj0005: ICObj = { c: 3 };
      lightWeightSet.add(funcObj0005);
      lightWeightSet.add(cObj0005);
      let remove_data = lightWeightSet.remove(cObj0005);
      let result:boolean = remove_data !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_0600
     * @tc.name      testLightWeightSetTest03Chapter0006
     * @tc.desc      Verify LightWeightSet's remove method with object with ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0006';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const bufObj0006: IBufferObj = { buffer: new ArrayBuffer(16) };
      const viewObj0006: IViewObj = { view: new DataView(new ArrayBuffer(16)) };
      lightWeightSet.add(bufObj0006);
      lightWeightSet.add(viewObj0006);
      let remove_data = lightWeightSet.remove(viewObj0006);
      let result:boolean = remove_data !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_0700
     * @tc.name      testLightWeightSetTest03Chapter0007
     * @tc.desc      Verify LightWeightSet's remove method with object with TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0007';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const uint8Obj0007: IUint8BufferObj = { buffer: new Uint8Array([72, 101, 108, 108, 111]) };
      const emptyObj0007: IEmptyObj = {};
      lightWeightSet.add(uint8Obj0007);
      lightWeightSet.add(emptyObj0007);
      let remove_data = lightWeightSet.remove(emptyObj0007);
      let result:boolean = remove_data !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_0800
     * @tc.name      testLightWeightSetTest03Chapter0008
     * @tc.desc      Verify LightWeightSet's remove method with object with Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0008';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const mapObj0008: IMapObj = { map: new Map<number, number>() };
      const setObj0008: ISetObj = { setValue: new Set<number>([1, 2, 3, 2, 1]) };
      lightWeightSet.add(mapObj0008);
      lightWeightSet.add(setObj0008);
      let remove_data = lightWeightSet.remove(setObj0008);
      let result:boolean = remove_data !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_0900
     * @tc.name      testLightWeightSetTest03Chapter0009
     * @tc.desc      Verify LightWeightSet's remove method with object with undefined property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0009';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const undefObj0009: IABUndefObj = { a: undefined, b: 1 };
      const nullObj0009: IABNullObj = { a: null, b: 1 };
      lightWeightSet.add(undefObj0009);
      lightWeightSet.add(nullObj0009);
      let remove_data = lightWeightSet.remove(nullObj0009);
      let result:boolean = remove_data !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_1000
     * @tc.name      testLightWeightSetTest03Chapter0010
     * @tc.desc      Verify LightWeightSet's remove method with object with NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0010';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const nanObj0010: IABObj = { a: NaN, b: 1 };
      const infObj0010: IABObj = { a: Infinity, b: 1 };
      lightWeightSet.add(nanObj0010);
      lightWeightSet.add(infObj0010);
      let remove_data = lightWeightSet.remove(infObj0010);
      let result:boolean = remove_data !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_1100
     * @tc.name      testLightWeightSetTest03Chapter0011
     * @tc.desc      Verify LightWeightSet's remove method with class instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0011';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      lightWeightSet.add(new testLightWeightSet("wang", 25, new Int8Array([20, 10])));
      lightWeightSet.add(new testLightWeightSet("xie", 19, new Int8Array([80, 90])));
      let remove_data = lightWeightSet.remove(new testLightWeightSet("wang", 25, new Int8Array([20, 10])));
      let result:boolean = remove_data !== undefined;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_1200
     * @tc.name      testLightWeightSetTest03Chapter0012
     * @tc.desc      Verify LightWeightSet's clear method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0012';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.clear();
      let result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_1300
     * @tc.name      testLightWeightSetTest03Chapter0013
     * @tc.desc      Verify LightWeightSet's clear method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0013';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(12);
      lightWeightSet.add(88);
      lightWeightSet.clear();
      let result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_1400
     * @tc.name      testLightWeightSetTest03Chapter0014
     * @tc.desc      Verify LightWeightSet's clear method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0014';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      lightWeightSet.add(new Int8Array([20,10]));
      lightWeightSet.add(new Int8Array([30,80]));
      lightWeightSet.clear();
      let result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_1500
     * @tc.name      testLightWeightSetTest03Chapter0015
     * @tc.desc      Verify LightWeightSet's clear method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0015';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const nanObj0015: IABObj = { a: NaN, b: 1 };
      const infObj0015: IABObj = { a: Infinity, b: 1 };
      lightWeightSet.add(nanObj0015);
      lightWeightSet.add(infObj0015);
      lightWeightSet.clear();
      let result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_1600
     * @tc.name      testLightWeightSetTest03Chapter0016
     * @tc.desc      Verify LightWeightSet's clear method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0016';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      lightWeightSet.add(new testLightWeightSet("wang", 25, new Int8Array([20, 10])));
      lightWeightSet.add(new testLightWeightSet("xie", 19, new Int8Array([80, 90])));
      lightWeightSet.clear();
      let result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_1700
     * @tc.name      testLightWeightSetTest03Chapter0017
     * @tc.desc      Verify LightWeightSet's remove method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0017';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(-1);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_1800
     * @tc.name      testLightWeightSetTest03Chapter0018
     * @tc.desc      Verify LightWeightSet's removeAt method with index 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0018';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_1900
     * @tc.name      testLightWeightSetTest03Chapter0019
     * @tc.desc      Verify LightWeightSet's removeAt method with index 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0019';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_2000
     * @tc.name      testLightWeightSetTest03Chapter0020
     * @tc.desc      Verify LightWeightSet's removeAt method with index 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0020';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(2);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_2100
     * @tc.name      testLightWeightSetTest03Chapter0021
     * @tc.desc      Verify LightWeightSet's removeAt method with undefined index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0021';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0);
      expect(result !== undefined).assertTrue();
      expect(lightWeightSet.length).assertEqual(2);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_2200
     * @tc.name      testLightWeightSetTest03Chapter0022
     * @tc.desc      Verify LightWeightSet's removeAt method with NaN index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0022';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0);
      expect(result !== undefined).assertTrue();
      expect(lightWeightSet.length).assertEqual(2);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_2300
     * @tc.name      testLightWeightSetTest03Chapter0023
     * @tc.desc      Verify LightWeightSet's removeAt method with -0 index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0023';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_2400
     * @tc.name      testLightWeightSetTest03Chapter0024
     * @tc.desc      Verify LightWeightSet's removeAt method with Infinity index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0024';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(2147483647);
      expect(result).assertFalse();
      expect(lightWeightSet.length).assertEqual(3);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_4300
     * @tc.name      testLightWeightSetTest03Chapter0043
     * @tc.desc      Verify LightWeightSet's removeAt method with index 9223372036854775807
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0043';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(2147483647);
      expect(result).assertFalse();
      expect(lightWeightSet.length).assertEqual(3);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_4400
     * @tc.name      testLightWeightSetTest03Chapter0044
     * @tc.desc      Verify LightWeightSet's removeAt method with index 1.5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0044';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val0 = lightWeightSet.getValueAt(0);
      let val1 = lightWeightSet.getValueAt(1);
      let val2 = lightWeightSet.getValueAt(2);
      let result: boolean = val0 !== undefined && val1 !== undefined && val2 !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_4500
     * @tc.name      testLightWeightSetTest03Chapter0045
     * @tc.desc      Verify LightWeightSet's removeAt method with index 2.999
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0045';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(2);
      expect(result !== undefined).assertTrue();
      expect(lightWeightSet.length).assertEqual(2);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_4600
     * @tc.name      testLightWeightSetTest03Chapter0046
     * @tc.desc      Verify LightWeightSet's removeAt method with index 123.456
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0046';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      lightWeightSet.removeAt(123);
      expect(lightWeightSet.length).assertEqual(3);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_4700
     * @tc.name      testLightWeightSetTest03Chapter0047
     * @tc.desc      Verify LightWeightSet's removeAt method with index 0xcafebabe
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0047';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(2147483647);
      expect(result).assertFalse();
      expect(lightWeightSet.length).assertEqual(3);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_4800
     * @tc.name      testLightWeightSetTest03Chapter0048
     * @tc.desc      Verify LightWeightSet's removeAt method with index 0x0102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0048';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0x0102);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_4900
     * @tc.name      testLightWeightSetTest03Chapter0049
     * @tc.desc      Verify LightWeightSet's removeAt method with index 0x01020304
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0049';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0x01020304);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_5000
     * @tc.name      testLightWeightSetTest03Chapter0050
     * @tc.desc      Verify LightWeightSet's removeAt method with index 0x3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0050';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0x3);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_5100
     * @tc.name      testLightWeightSetTest03Chapter0051
     * @tc.desc      Verify LightWeightSet's removeAt method with index 2 ** 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0051';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(8);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_5200
     * @tc.name      testLightWeightSetTest03Chapter0052
     * @tc.desc      Verify LightWeightSet's removeAt method with index 1e3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0052';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(1000);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_5300
     * @tc.name      testLightWeightSetTest03Chapter0053
     * @tc.desc      Verify LightWeightSet's removeAt method with index 2.5e-2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0053';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0);
      expect(result !== undefined).assertTrue();
      expect(lightWeightSet.length).assertEqual(2);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_5400
     * @tc.name      testLightWeightSetTest03Chapter0054
     * @tc.desc      Verify LightWeightSet's removeAt method with index BigInt(0xdecafafecacefade)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0054';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(2147483647);
      expect(result).assertFalse();
      expect(lightWeightSet.length).assertEqual(3);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_5500
     * @tc.name      testLightWeightSetTest03Chapter0055
     * @tc.desc      Verify LightWeightSet's removeAt method with index BigInt(9007199254740991)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0055';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(2147483647);
      expect(result).assertFalse();
      expect(lightWeightSet.length).assertEqual(3);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_5600
     * @tc.name      testLightWeightSetTest03Chapter0056
     * @tc.desc      Verify LightWeightSet's removeAt method with index 65535
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0056';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(65535);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_5700
     * @tc.name      testLightWeightSetTest03Chapter0057
     * @tc.desc      Verify LightWeightSet's removeAt method with index Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0057';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(2147483647);
      expect(result).assertFalse();
      expect(lightWeightSet.length).assertEqual(3);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_5800
     * @tc.name      testLightWeightSetTest03Chapter0058
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0058';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");

      let get_value = lightWeightSet.getValueAt(-1);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_5900
     * @tc.name      testLightWeightSetTest03Chapter0059
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0059';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(2);
      let result: boolean = get_value === "squirrel";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_6000
     * @tc.name      testLightWeightSetTest03Chapter0060
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0060';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(1);
      let result: boolean = get_value === "sparrow";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_6100
     * @tc.name      testLightWeightSetTest03Chapter0061
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0061';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(0);
      console.log(get_value);
      let result: boolean = get_value === "gull";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_6200
     * @tc.name      testLightWeightSetTest03Chapter0062
     * @tc.desc      Verify LightWeightSet's getValueAt method with undefined index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0062';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val = lightWeightSet.getValueAt(-1 as int);
      let result: boolean = val === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_6300
     * @tc.name      testLightWeightSetTest03Chapter0063
     * @tc.desc      Verify LightWeightSet's getValueAt method with NaN index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0063';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val = lightWeightSet.getValueAt(0);
      let result: boolean = val !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_6400
     * @tc.name      testLightWeightSetTest03Chapter0064
     * @tc.desc      Verify LightWeightSet's getValueAt method with -0 index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0064';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(0);
      let result: boolean = get_value === "squirrel";
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_6500
     * @tc.name      testLightWeightSetTest03Chapter0065
     * @tc.desc      Verify LightWeightSet's getValueAt method with Infinity index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0065';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val0 = lightWeightSet.getValueAt(0);
      let val1 = lightWeightSet.getValueAt(1);
      let val2 = lightWeightSet.getValueAt(2);
      let result: boolean = val0 !== undefined && val1 !== undefined && val2 !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_6600
     * @tc.name      testLightWeightSetTest03Chapter0066
     * @tc.desc      Verify LightWeightSet's getValueAt method with -Infinity index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0066';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val0 = lightWeightSet.getValueAt(0);
      let val1 = lightWeightSet.getValueAt(1);
      let val2 = lightWeightSet.getValueAt(2);
      let result: boolean = val0 !== undefined && val1 !== undefined && val2 !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_6700
     * @tc.name      testLightWeightSetTest03Chapter0067
     * @tc.desc      Verify LightWeightSet's getValueAt method with Number.MAX_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0067';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val0 = lightWeightSet.getValueAt(0);
      let val1 = lightWeightSet.getValueAt(1);
      let val2 = lightWeightSet.getValueAt(2);
      let result: boolean = val0 !== undefined && val1 !== undefined && val2 !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_6800
     * @tc.name      testLightWeightSetTest03Chapter0068
     * @tc.desc      Verify LightWeightSet's getValueAt method with Number.MIN_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0068';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val = lightWeightSet.getValueAt(0);
      let result: boolean = val !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_6900
     * @tc.name      testLightWeightSetTest03Chapter0069
     * @tc.desc      Verify LightWeightSet's getValueAt method with Number.EPSILON index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0069';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val = lightWeightSet.getValueAt(0);
      let result: boolean = val !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_7000
     * @tc.name      testLightWeightSetTest03Chapter0070
     * @tc.desc      Verify LightWeightSet's getValueAt method with Math.floor(1.5) index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0070';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(1);
      let result: boolean = get_value === "sparrow";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_7100
     * @tc.name      testLightWeightSetTest03Chapter0071
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0071';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(127);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_7200
     * @tc.name      testLightWeightSetTest03Chapter0072
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0072';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(128);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_7300
     * @tc.name      testLightWeightSetTest03Chapter0073
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0073';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(-128);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_7400
     * @tc.name      testLightWeightSetTest03Chapter0074
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -129
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0074';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(-129);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_7500
     * @tc.name      testLightWeightSetTest03Chapter0075
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0075';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(-32768);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_7600
     * @tc.name      testLightWeightSetTest03Chapter0076
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -32769
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0076';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(-32769);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_7700
     * @tc.name      testLightWeightSetTest03Chapter0077
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 32767
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0077';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(32767);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_7800
     * @tc.name      testLightWeightSetTest03Chapter0078
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0078';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(32768);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_7900
     * @tc.name      testLightWeightSetTest03Chapter0079
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0079';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(-2147483648);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_8000
     * @tc.name      testLightWeightSetTest03Chapter0080
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -2147483649
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0080';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val0 = lightWeightSet.getValueAt(0);
      let val1 = lightWeightSet.getValueAt(1);
      let val2 = lightWeightSet.getValueAt(2);
      let result: boolean = val0 !== undefined && val1 !== undefined && val2 !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_8100
     * @tc.name      testLightWeightSetTest03Chapter0081
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 2147483647
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0081';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(2147483647);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_8200
     * @tc.name      testLightWeightSetTest03Chapter0082
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0082';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val0 = lightWeightSet.getValueAt(0);
      let val1 = lightWeightSet.getValueAt(1);
      let val2 = lightWeightSet.getValueAt(2);
      let result: boolean = val0 !== undefined && val1 !== undefined && val2 !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_8300
     * @tc.name      testLightWeightSetTest03Chapter0083
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -9223372036854775808
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0083';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val0 = lightWeightSet.getValueAt(0);
      let val1 = lightWeightSet.getValueAt(1);
      let val2 = lightWeightSet.getValueAt(2);
      let result: boolean = val0 !== undefined && val1 !== undefined && val2 !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTTHREE_8400
     * @tc.name      testLightWeightSetTest03Chapter0084
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 9223372036854775807
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0084';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let val0 = lightWeightSet.getValueAt(0);
      let val1 = lightWeightSet.getValueAt(1);
      let val2 = lightWeightSet.getValueAt(2);
      let result: boolean = val0 !== undefined && val1 !== undefined && val2 !== undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

  })
}
