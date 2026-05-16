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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

interface GeneratedObjectLiteralInterface_1 {}

function myFunc() {
}

function C() {
}

function D() {
}

export default function expressionTest8() {
  describe('ExpressionTest8', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(100)
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   ExpressionTest1403
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_0100
     * @tc.desc   Test instanceof with String object vs string literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const simpleStr: ESObject = "This is a simple string";
      const myString = new String();
      const newStr = new String("String created with constructor");
      expect(simpleStr instanceof String).assertFalse();
      expect(myString instanceof String).assertTrue();
      expect(newStr instanceof String).assertTrue();
      expect(myString instanceof Object).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1404
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_0200
     * @tc.desc   Test instanceof with Date object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myDate = new Date();
      expect(myDate instanceof Date).assertTrue();
      expect(myDate instanceof Object).assertTrue();
      expect(myDate instanceof String).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest1405
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_0300
     * @tc.desc   Test instanceof with Array object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [];
      const arr2: ESObject = new Array();
      expect(arr instanceof Array).assertTrue();
      expect(arr2 instanceof Array).assertTrue();
      expect(arr instanceof Object).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1406
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_0400
     * @tc.desc   Test instanceof with Object literal and Object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myObj: GeneratedObjectLiteralInterface_1 = {};
      const myObj2 = new Object();
      expect(myObj instanceof Object).assertTrue();
      expect(myObj2 instanceof Object).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1407
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_0500
     * @tc.desc   Test instanceof with Function object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      const arrowFunc = () => {
      };
      expect(myFunc instanceof Function).assertTrue();
      expect(arrowFunc instanceof Function).assertTrue();
      expect(myFunc instanceof Object).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1408
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_0600
     * @tc.desc   Test instanceof with RegExp object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex = /test/;
      const regex2 = new RegExp('test');
      expect(regex instanceof RegExp).assertTrue();
      expect(regex2 instanceof RegExp).assertTrue();
      expect(regex instanceof Object).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1409
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_0700
     * @tc.desc   Test instanceof with Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const err = new Error('test');
      const typeErr = new TypeError('test');
      expect(err instanceof Error).assertTrue();
      expect(typeErr instanceof Error).assertTrue();
      expect(typeErr instanceof TypeError).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1410
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_0800
     * @tc.desc   Test instanceof with complete error types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const error = new Error();
      const evalError = new EvalError();
      const rangeError = new RangeError();
      const referenceError = new ReferenceError();
      const syntaxError = new SyntaxError();
      const typeError = new TypeError();
      const uriError = new URIError();
      expect(error instanceof Error).assertTrue();
      expect(evalError instanceof EvalError).assertTrue();
      expect(evalError instanceof Error).assertTrue();
      expect(rangeError instanceof RangeError).assertTrue();
      expect(rangeError instanceof Error).assertTrue();
      expect(referenceError instanceof ReferenceError).assertTrue();
      expect(referenceError instanceof Error).assertTrue();
      expect(syntaxError instanceof SyntaxError).assertTrue();
      expect(syntaxError instanceof Error).assertTrue();
      expect(typeError instanceof TypeError).assertTrue();
      expect(typeError instanceof Error).assertTrue();
      expect(uriError instanceof URIError).assertTrue();
      expect(uriError instanceof Error).assertTrue();
    });


    /**
     * @tc.name   ExpressionTest1412
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_0900
     * @tc.desc   Test instanceof with Map and Set objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<string, string>();
      const set = new Set<string>();
      expect(map instanceof Map).assertTrue();
      expect(set instanceof Set).assertTrue();
      expect(map instanceof Object).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1413
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_1000
     * @tc.desc   Test instanceof with WeakMap and WeakSet objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const weakMap = new WeakMap<object, string>();
      const weakSet = new WeakSet<object>();
      expect(weakMap instanceof WeakMap).assertTrue();
      expect(weakSet instanceof WeakSet).assertTrue();
      expect(weakMap instanceof Object).assertTrue();
      expect(weakSet instanceof Object).assertTrue();
    });


    /**
     * @tc.name   ExpressionTest1420
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_1100
     * @tc.desc   Test instanceof with wrapper objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num = new Number(123);
      const str = new String('test');
      const bool = new Boolean(true);
      expect(num instanceof Number).assertTrue();
      expect(str instanceof String).assertTrue();
      expect(bool instanceof Boolean).assertTrue();
      expect(num instanceof Object).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1423
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_1200
     * @tc.desc   Test instanceof with ES6 class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Animal {
      }

      class Dog extends Animal {
      }

      const dog = new Dog();
      expect(dog instanceof Dog).assertTrue();
      expect(dog instanceof Animal).assertTrue();
      expect(dog instanceof Object).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1424
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_1300
     * @tc.desc   Test instanceof with multi-level inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class A {
      }

      class B extends A {
      }

      class C extends B {
      }

      const c = new C();
      expect(c instanceof C).assertTrue();
      expect(c instanceof B).assertTrue();
      expect(c instanceof A).assertTrue();
      expect(c instanceof Object).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1435
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_1400
     * @tc.desc   Test instanceof with TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int8 = new Int8Array();
      const uint8 = new Uint8Array();
      const int16 = new Int16Array();
      const float32 = new Float32Array();
      expect(int8 instanceof Int8Array).assertTrue();
      expect(uint8 instanceof Uint8Array).assertTrue();
      expect(int16 instanceof Int16Array).assertTrue();
      expect(float32 instanceof Float32Array).assertTrue();
      expect(int8 instanceof Object).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1436
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_1500
     * @tc.desc   Test instanceof with complete TypedArray types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const int8Array = new Int8Array();
      const uint8Array = new Uint8Array();
      const uint8ClampedArray = new Uint8ClampedArray();
      const int16Array = new Int16Array();
      const uint16Array = new Uint16Array();
      const int32Array = new Int32Array();
      const uint32Array = new Uint32Array();
      const float32Array = new Float32Array();
      const float64Array = new Float64Array();
      expect(int8Array instanceof Int8Array).assertTrue();
      expect(uint8Array instanceof Uint8Array).assertTrue();
      expect(uint8ClampedArray instanceof Uint8ClampedArray).assertTrue();
      expect(int16Array instanceof Int16Array).assertTrue();
      expect(uint16Array instanceof Uint16Array).assertTrue();
      expect(int32Array instanceof Int32Array).assertTrue();
      expect(uint32Array instanceof Uint32Array).assertTrue();
      expect(float32Array instanceof Float32Array).assertTrue();
      expect(float64Array instanceof Float64Array).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1437
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_1600
     * @tc.desc   Test instanceof with ArrayBuffer and DataView
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(buffer instanceof ArrayBuffer).assertTrue();
      expect(buffer instanceof Object).assertTrue();
      expect(view instanceof DataView).assertTrue();
      expect(view instanceof Object).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1441
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_1700
     * @tc.desc   Test instanceof with Iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const iterator = arr[Symbol.iterator]();
      expect(iterator instanceof Object).assertTrue();
      expect(iterator instanceof Array).assertFalse();
    });
    /**
     * @tc.name   ExpressionTest1444
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_1800
     * @tc.desc   Test instanceof with Reflect object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Reflect instanceof Object).assertTrue();
      expect(Reflect instanceof Function).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest1450
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_1900
     * @tc.desc   Test instanceof with Array.isArray comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [];
      expect(arr instanceof Array).assertTrue();
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1452
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_EXPRESSION_TEST_2000
     * @tc.desc   Test instanceof with BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1452', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res1: ESObject = BigInt(123n);
      let res2: ESObject = 123n;
      expect(res1 instanceof BigInt).assertFalse();
      expect(res2 instanceof BigInt).assertFalse();
    });


  })
}
