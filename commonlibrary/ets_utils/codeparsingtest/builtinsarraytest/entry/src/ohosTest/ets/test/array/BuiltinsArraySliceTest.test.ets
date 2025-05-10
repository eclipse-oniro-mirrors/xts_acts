import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "@ohos/hypium";
import { hilog } from "@kit.PerformanceAnalysisKit";
import { isArrayArrayEqual, isArrayEqual, isObjectEqual } from "../../testability/pages/Util";
import { sleep } from "../../testability/pages/Utils";


export default function BuiltinsArraySliceTest() {
  describe('BuiltinsArraySliceTest', () => {
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
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_0100
     * @tc.name BuiltinsArraySliceTest0100
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('BuiltinsArraySliceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const res: Array<number> = inputArray.slice(1, 3)
      console.log("res:" + JSON.stringify(res))
      expect(isArrayEqual(res, [2, 3])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_0200
     * @tc.name BuiltinsArraySliceTest0200
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('BuiltinsArraySliceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const res = inputArray.slice(2)
      console.log("res: " + res)
      expect(isArrayEqual(res, [3, 4, 5])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_0300
     * @tc.name BuiltinsArraySliceTest0300
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const res = inputArray.slice(-3, -1)
      console.log("res: " + res)
      expect(isArrayEqual(res, [3, 4])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_0400
     * @tc.name BuiltinsArraySliceTest0400
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number | undefined> = [1, , 3]
      const res = inputArray.slice(0, 2)
      console.log("res: " + res)
      expect(isArrayEqual(res, [1, undefined])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_0500
     * @tc.name BuiltinsArraySliceTest0500
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3]
      const res = inputArray.slice(5, 10)
      console.log("res: " + res)
      expect(isArrayEqual(res, [])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_0600
     * @tc.name BuiltinsArraySliceTest0600
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3]
      const res = inputArray.slice(2, 2)
      console.log("res: " + res)
      expect(isArrayEqual(res, [])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_0700
     * @tc.name BuiltinsArraySliceTest0700
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const res = inputArray.slice(3, 1)
      console.log("res: " + res)
      expect(isArrayEqual(res, [])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_0800
     * @tc.name BuiltinsArraySliceTest0800
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const res = inputArray.slice(undefined)
      console.log("res: " + res)
      expect(isArrayEqual(res, [1, 2, 3, 4, 5])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_0900
     * @tc.name BuiltinsArraySliceTest0900
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const res = inputArray.slice(1, undefined)
      console.log("res: " + res)
      expect(isArrayEqual(res, [2, 3, 4, 5])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_1000
     * @tc.name BuiltinsArraySliceTest1000
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const res = inputArray.slice(NaN)
      console.log("res: " + res)
      expect(isArrayEqual(res, [1, 2, 3, 4, 5])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_1100
     * @tc.name BuiltinsArraySliceTest1100
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<string> = ['a', 'b', 'c', 'd']
      const res = inputArray.slice(2)
      console.log("res: " + res)
      expect(isArrayEqual(res, ['c', 'd'])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_1200
     * @tc.name BuiltinsArraySliceTest1200
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      interface obj {
        a: number
      }

      interface obj1 {
        b: number
      }

      interface obj2 {
        c: number
      }

      const inputArray: Array<obj | number | obj1 | obj2> = [{
        a: 1
      }, {
        b: 2
      }, {
        c: 3
      }]
      const res = inputArray.slice(0, 2)
      console.log("res: " + res)
      expect(isObjectEqual(res, [{
        a: 1
      }, {
        b: 2
      }])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_1300
     * @tc.name BuiltinsArraySliceTest1300
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number[]> = [[1, 2], [3, 4], [5, 6]]
      const res = inputArray.slice(1, 3)
      console.log("res: " + res)
      expect(isArrayArrayEqual(res, [[3, 4], [5, 6]])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_1400
     * @tc.name BuiltinsArraySliceTest1400
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(Math.floor(1.5))
      console.log("res:" + res)
      expect(isArrayEqual(res, [2, 3, 4, 5, 6])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_1500
     * @tc.name BuiltinsArraySliceTest1500
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(-0)
      console.log("res:" + res)
      expect(isArrayEqual(res, [1, 2, 3, 4, 5, 6])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_1600
     * @tc.name BuiltinsArraySliceTest1600
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(Number.EPSILON)
      console.log("res:" + res)
      expect(isArrayEqual(res, [1, 2, 3, 4, 5, 6])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_1700
     * @tc.name BuiltinsArraySliceTest1700
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(Number.MIN_VALUE)
      console.log("res:" + res)
      expect(isArrayEqual(res, [1, 2, 3, 4, 5, 6])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_1800
     * @tc.name BuiltinsArraySliceTest1800
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(Number.MAX_VALUE)
      console.log("res:" + res)
      expect(isArrayEqual(res, [])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_1900
     * @tc.name BuiltinsArraySliceTest1900
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(-Infinity)
      console.log("res:" + res)
      expect(isArrayEqual(res, [1, 2, 3, 4, 5, 6])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_2000
     * @tc.name BuiltinsArraySliceTest2000
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(Infinity)
      console.log("res:" + res)
      expect(isArrayEqual(res, [])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_2100
     * @tc.name BuiltinsArraySliceTest2100
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(123.456)
      console.log("res:" + res)
      expect(isArrayEqual(res, [])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_2200
     * @tc.name BuiltinsArraySliceTest2200
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(0xcafebabe)
      console.log("res:" + res)
      expect(isArrayEqual(res, [])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_2300
     * @tc.name BuiltinsArraySliceTest2300
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(0x0102)
      console.log("res:" + res)
      expect(isArrayEqual(res, [])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_2400
     * @tc.name BuiltinsArraySliceTest2400
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(0x01020304)
      console.log("res:" + res)
      expect(isArrayEqual(res, [])).assertTrue()
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_SLICE_TEST_2500
     * @tc.name BuiltinsArraySliceTest2500
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsArraySliceTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let inputArray: Array<number> = [1, 2, 3, 4, 5, 6]
      const res = inputArray.slice(0x3)
      console.log("res:" + res)
      expect(isArrayEqual(res, [4, 5, 6])).assertTrue()
      Done()
    })
  })
}