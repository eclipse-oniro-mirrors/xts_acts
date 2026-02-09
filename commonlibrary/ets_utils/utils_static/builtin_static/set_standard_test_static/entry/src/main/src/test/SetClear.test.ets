
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';


let tickCount = 0;

function processTick(set: Set<Double>) {
  tickCount++;
  if (tickCount === 2) {
    set.clear();
    return true;
  }
  return false;
}

function processSet(s: Set<int>) {
  s.clear();
}

function createClosure(set: Set<int>) {
  return () => {
    set.clear();
  };
}

async function clearSetAsync(s: Set<int>) {
  await Promise.resolve();
  s.clear();
}

interface BaseI{
  id: number;
}
interface Base1 extends BaseI{
  self: null | BaseI;
}

interface Base2{}

interface Base3{
  tagName: string,
  id: string
}

interface Base5{
  data: string
}

class MySet<T> extends Set<T> {
  constructor(iterable?: Iterable<T>){
    super(iterable);
  }
  get first() {
    return this.values().next().value;
  }
}

class LoggingSet<T> extends Set<T> {
  constructor(iterable?: Iterable<T>){
    super(iterable);
  }
  log: string[] = [];
  clear() {
    this.log = ['clear called'];
    super.clear();
  }
}

class ValidatedSet<T> extends Set<T> {
  constructor(iterable?: Iterable<T>){
    super(iterable);
  }
  clearAndReturnResult() {
    if (this.size > 0) {
      super.clear();
      return true;
    }
    return false;
  }
}

interface Base6{
  valueOf: ()=>int;
}

interface Base7{
  toString1: ()=>string
}

interface Base8{
  data: string
}
interface Base9{
  id: number
}
interface Base10{
  hasOwnProperty1: ()=>boolean;
}

interface Base11{
  self?: Base11;
}

interface Base12{
  data: string
}

interface Base13{
  name: string
}
class BaseClass1{

  get value() {
    try {
      throw new Error('Malicious code');
    } catch (e) {
      return undefined;
    }
  }
}

interface Base14{
  toString1: ()=>void;
}

