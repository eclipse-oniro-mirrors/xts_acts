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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { objectAllPropTest0100, objectAllPropTest0300, objectAllPropTest0400,
  objectAllPropTest0500,
  objectAllPropTest0600,
  objectAllPropTest0800,
  objectAllPropTest0900,
  objectAllPropTest1000,
  objectAllPropTest1001,
  objectAllPropTest1002,
  objectAllPropTest1100,
  objectAllPropTest1200,
  objectAllPropTest1300,
  objectAllPropTest1400,
  objectAllPropTest1500,
  objectAllPropTest1700,
  objectAllPropTest1800,
  objectAllPropTest1900,
  objectAllPropTest2000,
  objectAllPropTest2100,
  objectAllPropTest2200,
  objectAllPropTest2300,
  objectAllPropTest2400,
  objectAllPropTest2500,
  objectAllPropTest2600,
  objectAllPropTest2700,
  objectAllPropTest2800,
  objectAllPropTest2900,
  objectAllPropTest3000,
  objectAllPropTest3600,
  objectAllPropTest3700,
  objectAllPropTest3800,
  objectAllPropTest3801,
  objectAllPropTest3900,
  objectAllPropTest4000,
  objectAllPropTest4200,
  objectSetProto } from './ObjectAllProp';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function objectAllPropTest() {
  describe('objectAllPropTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_OBJECT_ALL_PROP_0100
     * @tc.name objectAllPropTest0100
     * @tc.desc For... in Loop Basic Enumeration Test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest0100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
        const enumerated = objectAllPropTest0100();
        expect(enumerated).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_0200
     * @tc.name objectAllPropTest0200
     * @tc.desc Object. keys() basic testing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest0200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const obj = objectSetProto();
      expect(Object.keys(obj)).assertDeepEquals(['a']);
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_0300
     * @tc.name objectAllPropTest0300
     * @tc.desc Object. getOwnPropertyNames() basic testing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest0300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const obj = objectAllPropTest0300();
      expect(Object.getOwnPropertyNames(obj)).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_0400
     * @tc.name objectAllPropTest0400
     * @tc.desc Distinguish between enumerable and non enumerable attributes in testing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest0400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const result = objectAllPropTest0400();

      expect(result[1]).assertDeepEquals(['enumProp']);
      expect(Object.keys(result[0])).assertDeepEquals(['enumProp']);
      expect(Object.getOwnPropertyNames(result[0])).assertDeepEquals(['enumProp', 'nonEnumProp']);
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_0500
     * @tc.name objectAllPropTest0500
     * @tc.desc Empty object enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest0500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const result = objectAllPropTest0500();

      expect(result[1]).assertDeepEquals([]);
      expect(Object.keys(result[0])).assertDeepEquals([]);
      expect(Object.getOwnPropertyNames(result[0])).assertDeepEquals([]);
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_0600
     * @tc.name objectAllPropTest0600
     * @tc.desc Single attribute object enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest0600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const result = objectAllPropTest0600();

      expect(result[1]).assertDeepEquals(['test']);
      expect(Object.keys(result[0])).assertDeepEquals(['test']);
      expect(Object.getOwnPropertyNames(result[0])).assertDeepEquals(['test']);
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_0700
     * @tc.name objectAllPropTest0700
     * @tc.desc Multi attribute object enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest0700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface BaseI{
        a: number;
        b: number;
        c: number;
      }
      const obj = { a: 1, b: 2, c: 3 } as BaseI;

      expect(Object.keys(obj)).assertDeepEquals(['a', 'b', 'c']);
      expect(Object.keys(obj).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_0800
     * @tc.name objectAllPropTest0800
     * @tc.desc Symbol property enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest0800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const result = objectAllPropTest0800();

      expect(result[1].toString()).assertEqual([].toString());
      expect(Object.keys(result[0]).toString()).assertEqual([].toString());
      expect(Object.getOwnPropertyNames(result[0]).toString()).assertEqual([].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_0900
     * @tc.name objectAllPropTest0900
     * @tc.desc Method attribute enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest0900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const obj = objectAllPropTest0900();
      expect(Object.keys(obj).toString()).assertEqual(['method1', 'method2'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_1000
     * @tc.name objectAllPropTest1000
     * @tc.desc Three methods for testing return value types
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest1000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const forInProps = objectAllPropTest1000();
      expect(Array.isArray(forInProps)).assertEqual(true);
      expect(typeof forInProps[0]).assertEqual('string');

      const keys = objectAllPropTest1001();
      expect(Array.isArray(keys)).assertEqual(true);
      expect(typeof keys[0]).assertEqual('string');

      const ownNames = objectAllPropTest1002();
      expect(Array.isArray(keys)).assertEqual(true);
      expect(typeof ownNames[0]).assertEqual('string');
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_1100
     * @tc.name objectAllPropTest1100
     * @tc.desc Single level prototype chain enumeration testing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest1100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const result = objectAllPropTest1100() as (string[] | object)[];
      expect(result[1].toString()).assertEqual(['a', 'b'].toString());

      expect(Object.keys(result[0]).toString()).assertEqual(['a'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_1200
     * @tc.name objectAllPropTest1200
     * @tc.desc Multi level prototype chain enumeration testing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest1200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const forInProps = objectAllPropTest1200();
      expect(forInProps.toString()).assertEqual(['a', 'b', 'c'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_1300
     * @tc.name objectAllPropTest1300
     * @tc.desc Non enumerable attribute testing in prototype chain
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest1300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const forInProps = objectAllPropTest1300();
      expect(forInProps.toString()).assertEqual(['enumProp'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_1400
     * @tc.name objectAllPropTest1400
     * @tc.desc Attribute Coverage Prototype Chain Attribute Testing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest1400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface BaseI{
        prop?: string;
      }
      const result = objectAllPropTest1400() as (string[] | BaseI)[];
      expect(result[1].toString()).assertEqual(['prop'].toString());
      expect((result[0] as BaseI).prop).assertEqual('from obj');
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_1500
     * @tc.name objectAllPropTest1500
     * @tc.desc Class Inheritance Enumeration Test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest1500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const forInProps = objectAllPropTest1500();
      expect(forInProps).assertContain('subClassProp');
      expect(forInProps).assertContain('baseClassProp');
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_1600
     * @tc.name objectAllPropTest1600
     * @tc.desc Class private property enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest1600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      class Test {
        public publicProp = 'public';
        private privateProp = 'private';
        protected protectedProp = 'protected';
      }

      const instance = new Test();
      expect(Object.keys(instance)).assertContain('publicProp');
      expect(Object.keys(instance)).assertContain('privateProp');
      expect(Object.keys(instance)).assertContain('protectedProp');
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_1700
     * @tc.name objectAllPropTest1700
     * @tc.desc Object. prototype property enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest1700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const forInProps = objectAllPropTest1700();
      expect(forInProps.toString()).assertEqual([].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_1800
     * @tc.name objectAllPropTest1800
     * @tc.desc HasOwnProperty filtering test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest1800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const forInProps = objectAllPropTest1800();
      expect(forInProps.toString()).assertEqual(['a'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_1900
     * @tc.name objectAllPropTest1900
     * @tc.desc The influence of prototype chain length on enumeration
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest1900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const forInProps = objectAllPropTest1900();
      expect(forInProps.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_2000
     * @tc.name objectAllPropTest2000
     * @tc.desc Enumeration testing after modifying the prototype
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest2000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const result = objectAllPropTest2000();
      expect(result[0].toString()).assertEqual(['a', 'b'].toString());
      expect(result[1].toString()).assertEqual(['a', 'c'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_2100
     * @tc.name objectAllPropTest2100
     * @tc.desc Array object enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest2100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const arr = [1, 2, 3];
      const result = objectAllPropTest2100(arr) as (string[] | number[])[];

      expect(result[1].toString()).assertEqual(['0', '1', '2', 'customProp'].toString());
      expect(Object.keys(result[0]).toString()).assertEqual(['0', '1', '2', 'customProp'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_2200
     * @tc.name objectAllPropTest2200
     * @tc.desc Function object enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest2200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const result = objectAllPropTest2200();

      expect(result[1]).assertContain('customProp');
      expect(result[1]).not().assertContain('name');
      expect(result[1]).not().assertContain('length');

      expect(Object.keys(result[0]).toString()).assertEqual(['customProp'].toString());

      expect(result[2].toString()).assertEqual(['length', 'name', 'prototype', 'customProp'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_2300
     * @tc.name objectAllPropTest2300
     * @tc.desc Date Object Enumeration Test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest2300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const date = new Date();
      const result = objectAllPropTest2300(date) as (string[] | Date)[];

      expect(result[1].toString()).assertEqual([].toString());

      expect(Object.keys(date).toString()).assertEqual([].toString());
      expect(result[2].toString()).assertEqual([].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_2400
     * @tc.name objectAllPropTest2400
     * @tc.desc RegExp Object Enumeration Test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest2400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const regex = new RegExp(/test/gi);
      const result = objectAllPropTest2400(regex) as (string[] | RegExp)[];

      expect(result[1].toString()).assertEqual([].toString());

      expect(Object.keys(regex).toString()).assertEqual([].toString());
      expect(result[2].toString()).assertEqual(['lastIndex'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_2500
     * @tc.name objectAllPropTest2500
     * @tc.desc Map Object Enumeration Test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest2500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const map = new Map<string, string>();
      const result = objectAllPropTest2500(map) as (string[] | Map<string, string>)[];

      expect(result[1].toString()).assertEqual(['customProp'].toString());

      expect(Object.keys(map).toString()).assertEqual(['customProp'].toString());
      expect(result[2].toString()).assertEqual(['customProp'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_2600
     * @tc.name objectAllPropTest2600
     * @tc.desc Set Object Enumeration Test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest2600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const set = new Set<string>();
      const result = objectAllPropTest2600(set) as (string[] | Set<string>)[];

      expect(result[1].toString()).assertEqual(['customProp'].toString());

      expect(Object.keys(set).toString()).assertEqual(['customProp'].toString());
      expect(result[2].toString()).assertEqual(['customProp'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_2700
     * @tc.name objectAllPropTest2700
     * @tc.desc Error Object Enumeration Test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest2700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const error = new Error('Test error');
      const result = objectAllPropTest2700(error) as (string[] | Error)[];
      expect(result[1].toString()).assertEqual(['customProp'].toString());

      expect(Object.keys(error).toString()).assertEqual(['customProp'].toString());
      expect(result[2].toString()).assertEqual(['message','errorfunc', 'stack', 'topstack', 'customProp'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_2800
     * @tc.name objectAllPropTest2800
     * @tc.desc Number Object Enumeration Test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest2800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const numObj = new Number(123);
      const result = objectAllPropTest2800(numObj) as (string[] | Number)[];
      expect(result[1].toString()).assertEqual(['customProp'].toString());

      expect(Object.keys(numObj).toString()).assertEqual(['customProp'].toString());
      expect(result[2].toString()).assertEqual(['customProp'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_2900
     * @tc.name objectAllPropTest2900
     * @tc.desc Freeze Object Enumeration Test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest2900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const obj = objectAllPropTest2900();
      expect(Object.keys(obj).toString()).assertEqual(['a', 'b'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_3000
     * @tc.name objectAllPropTest3000
     * @tc.desc seal Object Enumeration Test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest3000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const obj = objectAllPropTest3000();
      expect(Object.keys(obj).toString()).assertEqual(['a', 'b'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_3100
     * @tc.name objectAllPropTest3100
     * @tc.desc First level nested object enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest3100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface BaseI{
        b: number;
        c: number;
      }
      interface BaseI1{
        a: number;
        nested: BaseI;
      }
      const obj: BaseI1 = {
        a: 1,
        nested: {
          b: 2,
          c: 3
        }
      };
      expect(Object.keys(obj).toString()).assertEqual(['a', 'nested'].toString());
      expect(Object.keys(obj).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_3200
     * @tc.name objectAllPropTest3200
     * @tc.desc Multi level nested object enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest3200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface BaseI{
        value: string;
      }
      interface BaseI1{
        level3: BaseI;
      }
      interface BaseI2{
        level2: BaseI1;
      }
      interface BaseI3{
        level1: BaseI2;
      }
      const obj: BaseI3 = {
        level1: {
          level2: {
            level3: {
              value: 'deep'
            }
          }
        }
      };

      expect(Object.keys(obj).toString()).assertEqual(['level1'].toString());
      expect(Object.keys(obj.level1).toString()).assertEqual(['level2'].toString());
      expect(Object.keys(obj.level1.level2).toString()).assertEqual(['level3'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_3300
     * @tc.name objectAllPropTest3300
     * @tc.desc Nested object enumeration test containing arrays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest3300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface BaseI{
        tags: string[];
      }
      interface BaseI1{
        name: string;
        items: number[];
        details: BaseI;
      }
      const obj: BaseI1 = {
        name: 'test',
        items: [1, 2, 3],
        details: {
          tags: ['a', 'b']
        }
      };

      expect(Object.keys(obj).toString()).assertEqual(['name', 'items', 'details'].toString());
      expect(Object.keys(obj.items).toString()).assertEqual(['0', '1', '2'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_3400
     * @tc.name objectAllPropTest3400
     * @tc.desc Nested object enumeration test containing functions
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest3400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      class Methods{
        func1(){}
        func2: ()=>void = ()=>{}
      }
      class BaseC{
        prop: string = 'value';
        methods: Methods = new Methods();
      }
      const obj = new BaseC();

      expect(Object.keys(obj).toString()).assertEqual(['prop', 'methods'].toString());
      expect(Object.keys(obj.methods).toString()).assertEqual(['func2'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_3500
     * @tc.name objectAllPropTest3500
     * @tc.desc Mixed type nested object enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest3500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface BaseI{
        e: number;
      }
      interface BaseI1{
        a: number;
        b: string;
        c: boolean;
        d: BaseI;
        f: number[];
        g: ()=>void;
        h: Date;
      }
      const obj: BaseI1 = {
        a: 123,
        b: 'string',
        c: true,
        d: { e: 456 },
        f: [7, 8, 9],
        g: () => {},
        h: new Date()
      };

      expect(Object.keys(obj).toString()).assertEqual(['a', 'b', 'c', 'd', 'f', 'g', 'h'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_3600
     * @tc.name objectAllPropTest3600
     * @tc.desc Loop reference object enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest3600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface BaseI{
        a: number;
      }
      const obj: BaseI = { a: 1 };
      objectAllPropTest3600(obj);
      expect(Object.keys(obj).toString()).assertEqual(['a', 'self'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_3700
     * @tc.name objectAllPropTest3700
     * @tc.desc Large object enumeration testing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest3700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface BaseI{
      }
      const obj: BaseI = { };
      const ownProto = objectAllPropTest3700(obj);
      expect(Object.keys(obj).length).assertEqual(100);
      expect(ownProto.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_3800
     * @tc.name objectAllPropTest3800
     * @tc.desc Object enumeration test for dynamically adding attributes
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest3800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface BaseI{
        a: number;
      }
      const obj: BaseI = { a: 1 };
      objectAllPropTest3800(obj);
      expect(Object.keys(obj).toString()).assertEqual(['a', 'b'].toString());
      const ownProto = objectAllPropTest3801(obj);
      expect(Object.keys(obj).toString()).assertEqual(['a', 'b'].toString());
      expect(ownProto.toString()).assertEqual(['a', 'b', 'c'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_3900
     * @tc.name objectAllPropTest3900
     * @tc.desc Sparse array enumeration test
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest3900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const arr = [];
      const forInProps = objectAllPropTest3900(arr);

      expect(forInProps.toString()).assertEqual(['0', '2'].toString());
      expect(Object.keys(arr).toString()).assertEqual(['0', '2'].toString());
      expect(Object.getOwnPropertyNames(arr).toString()).assertEqual(['0', '2', 'length'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_4000
     * @tc.name objectAllPropTest4000
     * @tc.desc Basic testing of listAllProperties function
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest4000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      const allProps = objectAllPropTest4000();

      expect(allProps).assertContain('a');
      expect(allProps).assertContain('b');
      expect(allProps).assertContain('constructor');
      expect(allProps).assertContain('toString');
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_4100
     * @tc.name objectAllPropTest4100
     * @tc.desc Test the order of return values of enumeration methods
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest4100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface BaseI{
        '3': string;
        '1': string;
        '2': string;
        'a': string;
        'b': string;
      }
      const obj: BaseI = {
        '3': 'three',
        '1': 'one',
        '2': 'two',
        'a': 'A',
        'b': 'B'
      };

      expect(Object.keys(obj).toString()).assertEqual(['1', '2', '3', 'a', 'b'].toString());
    });

    /**
     * @tc.number SUB_OBJECT_ALL_PROP_4200
     * @tc.name objectAllPropTest4200
     * @tc.desc Comparative testing of comprehensive enumeration methods
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('objectAllPropTest4200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      interface BaseI{
        g: string;
      }
      const grandparent: BaseI = { g: 'grandparent' };

      const result = objectAllPropTest4200(grandparent) as (BaseI | string[])[];

      expect(result[1].toString()).assertEqual(['o', 'p', 'g'].toString());
      expect(Object.keys(result[0]).toString()).assertEqual(['o'].toString());
      expect(Object.getOwnPropertyNames(result[0]).toString()).assertEqual(['o', 'oNonEnum'].toString());
    });

  })
}