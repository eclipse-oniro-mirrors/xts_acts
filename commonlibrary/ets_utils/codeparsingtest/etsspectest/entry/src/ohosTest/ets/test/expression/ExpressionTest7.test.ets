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

export default function expressionTest7() {
  describe('ExpressionTest7', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   ExpressionTest1201
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1201
     * @tc.desc   Test NaN in addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = NaN + 10;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1202
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1202
     * @tc.desc   Test NaN in multiplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = NaN * 5;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1203
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1203
     * @tc.desc   Test Infinity addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = Infinity + Infinity;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1204
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1204
     * @tc.desc   Test Infinity subtraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = Infinity - Infinity;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1205
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1205
     * @tc.desc   Test Infinity multiplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = Infinity * 2;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1206
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1206
     * @tc.desc   Test Infinity division by number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = Infinity / 5;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1207
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1207
     * @tc.desc   Test number division by Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 10 / Infinity;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1208
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1208
     * @tc.desc   Test Infinity division by Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = Infinity / Infinity;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1209
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1209
     * @tc.desc   Test negative number modulus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = -17 % 5;
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.name   ExpressionTest1210
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1210
     * @tc.desc   Test number modulus negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 17 % -5;
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest1211
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1211
     * @tc.desc   Test negative modulus negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = -17 % -5;
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.name   ExpressionTest1212
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1212
     * @tc.desc   Test 0 multiplied by Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 0 * Infinity;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1216
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1216
     * @tc.desc   Test -0 strict equality with 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -0;
      const b: number = 0;
      expect(a === b).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1217
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1217
     * @tc.desc   Test division with -0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 1 / -0;
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1218
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1218
     * @tc.desc   Test 0 divided by 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 0 / 0;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1219
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1219
     * @tc.desc   Test typeof NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string = typeof NaN;
      expect(result).assertEqual("number");
    });



    /**
     * @tc.name   ExpressionTest1224
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1224
     * @tc.desc   Test string concatenation with boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string = "Hello " + true;
      expect(result).assertEqual("Hello true");
    });

    /**
     * @tc.name   ExpressionTest1225
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1225
     * @tc.desc   Test string concatenation with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string = "Value: " + null;
      expect(result).assertEqual("Value: null");
    });

    /**
     * @tc.name   ExpressionTest1226
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1226
     * @tc.desc   Test string concatenation with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string = "Value: " + undefined;
      expect(result).assertEqual("Value: undefined");
    });

    /**
     * @tc.name   ExpressionTest1232
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1232
     * @tc.desc   Test logical NOT on empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: boolean = !"";
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1233
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1233
     * @tc.desc   Test logical NOT on non-empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: boolean = !"test";
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest1235
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1235
     * @tc.desc   Test falsy values in logical AND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 0 && 5;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1236
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1236
     * @tc.desc   Test truthy values in logical OR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 5 || 0;
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest1238
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1238
     * @tc.desc   Test string comparison lexicographical
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: boolean = "2" > "10";
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1239
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1239
     * @tc.desc   Test null comparison with 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: boolean = null == 0;
      expect(result).assertFalse();
    });


    /**
     * @tc.name   ExpressionTest1243
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1243
     * @tc.desc   Test optional chaining with array index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30];
      const result = arr?.[1];
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name   ExpressionTest1244
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1244
     * @tc.desc   Test optional chaining with out-of-bounds array index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20];
      const result = arr?.[5];
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   ExpressionTest1245
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1245
     * @tc.desc   Test optional function call with valid function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const func = (x: number) => x * 2;
      const result = func?.(5);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest1247
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1247
     * @tc.desc   Test nullish coalescing with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: null = null;
      const result = a ?? "default";
      expect(result).assertEqual("default");
    });

    /**
     * @tc.name   ExpressionTest1248
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1248
     * @tc.desc   Test nullish coalescing with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: string = "";
      const result = a ?? "default";
      expect(result).assertEqual("");
    });

    /**
     * @tc.name   ExpressionTest1249
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1249
     * @tc.desc   Test logical OR assignment with truthy value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      a ||= 10;
      expect(a).assertEqual(5);
    });


    /**
     * @tc.name   ExpressionTest1250
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1250
     * @tc.desc   Test logical AND assignment with falsy value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      a &&= 10;
      expect(a).assertEqual(0);
    });


    /**
     * @tc.name   ExpressionTest1252
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1252
     * @tc.desc   Test nullish coalescing assignment with 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      a ??= 5;
      expect(a).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1258
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1258
     * @tc.desc   Test spread operator with arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2];
      const arr2 = [3, 4];
      const combined = [...arr1, ...arr2];
      expect(combined).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   ExpressionTest1261
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1261
     * @tc.desc   Test template string with variables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const name = "Test";
      const result = `Hello ${name}`;
      expect(result).assertEqual("Hello Test");
    });

    /**
     * @tc.name   ExpressionTest1262
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1262
     * @tc.desc   Test template string with expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = 5, b = 3;
      const result = `${a} + ${b} = ${a + b}`;
      expect(result).assertEqual("5 + 3 = 8");
    });


    /**
     * @tc.name   ExpressionTest1267
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1267
     * @tc.desc   Test rest operator in function parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sum = (...nums: number[]) => nums.reduce((a, b) => a + b, 0);
      const result = sum(1, 2, 3);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   ExpressionTest1268
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1268
     * @tc.desc   Test spread operator with function calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = Math.max(...arr);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   ExpressionTest1269
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1269
     * @tc.desc   Test conditional operator with optional chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface GeneratedObjectLiteralInterface_1 {
        a: number;
      }
      const obj: GeneratedObjectLiteralInterface_1 = { a: 5 };
      const result = obj?.a > 3 ? "greater" : "less";
      expect(result).assertEqual("greater");
    });


    /**
     * @tc.name   ExpressionTest1270
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1270
     * @tc.desc   Test MAX_SAFE_INTEGER addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const max = Number.MAX_SAFE_INTEGER;
      const result = max + 1;
      expect(result).assertEqual(9007199254740992);
    });

    /**
     * @tc.name   ExpressionTest1271
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1271
     * @tc.desc   Test MAX_SAFE_INTEGER precision loss
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const max = Number.MAX_SAFE_INTEGER;
      expect(max + 1 === max + 2).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1272
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1272
     * @tc.desc   Test MIN_SAFE_INTEGER subtraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const min = Number.MIN_SAFE_INTEGER;
      const result = min - 1;
      expect(result).assertEqual(-9007199254740992);
    });

    /**
     * @tc.name   ExpressionTest1273
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1273
     * @tc.desc   Test floating point addition precision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 0.1 + 0.2;
      expect(result === 0.3).assertEqual(false);
      expect(Math.abs(result - 0.3) < 1e-10).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1274
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1274
     * @tc.desc   Test floating point multiplication precision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 0.1 * 0.2;
      expect(result === 0.02).assertEqual(false);
      expect(Math.abs(result - 0.02) < 1e-10).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1275
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1275
     * @tc.desc   Test floating point division precision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 0.3 / 0.1;
      expect(result === 3).assertEqual(false);
    });

    /**
     * @tc.name   ExpressionTest1276
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1276
     * @tc.desc   Test Number.EPSILON for precision comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = 0.1 + 0.2;
      const b = 0.3;
      const result = Math.abs(a - b) < Number.EPSILON;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1277
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1277
     * @tc.desc   Test very small floating point number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 1e-323 * 0.5;
      expect(result).assertEqual(5e-324);
    });

    /**
     * @tc.name   ExpressionTest1278
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1278
     * @tc.desc   Test underflow to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 1e-324 * 0.5;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1279
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1279
     * @tc.desc   Test Number.MAX_VALUE addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const max = Number.MAX_VALUE;
      const result = max + max;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1280
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1280
     * @tc.desc   Test Number.MAX_VALUE multiplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const max = Number.MAX_VALUE;
      const result = max * 2;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1281
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1281
     * @tc.desc   Test Number.MIN_VALUE division
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const min = Number.MIN_VALUE;
      const result = min / 2;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1282
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1282
     * @tc.desc   Test integer division with floating result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 5 / 2;
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.name   ExpressionTest1283
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1283
     * @tc.desc   Test negative exponentiation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 2 **-3;
      expect(result).assertEqual(0.125);
    });

    /**
     * @tc.name   ExpressionTest1284
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1284
     * @tc.desc   Test fractional exponentiation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 16** 0.5;
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   ExpressionTest1285
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1285
     * @tc.desc   Test negative base with fractional exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = (-8) **(1/3);
      expect(result === 2).assertEqual(false);
    });

    /**
     * @tc.name   ExpressionTest1286
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1286
     * @tc.desc   Test large exponentiation overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 2** 1024;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1287
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1287
     * @tc.desc   Test zero exponentiation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 5 **0;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ExpressionTest1288
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1288
     * @tc.desc   Test zero with negative exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 0** -1;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1289
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1289
     * @tc.desc   Test Infinity with positive exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity ** 2;
      expect(result).assertEqual(Infinity);
    });


    /**
     * @tc.name   ExpressionTest1290
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1290
     * @tc.desc   Test bitwise NOT on maximum safe integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const max = Number.MAX_SAFE_INTEGER;
      const result = ~max;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1291
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1291
     * @tc.desc   Test bitwise AND with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = -5; // ...11111011
      const b = -3; // ...11111101
      const result = a & b;
      expect(result).assertEqual(-7); // ...11111001
    });

    /**
     * @tc.name   ExpressionTest1292
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1292
     * @tc.desc   Test bitwise OR with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = -5; // ...11111011
      const b = -3; // ...11111101
      const result = a | b;
      expect(result).assertEqual(-1); // ...11111111
    });

    /**
     * @tc.name   ExpressionTest1293
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1293
     * @tc.desc   Test bitwise XOR with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = -5; // ...11111011
      const b = -3; // ...11111101
      const result = a ^ b;
      expect(result).assertEqual(6); // ...00000110
    });

    /**
     * @tc.name   ExpressionTest1294
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1294
     * @tc.desc   Test left shift with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = -5 << 2;
      expect(result).assertEqual(-20);
    });

    /**
     * @tc.name   ExpressionTest1295
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1295
     * @tc.desc   Test right shift with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = -20 >> 2;
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.name   ExpressionTest1296
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1296
     * @tc.desc   Test unsigned right shift of negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = -5 >>> 2;
      expect(result).assertEqual(1073741822);
    });

    /**
     * @tc.name   ExpressionTest1297
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1297
     * @tc.desc   Test left shift by 0 bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 5 << 0;
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest1298
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1298
     * @tc.desc   Test shift by 32 bits (mod 32 behavior)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 1 << 32; // 32 mod 32 = 0
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ExpressionTest1299
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1299
     * @tc.desc   Test shift by 33 bits (mod 32 behavior)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 1 << 33; // 33 mod 32 = 1
      expect(result).assertEqual(2);
    });


    /**
     * @tc.name   ExpressionTest1300
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1300
     * @tc.desc   Test arithmetic operator precedence with multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 10 + 5 * 2 - 8 / 4;
      expect(result).assertEqual(18); // 10 + 10 - 2 = 18
    });

    /**
     * @tc.name   ExpressionTest1301
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1301
     * @tc.desc   Test parentheses overriding precedence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = (10 + 5) * (2 - 8) / 4;
      expect(result).assertEqual(-22.5); // 15 * (-6) / 4 = -90/4 = -22.5
    });

    /**
     * @tc.name   ExpressionTest1302
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1302
     * @tc.desc   Test exponentiation precedence over multiplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 2 * 3 **2;
      expect(result).assertEqual(18); // 2 * 9 = 18
    });

    /**
     * @tc.name   ExpressionTest1303
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1303
     * @tc.desc   Test unary operator precedence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = -1*(3) ** 2;
      expect(result).assertEqual(-9); // -(3^2) = -9
    });

    /**
     * @tc.name   ExpressionTest1304
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1304
     * @tc.desc   Test parentheses with unary operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = (-3) **2;
      expect(result).assertEqual(9); // (-3)^2 = 9
    });

    /**
     * @tc.name   ExpressionTest1305
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1305
     * @tc.desc   Test logical operator precedence with comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 5 > 3 && 2 < 4;
      expect(result).assertTrue(); // (true) && (true) = true
    });

    /**
     * @tc.name   ExpressionTest1306
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1306
     * @tc.desc   Test logical OR precedence over logical AND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = true || false && false;
      expect(result).assertTrue(); // true || (false && false) = true
    });

    /**
     * @tc.name   ExpressionTest1307
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1307
     * @tc.desc   Test assignment operator precedence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = 1, b = 2, c = 3;
      a = b = c;
      expect(a).assertEqual(3);
      expect(b).assertEqual(3);
    });

    /**
     * @tc.name   ExpressionTest1308
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1308
     * @tc.desc   Test conditional operator precedence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 5 > 10 ? 1 : 2 + 3;
      expect(result).assertEqual(5); // 1 : (2+3) = 5
    });

    /**
     * @tc.name   ExpressionTest1309
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1309
     * @tc.desc   Test comma operator precedence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = 1;
      a++;
      const result = ( a * 2);
      expect(result).assertEqual(4); // 2*2=4
    });

    /**
     * @tc.name   ExpressionTest1310
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1310
     * @tc.desc   Test bitwise operator precedence vs arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 5 + 3 & 4;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1311
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1311
     * @tc.desc   Test increment operator with assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = 5;
      const result = a++ + a;
      expect(result).assertEqual(11); // 5 + 6 = 11
    });

    /**
     * @tc.name   ExpressionTest1312
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1312
     * @tc.desc   Test decrement operator with assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = 5;
      const result = --a + a;
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name   ExpressionTest1313
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1313
     * @tc.desc   Test mixed assignment operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = 10;
      a += a *= 2;
      expect(a).assertEqual(30);
    });

    /**
     * @tc.name   ExpressionTest1314
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1314
     * @tc.desc   Test logical operators with non-boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = "hello" && 0 || "world";
      expect(result).assertEqual("world"); // (("hello" && 0)=0) || "world" = "world"
    });

    /**
     * @tc.name   ExpressionTest1315
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1315
     * @tc.desc   Test comparison chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 3 < 5 && 5 < 10;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1316
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1316
     * @tc.desc   Test typeof with parentheses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = typeof (5 + 3);
      expect(result).assertEqual("number");
    });

    /**
     * @tc.name   ExpressionTest1317
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1317
     * @tc.desc   Test instanceof with complex object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Parent {}
      class Child extends Parent {}
      const obj = new Child();
      expect(obj instanceof Child).assertTrue();
      expect(obj instanceof Parent).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1318
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1318
     * @tc.desc   Test void operator with expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = 5;
      const result = void (a = 10);
      expect(result).assertEqual(undefined);
      expect(a).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest1319
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1319
     * @tc.desc   Test comma operator in for loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sum = 0;
      for (let i = 0, j = 10; i < 5; i++, j--) {
        sum += i + j;
      }
      expect(sum).assertEqual(50); // (0+10)+(1+9)+(2+8)+(3+7)+(4+6) = 10+10+10+10+10=50
    });



    /**
     * @tc.name   ExpressionTest1323
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1323
     * @tc.desc   Test regexp in string concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = /test/ + " string";
      expect(result).assertEqual("/test/ string");
    });

    /**
     * @tc.name   ExpressionTest1326
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1326
     * @tc.desc   Test bigint addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = 10n;
      const b = 20n;
      const result = a + b;
      expect(result).assertEqual(30n);
    });


    /**
     * @tc.name   ExpressionTest1328
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1328
     * @tc.desc   Test array index with string conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ["a", "b", "c"];
      const result = arr["1"];
      expect(result).assertEqual("b");
    });


    /**
     * @tc.name   ExpressionTest1330
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1330
     * @tc.desc   Test Set size in arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set([1, 2, 3]);
      const result = set.size * 2;
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   ExpressionTest1331
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1331
     * @tc.desc   Test Map size comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map:ESObject = new Map();
      map.set("a", 1);
      const result = map.size > 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1332
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1332
     * @tc.desc   Test typed array arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = new Uint8Array([10, 20]);
      const result = arr[0] + arr[1];
      expect(result).assertEqual(30);
    });

    /**
     * @tc.name   ExpressionTest1333
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1333
     * @tc.desc   Test error object in string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const err = new Error("test");
      const result = "Error: " + err;
      expect(result).assertEqual("Error: Error: test");
    });

    /**
     * @tc.name   ExpressionTest1334
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1334
     * @tc.desc   Test boolean object comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = new Boolean(true);
      const b = true;
      expect(a == b).assertTrue();
      expect(a === b).assertFalse();
    });


    /**
     * @tc.name   ExpressionTest1336
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1336
     * @tc.desc   Test string object comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = new String("test");
      const b = "test";
      expect(a == b).assertTrue();
      expect(a === b).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest1339
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1339
     * @tc.desc   Test function return value in expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const add = (a: number, b: number) => a + b;
      const result = add(2, 3) * 4;
      expect(result).assertEqual(20);
    });


    /**
     * @tc.name   ExpressionTest1340
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1340
     * @tc.desc   Test short-circuit with function calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      const check = () => { flag = true; return true; };
      const result = true || check();
      expect(result).assertTrue();
      expect(flag).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest1341
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1341
     * @tc.desc   Test short-circuit with function calls (AND)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      const check = () => { flag = true; return true; };
      const result = false && check();
      expect(result).assertFalse();
      expect(flag).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest1342
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1342
     * @tc.desc   Test conditional operator with functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const add = (a: number, b: number) => a + b;
      const multiply = (a: number, b: number) => a * b;
      const operation = true ? add : multiply;
      const result = operation(2, 3);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest1343
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1343
     * @tc.desc   Test recursive expression in function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const factorial = (n: number): number => n <= 1 ? 1 : n * factorial(n - 1);
      const result = factorial(5);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.name   ExpressionTest1344
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1344
     * @tc.desc   Test closure with expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const createAdder = (x: number) => (y: number) => x + y;
      const add5 = createAdder(5);
      const result = add5(3);
      expect(result).assertEqual(8);
    });


    /**
     * @tc.name   ExpressionTest1346
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1346
     * @tc.desc   Test nullish coalescing with function result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const getValue = () => null;
      const result = getValue() ?? "default";
      expect(result).assertEqual("default");
    });

    /**
     * @tc.name   ExpressionTest1348
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1348
     * @tc.desc   Test logical assignment in condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let config: ESObject = { log: false };
      if (config.log ||= true) {
        config.message = "logging enabled";
      }
      expect(config.log).assertTrue();
      expect(config.message).assertEqual("logging enabled");
    });


    /**
     * @tc.name   ExpressionTest1350
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1350
     * @tc.desc   Test mixed arithmetic, bitwise and logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = (5 + 3) & 4 && 2 ** 3;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1351
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1351
     * @tc.desc   Test nested conditional operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = 10;
      const result = a > 15 ? "large" : a > 5 ? "medium" : "small";
      expect(result).assertEqual("medium");
    });

    /**
     * @tc.name   ExpressionTest1354
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1354
     * @tc.desc   Test nullish coalescing with template string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const name: undefined = undefined;
      const result = `Hello ${name ?? "Guest"}`;
      expect(result).assertEqual("Hello Guest");
    });

    /**
     * @tc.name   ExpressionTest1355
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1355
     * @tc.desc   Test arithmetic with bigint and comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a = 100n;
      const b = 50n;
      const result = a - b > 30n ? "yes" : "no";
      expect(result).assertEqual("yes");
    });



    /**
     * @tc.name   ExpressionTest1357
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1357
     * @tc.desc   Test array map with arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.map(item => item * 2 + 1);
      expect(result).assertDeepEquals([3, 5, 7]);
    });

    /**
     * @tc.name   ExpressionTest1358
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1358
     * @tc.desc   Test filter with logical expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30, 40];
      const result = arr.filter(item => item > 20 && item % 2 === 0);
      expect(result).assertDeepEquals([30, 40]);
    });

    /**
     * @tc.name   ExpressionTest1359
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1359
     * @tc.desc   Test reduce with accumulator expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const result = arr.reduce((acc, curr) => acc + curr * 2, 0);
      expect(result).assertEqual(20);
    });


    /**
     * @tc.name   ExpressionTest1361
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1361
     * @tc.desc   Test logical assignment with array push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      arr.length === 0 && arr.push(1, 2, 3);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   ExpressionTest1362
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1362
     * @tc.desc   Test bitwise operations in conditional
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num = 6; // 110
      const result = (num & 1) === 0 ? "even" : "odd";
      expect(result).assertEqual("even");
    });

    /**
     * @tc.name   ExpressionTest1363
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1363
     * @tc.desc   Test exponentiation with negative base and even exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = (-4) ** 2;
      expect(result).assertEqual(16);
    });

    /**
     * @tc.name   ExpressionTest1364
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1364
     * @tc.desc   Test comma operator with multiple assignments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = 0, b = 0;
      a += 5
      b *= 2
      a + b;
      expect(a).assertEqual(5);
      expect(b).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1365
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1365
     * @tc.desc   Test template string with arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const x = 3, y = 4;
      const result = `${x} + ${y} = ${x + y}, ${x} * ${y} = ${x * y}`;
      expect(result).assertEqual("3 + 4 = 7, 3 * 4 = 12");
    });


    /**
     * @tc.name   ExpressionTest1367
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1367
     * @tc.desc   Test nullish coalescing with array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      const result = arr.length ?? 5;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1368
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1368
     * @tc.desc   Test logical OR with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface GeneratedObjectLiteralInterface_1 {
        a: number;
        b: number;
      }
      const obj: GeneratedObjectLiteralInterface_1 = { a: 0, b: 10 };
      const result = obj.a || obj.b;
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest1369
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1369
     * @tc.desc   Test logical AND with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface GeneratedObjectLiteralInterface_1 {
        a: number;
        b: number;
      }
      const obj: GeneratedObjectLiteralInterface_1 = { a: 5, b: 10 };
      const result = obj.a && obj.b;
      expect(result).assertEqual(10);
    });


    /**
     * @tc.name   ExpressionTest1370
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1370
     * @tc.desc   Test accessing property of non-object (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "test";
      const result = str.length;
      expect(result).assertEqual(4);
    });


    /**
     * @tc.name   ExpressionTest1377
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1377
     * @tc.desc   Test division by zero (integer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 10 / 0;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1378
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1378
     * @tc.desc   Test division by zero (negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 10 / -0;
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1379
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1379
     * @tc.desc   Test modulus by zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 10 % 0;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1382
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1382
     * @tc.desc   Test function call with wrong parameter type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const func = (a: number) => a * 2;
      const result = func(5);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest1389
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1389
     * @tc.desc   Test array index with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr[-1];
      expect(result).assertEqual(undefined);
    });


    /**
     * @tc.name   ExpressionTest1392
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1392
     * @tc.desc   Test template string with tagged template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const tag = (strings: TemplateStringsArray, x: number) => strings[0] + x * 2;
      const x = 3;
      const result = tag`Value: ${x}`;
      expect(result).assertEqual("Value: 6");
    });

    /**
     * @tc.name   ExpressionTest1395
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1395
     * @tc.desc   Test bitwise assignment operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = 5; // 101
      a |= 3; // 011 → 111 (7)
      expect(a).assertEqual(7);
      a ^= 3; // 011 → 100 (4)
      expect(a).assertEqual(4);
      a &= 1; // 001 → 000 (0)
      expect(a).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1396
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1396
     * @tc.desc   Test shift assignment operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = 8; // 1000
      a <<= 1; // 10000 (16)
      expect(a).assertEqual(16);
      a >>= 2; // 100 (4)
      expect(a).assertEqual(4);
      a >>>= 1; // 10 (2)
      expect(a).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest1397
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1397
     * @tc.desc   Test exponentiation assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = 2;
      a **= 3;
      expect(a).assertEqual(8);
      a**= 0.5;
      expect(a).assertEqual(2.8284271247461903); //
    });

    /**
     * @tc.name   ExpressionTest1398
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1398
     * @tc.desc   Test typeof with complex expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = typeof (5 + 3);
      const result2 = typeof [].length;
      const result3 = typeof (() => {});
      expect(result1).assertEqual("number");
      expect(result2).assertEqual("number");
      expect(result3).assertEqual("function");
    });

    /**
     * @tc.name   ExpressionTest1399
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1399
     * @tc.desc   Test综合场景：运算符嵌套与类型转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface GeneratedObjectLiteralInterface_1 {
        a: number[];
      }
      const obj: GeneratedObjectLiteralInterface_1 = { a: [1, 2, 3] };
      const result = `Total: ${(obj?.a?.reduce((sum, val) => sum + val, 0) || 0) * 2}`;
      expect(result).assertEqual("Total: 12");
    });

  })
}