export default function SetClearTest() {
  describe('SetClearTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_0100
     * @tc.name SetClearTest001
     * @tc.desc Clear non-empty Set with string elements, verify size becomes 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetClearTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<String>(['a', 'b', 'c']);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_0200
     * @tc.name SetClearTest002
     * @tc.desc Clear non-empty Set with number elements, verify elements are removed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetClearTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();
      expect(set.has(1)).assertEqual(false);
      expect(set.has(2)).assertEqual(false);
      expect(set.has(3)).assertEqual(false);
    });



    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_0400
     * @tc.name SetClearTest004
     * @tc.desc Clear Set with boolean elements, verify size and elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetClearTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<boolean>([true, false, true]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(true)).assertEqual(false);
      expect(set.has(false)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_0500
     * @tc.name SetClearTest005
     * @tc.desc Clear Set with null and undefined, verify removal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetClearTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<null |  undefined>([null, undefined, null]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(null)).assertEqual(false);
      expect(set.has(undefined)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_0600
     * @tc.name SetClearTest006
     * @tc.desc Clear Set with single element, verify size becomes 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetClearTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<String>(['only-element']);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has('only-element')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_0700
     * @tc.name SetClearTest007
     * @tc.desc Clear Set with NaN (special equality), verify removal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetClearTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>([NaN, 1, NaN]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(NaN)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_0800
     * @tc.name SetClearTest008
     * @tc.desc Clear Set with 0 and -0, verify removal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetClearTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([0, -0, 100]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(0)).assertEqual(false);
      expect(set.has(-0)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_1000
     * @tc.name SetClearTest010
     * @tc.desc Clear Set with BigInt elements, verify removal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetClearTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<BigInt>([100n, 200n, 100n]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(100n)).assertEqual(false);
      expect(set.has(200n)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_1100
     * @tc.name SetClearTest011
     * @tc.desc Call clear() on empty Set (no side effects)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetClearTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_1200
     * @tc.name SetClearTest012
     * @tc.desc Clear Set with large number of elements (1000 elements)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetClearTest012', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(1000);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(999)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_1300
     * @tc.name SetClearTest013
     * @tc.desc Call clear() twice on non-empty Set (no extra effects)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetClearTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();
      const sizeAfterFirst = set.size;
      set.clear();
      const sizeAfterSecond = set.size;

      expect(sizeAfterFirst).assertEqual(0);
      expect(sizeAfterSecond).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_1400
     * @tc.name SetClearTest014
     * @tc.desc Clear Set with object references, verify removal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetClearTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const obj = { id: 1 } as BaseI;
      const set = new Set<BaseI>([obj, { id: 2 } as BaseI]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(obj)).assertEqual(false);
      expect(set.has({ id: 2 })).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_1600
     * @tc.name SetClearTest016
     * @tc.desc Clear Set with Date objects, verify removal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetClearTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const date = new Date();
      const set = new Set<Date>([date, new Date()]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(date)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_1700
     * @tc.name SetClearTest017
     * @tc.desc Clear Set with RegExp objects, verify removal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetClearTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const regex = new RegExp('test');
      const set = new Set<RegExp>([regex, new RegExp('test','g')]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(regex)).assertEqual(false);
      expect(set.has(new RegExp('test','g'))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_1800
     * @tc.name SetClearTest018
     * @tc.desc Clear Set with function references, verify removal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetClearTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const func = () => {};
      const set = new Set<Function>([func, () => {}]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(func)).assertEqual(false);
      expect(set.has(() => {})).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_1900
     * @tc.name SetClearTest019
     * @tc.desc Clear Set created from another Set, verify removal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetClearTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const originalSet = new Set<int>([1, 2, 3]);
      const newSet = new Set<int>(originalSet);

      newSet.clear();
      expect(newSet.size).assertEqual(0);
      expect(originalSet.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_2000
     * @tc.name SetClearTest020
     * @tc.desc Clear Set created from array, verify removal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetClearTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const set = new Set<int>(arr);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_2100
     * @tc.name SetClearTest021
     * @tc.desc Add new elements after clear(), verify normal addition
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2]);
      set.clear();

      set.add(3);
      set.add(4);

      expect(set.size).assertEqual(2);
      expect(set.has(3)).assertEqual(true);
      expect(set.has(4)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_2200
     * @tc.name SetClearTest022
     * @tc.desc Verify iterator has no elements after clear()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();

      const values = Array.from(set.values());
      const keys = Array.from(set.keys());

      expect(values.length).assertEqual(0);
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_2300
     * @tc.name SetClearTest023
     * @tc.desc Multiple references to same Set, clear() affects all references
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2]);
      const ref1 = set;
      const ref2 = set;

      ref1.clear();

      expect(set.size).assertEqual(0);
      expect(ref1.size).assertEqual(0);
      expect(ref2.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_2600
     * @tc.name SetClearTest026
     * @tc.desc Clear Set with nested Set elements, verify removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const innerSet1 = new Set<Double>([1, 2]);
      const innerSet2 = new Set<Double>([3, 4]);
      const outerSet = new Set<Set<Double>>([innerSet1, innerSet2]);

      outerSet.clear();

      expect(outerSet.size).assertEqual(0);
      expect(outerSet.has(innerSet1)).assertEqual(false);
      expect(innerSet1.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_2700
     * @tc.name SetClearTest027
     * @tc.desc Clear Set and verify forEach has no iterations
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();

      let iterationCount = 0;
      set.forEach(() => {
        iterationCount++;
      });

      expect(iterationCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_2800
     * @tc.name SetClearTest028
     * @tc.desc Clear Set used in for...of loop (no iterations after clear)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();

      let iterationCount = 0;
      for (const _ of set) {
        iterationCount++;
      }

      expect(iterationCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_3000
     * @tc.name SetClearTest030
     * @tc.desc Comprehensive test: clear() + add() + clear() + add()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<string>();

      set.add('a').add('b');
      expect(set.size).assertEqual(2);
      set.clear();
      expect(set.size).assertEqual(0);

      set.add('c').add('d');
      expect(set.size).assertEqual(2);
      set.clear();
      expect(set.size).assertEqual(0);
      set.add('e');
      expect(set.size).assertEqual(1);
      expect(set.has('e')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_3100
     * @tc.name SetClearTest031
     * @tc.desc Clear Set during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const iterationLogs: number[] = [];

      for (const item of set) {
        iterationLogs.push(item);
        if (item === 3) {
          set.clear();
        }
      }

      expect(JSON.stringify(iterationLogs)).assertDeepEquals(JSON.stringify([1, 2, 3]));
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_3200
     * @tc.name SetClearTest032
     * @tc.desc Clear Set in forEach callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      const callbackLogs: number[] = [];

      set.forEach((item) => {
        callbackLogs.push(item);
        if (item === 2) {
          set.clear();
        }
      });

      expect(JSON.stringify(callbackLogs)).assertDeepEquals(JSON.stringify([1, 2]));
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_3300
     * @tc.name SetClearTest033
     * @tc.desc Clear Set with circular references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      const obj = { id : 1 , self: null } as Base1;
      obj.self = obj;
      const set = new Set<Object>([obj]);

      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_3400
     * @tc.name SetClearTest034
     * @tc.desc Clear Set with WeakMap references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      const wm = new WeakMap<Base2, string>();
      const key = {} as Base2;
      wm.set(key, 'value');

      const set = new Set<WeakMap<Base2, string> | Base2>([wm, key]);
      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has(wm)).assertEqual(false);
      expect(set.has(key)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_3500
     * @tc.name SetClearTest035
     * @tc.desc Clear Set with WeakSet references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const ws = new WeakSet<Base2>();
      const obj = {} as Base2;
      ws.add(obj);

      const set = new Set<WeakSet<Base2> | Base2>([ws, obj]);
      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has(ws)).assertEqual(false);
      expect(set.has(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_3700
     * @tc.name SetClearTest037
     * @tc.desc Clear Set with DOM elements (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      const div1 = { tagName: 'DIV', id: 'div1' } as Base3;
      const div2 = { tagName: 'DIV', id: 'div2' } as Base3;
      const set = new Set<Base3>([div1, div2]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has(div1)).assertEqual(false);
      expect(set.has(div2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_4100
     * @tc.name SetClearTest041
     * @tc.desc Clear Set in setTimeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<number>([1, 2, 3]);
      await new Promise<void>(resolve => {
        setTimeout(() => {
          set.clear();
          resolve(undefined);
        }, 0);
      });
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_4200
     * @tc.name SetClearTest042
     * @tc.desc Clear Set in async function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      await clearSetAsync(set);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_4300
     * @tc.name SetClearTest043
     * @tc.desc Clear Set in promise then handler
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);

      await Promise.resolve().then(() => {
        set.clear();
      });

      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_4400
     * @tc.name SetClearTest044
     * @tc.desc Race condition: clear vs add in different microtasks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2]);

      Promise.resolve().then(() => set.clear());
      Promise.resolve().then(() => set.add(3));

      await new Promise<int>((resolve) => {setTimeout(() => resolve(0), 0)});

      expect(set.size).assertEqual(1);
      expect(set.has(3)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_4500
     * @tc.name SetClearTest045
     * @tc.desc Clear Set before and after async operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<string>();

      set.add('before');
      set.clear();
      expect(set.size).assertEqual(0);

      await new Promise<int>((resolve) => {setTimeout(() => resolve(0), 0)});

      set.add('after');
      expect(set.size).assertEqual(1);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_4800
     * @tc.name SetClearTest048
     * @tc.desc Clear Set during fetch simulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['pending']);
      const mockFetch = () => new Promise<Base5>(resolve => {
        setTimeout(() => {
          set.clear();
          resolve({ data: 'test' } as Base5);
        }, 0);
      });
      await mockFetch();
      expect(set.size).assertEqual(0);
      expect(set.has('pending')).assertEqual(false);
    });


    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_5000
     * @tc.name SetClearTest050
     * @tc.desc Clear Set after async iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      const results: number[] = [];

      for (const item of set) {
        await Promise.resolve();
        results.push(item);
      }

      set.clear();

      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([1, 2, 3]));
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_5100
     * @tc.name SetClearTest051
     * @tc.desc Clear instance of Set subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      const set = new MySet<int>([1, 2, 3]);
      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.first).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_5200
     * @tc.name SetClearTest052
     * @tc.desc Clear Set with overridden clear method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {


      const set = new LoggingSet<int>([1, 2, 3]);
      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.log).assertDeepEquals(['clear called']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_5700
     * @tc.name SetClearTest057
     * @tc.desc Clear Set in derived class with super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {


      const set = new ValidatedSet<int>([1, 2, 3]);
      const result = set.clearAndReturnResult();

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_6100
     * @tc.name SetClearTest061
     * @tc.desc Clear Set used in Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      const map = new Map<string, Set<int>>();
      map.set('key', set);

      set.clear();

      expect(set.size).assertEqual(0);
      expect((map.get('key') as Set<int>).size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_6200
     * @tc.name SetClearTest062
     * @tc.desc Clear Set used as key in Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      const map = new Map<Set<int>, string>();
      map.set(set, 'value');

      set.clear();

      expect(set.size).assertEqual(0);
      expect(map.has(set)).assertEqual(true);
      expect(map.get(set)).assertEqual('value');
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_6300
     * @tc.name SetClearTest063
     * @tc.desc Clear Set used in WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      const wm = new WeakMap<Set<int>, string>();
      wm.set(set, 'value');

      set.clear();

      expect(set.size).assertEqual(0);
      expect(wm.has(set)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_6400
     * @tc.name SetClearTest064
     * @tc.desc Clear Set after converting to array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      const arr = Array.from(set);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_6500
     * @tc.name SetClearTest065
     * @tc.desc Clear Set used in JSON serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);

      const jsonBefore = JSON.stringify(Array.from(set));

      set.clear();

      const jsonAfter = JSON.stringify(Array.from(set));

      expect(jsonBefore).assertEqual('[1,2,3]');
      expect(jsonAfter).assertEqual('[]');
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_6700
     * @tc.name SetClearTest067
     * @tc.desc Clear Set used in function parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);

      processSet(set);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_6800
     * @tc.name SetClearTest068
     * @tc.desc Clear Set used in closure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);

      const closure = createClosure(set);
      closure();

      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_6900
     * @tc.name SetClearTest069
     * @tc.desc Clear Set with elements that have valueOf override
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const obj1 = {
        valueOf: () => 1
      } as Base6;

      const obj2 = {
        valueOf: () => 2
      } as Base6;

      const set = new Set<Base6>([obj1, obj2]);
      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has(obj1)).assertEqual(false);
      expect(set.has(obj2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_7000
     * @tc.name SetClearTest070
     * @tc.desc Clear Set with elements that have toString override
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      const obj1 = {
        toString1: () => 'one'
      } as Base7;

      const obj2 = {
        toString1: () => 'two'
      } as Base7;

      const set = new Set<Base7>([obj1, obj2]);
      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has(obj1)).assertEqual(false);
      expect(set.has(obj2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_7200
     * @tc.name SetClearTest072
     * @tc.desc Clear Set and check memory references (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      const obj = { data: 'test' } as Base8;
      const set = new Set<Base8>([obj]);

      const ref = obj;

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has(obj)).assertEqual(false);
      expect(ref.data).assertEqual('test');
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_7300
     * @tc.name SetClearTest073
     * @tc.desc Clear Set and re-add same objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const obj1 = { id: 1 } as Base9;
      const obj2 = { id: 2 } as Base9;
      const set = new Set<Base9>([obj1, obj2]);

      set.clear();
      set.add(obj1).add(obj2);

      expect(set.size).assertEqual(2);
      expect(set.has(obj1) && set.has(obj2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_7400
     * @tc.name SetClearTest074
     * @tc.desc Clear Set multiple times with additions in between
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest074', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<string>();
      const iterations = 100;

      for (let i = 0; i < iterations; i++) {
        for (let j = 0; j < 10; j++) {
          set.add(`${i}_${j}`);
        }

        expect(set.size).assertEqual(10);

        set.clear();
        expect(set.size).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_7500
     * @tc.name SetClearTest075
     * @tc.desc Clear Set with elements that override hasOwnProperty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      const obj = {
        hasOwnProperty1: () => true
      } as Base10;

      const set = new Set<Base10>([obj]);
      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_7800
     * @tc.name SetClearTest078
     * @tc.desc Clear Set with elements that have circular references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      const obj = {} as Base11;
      obj.self = obj;

      const set = new Set<Base11>([obj]);
      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has(obj)).assertEqual(false);
      expect(obj.self).assertEqual(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_7900
     * @tc.name SetClearTest079
     * @tc.desc Clear Set with weak references (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let obj: Base12 | null = { data: 'test' };
      const set = new Set<Base12>([obj]);

      set.clear();
      obj = null;

      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_8000
     * @tc.name SetClearTest080
     * @tc.desc Performance: Clear Set with 1,000 elements
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest080', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<number>();
      const count = 1000;
      for (let i = 0; i < count; i++) {
        set.add(i);
      }

      expect(set.size).assertEqual(count);

      const startTime = new Date().getTime();
      set.clear();
      const endTime = new Date().getTime();

      expect(set.size).assertEqual(0);
      expect(endTime - startTime).assertLessOrEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_8200
     * @tc.name SetClearTest082
     * @tc.desc Clear Set with element named 'clear'
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const set = new Set<Base13>();
      const element = { name: 'clear' } as Base13;
      set.add(element);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has(element)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_8400
     * @tc.name SetClearTest084
     * @tc.desc Clear Set with malicious elements (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const maliciousObj = new BaseClass1;

      const set = new Set<int | BaseClass1>([maliciousObj, 1, 2]);

      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_8800
     * @tc.name SetClearTest088
     * @tc.desc Clear Set with elements that throw in toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      const problematicObj = {
        toString1: () => {
          throw new Error('toString failed');
        }
      } as Base14;

      const set = new Set<Base14 | int>([problematicObj, 1, 2]);

      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_9000
     * @tc.name SetClearTest090
     * @tc.desc Clear Set with elements that are promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const promise1 = Promise.resolve(1);
      const promise2 = Promise.resolve(2);
      const set = new Set<Promise<Int>>([promise1, promise2]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has(promise1)).assertEqual(false);

      expect(await promise1).assertEqual(1);
      expect(await promise2).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_9100
     * @tc.name SetClearTest091
     * @tc.desc Clear Set with Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<String>([
        'café', 'cafe', 'cafè',
        'à', 'á', 'â', 'ã', 'ä',
        'ñ', 'ç', 'ø'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('café')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_9200
     * @tc.name SetClearTest092
     * @tc.desc Clear Set with emojis and special symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<String>([
        '😊', '😂', '😍', '👍', '❤️',
        '🇺🇸', '🇫🇷', '🇯🇵',
        '©', '®', '�?', '§', '¶'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('😊')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_9300
     * @tc.name SetClearTest093
     * @tc.desc Clear Set with bidirectional text characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<String>([
        'א', 'ב', 'ג',
        'ا', 'ب', 'ت',
        'فارسی', 'عربی', 'हिन्दी'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('א')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_9400
     * @tc.name SetClearTest094
     * @tc.desc Clear Set with zero-width characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<String>([
        '\u200B',
        '\u200C',
        '\u200D',
        '\uFEFF'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('\u200B')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_9500
     * @tc.name SetClearTest095
     * @tc.desc Clear Set with control characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<String>([
        '\0',
        '\t',
        '\n',
        '\r',
        '\x1B'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('\n')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_9600
     * @tc.name SetClearTest096
     * @tc.desc Clear Set with mathematical symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<String>([
        '∀', '�?', '�?', '�?', '�?', '�?',
        '�?', '�?', '�?', '�?', '�?', '�?',
        '�?', '�?', '�?', '�?', '�?', '�?'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('�?')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_9700
     * @tc.name SetClearTest097
     * @tc.desc Clear Set with rare Unicode planes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<String>([
        '𝌆',
        '𝄞',
        '𝓐',
        '𝔹',
        '😀',
        '🅰�?'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('😀')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_9800
     * @tc.name SetClearTest098
     * @tc.desc Clear Set with mixed direction text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<String>([
        'Hello א',
        'ב World',
        'مرحبا こんにち�?',
        'abcdef 12345 あいうえ�?'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('Hello א')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_CLEAR_TEST_9900
     * @tc.name SetClearTest099
     * @tc.desc Clear Set with surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetClearTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<String>([
        'A\uD83D\uDE00B',
        '\uD834\uDD1E',
        '\uD835\uDC00',
        '\uD86D\uDE3A'
      ]);

      set.clear();

      expect(set.size).assertEqual(0);
      expect(set.has('A\uD83D\uDE00B')).assertEqual(false);
    });

  });
}