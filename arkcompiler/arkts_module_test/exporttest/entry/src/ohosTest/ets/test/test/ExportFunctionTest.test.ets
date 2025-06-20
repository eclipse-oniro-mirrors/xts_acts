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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { hilog } from "@kit.PerformanceAnalysisKit";
import multiply from "../utils/UtilsDefaultType";
import add from "../utils/UtilsDefaultObject1";
import subtractFun from "../utils/UtilsDefaultObject2";
import { divideFunc } from "../utils/UtilsType";
import { add1 } from "../utils/UtilsObject1";
import { subtractFun1 } from "../utils/UtilsObject2";
import { subtractFun2 as minus } from "../utils/UtilsObject3";
import { addFunction, divideFunction, multiplyFunction, subtractFunction } from "../utils/UtilsObject5";
import * as mathFunc from "../utils/UtilsObject4"
import { sleep } from "../utils/Utils";

export default function ExportFunctionTest() {
  describe('ExportFunctionTest', () => {
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
     * @tc.number SUB_EXPORT_FUNCTION_TEST_0100
     * @tc.name ExportFunctionTest0100
     * @tc.desc test export function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ExportFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (Done: Function) => {
      let product = multiply(3, 4);
      expect(12).assertEqual(product);
      Done();
    })
    /**
     * @tc.number SUB_EXPORT_FUNCTION_TEST_0200
     * @tc.name ExportFunctionTest0200
     * @tc.desc test export function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      let result = add(5, 4);
      expect(9).assertEqual(result);
      Done();
    })
    /**
     * @tc.number SUB_EXPORT_FUNCTION_TEST_0300
     * @tc.name ExportFunctionTest0300
     * @tc.desc test export function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      let result = subtractFun(10, 4);
      expect(6).assertEqual(result);
      Done();
    })
    /**
     * @tc.number SUB_EXPORT_FUNCTION_TEST_0400
     * @tc.name ExportFunctionTest0400
     * @tc.desc test export function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      let result = divideFunc(10, 5);
      expect(2).assertEqual(result);
      Done();
    })
    /**
     * @tc.number SUB_EXPORT_FUNCTION_TEST_0500
     * @tc.name ExportFunctionTest0500
     * @tc.desc test export function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      let result = add1(10, 5);
      expect(15).assertEqual(result);
      Done();
    })
    /**
     * @tc.number SUB_EXPORT_FUNCTION_TEST_0600
     * @tc.name ExportFunctionTest0600
     * @tc.desc test export function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      let result = subtractFun1(10, 5);
      expect(5).assertEqual(result);
      Done();
    })
    /**
     * @tc.number SUB_EXPORT_FUNCTION_TEST_0700
     * @tc.name ExportFunctionTest0700
     * @tc.desc test export function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportFunctionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      let result = minus(20, 5);
      expect(15).assertEqual(result);
      Done();
    })
    /**
     * @tc.number SUB_EXPORT_FUNCTION_TEST_0800
     * @tc.name ExportFunctionTest0800
     * @tc.desc test export function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportFunctionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      let result1 = addFunction(10, 2);
      let result2 = subtractFunction(10, 2);
      let result3 = multiplyFunction(10, 2);
      let result4 = divideFunction(10, 2);
      expect(12).assertEqual(result1);
      expect(8).assertEqual(result2);
      expect(20).assertEqual(result3);
      expect(5).assertEqual(result4);
      Done();
    })
    /**
     * @tc.number SUB_EXPORT_FUNCTION_TEST_0900
     * @tc.name ExportFunctionTest0900
     * @tc.desc test export function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportFunctionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      let result1 = mathFunc.addFunction(10, 2);
      let result2 = mathFunc.subtractFunction(10, 2);
      let result3 = mathFunc.multiplyFunction(10, 2);
      let result4 = mathFunc.divideFunction(10, 2);
      expect(12).assertEqual(result1);
      expect(8).assertEqual(result2);
      expect(20).assertEqual(result3);
      expect(5).assertEqual(result4);
      Done();
    })
  })
}