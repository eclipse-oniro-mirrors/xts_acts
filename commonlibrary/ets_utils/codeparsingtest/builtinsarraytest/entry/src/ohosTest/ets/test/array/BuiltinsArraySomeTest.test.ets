import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "@ohos/hypium";
import { sleep } from "../../testability/pages/Utils";


export default function BuiltinsArraySomeTest() {
  describe('BuiltinsArraySomeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);;
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
     * @tc.name   BuiltinsArraySomeTest0100
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0100
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArraySomeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const even = (num: number) => num > 3;
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0200
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0200
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const even = (num: number) => {
        return num > 3 && num > 2;
      };
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0300
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0300
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const even = (num: number) => {
        const threshold = null;
        const actualThreshold = threshold !== null ? threshold : 0;
        return num > 3 && num > actualThreshold;
      };
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })

    /**
     * @tc.name   BuiltinsArraySomeTest0400
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0400
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const even = (num: number) => num === 3
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0500
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0500
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = []
      const even = (num: number) => num > 0
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertFalse()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0600
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0600
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [5]
      const even = (num: number) => num > 3
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0700
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0700
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [2]
      const even = (num: number) => num > 3
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertFalse()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0800
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0800
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: [Record<string, never>, [], () => void] = [
        {},
        [],
        () => {
        }
      ];
      const even = (element: Record<string, never> | [] | (() => void)): boolean => {
        return typeof element === 'function';
      };
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest0900
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0900
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const even = (num: number) => num > 10
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertFalse()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest1000
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1000
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number> = [1, 2, 3, 4, 5]
      const even = (num: number) => num === 3
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest1100
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1100
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
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
      const even = (element: obj | number | obj1 | obj2): boolean => {
        if (typeof element === 'object' && element !== null) {
          return (element as obj).a === 1;
        }
        return false;
      };
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest1200
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1200
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number[]> = [[1, 2], [3, 4], [5, 6]]
      const even = (e: number[]) => e.includes(4)
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })


    /**
     * @tc.name   BuiltinsArraySomeTest1300
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1300
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<number | undefined | null> = [1, null, 3, undefined, 4]
      const even = (e: number | undefined | null) => e === null
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })

    /**
     * @tc.name   BuiltinsArraySomeTest1400
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1400
     * @tc.desc   test Some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArraySomeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const inputArray: Array<string> = ['apple', '', 'banana', 'cherry']
      const even = (e: string) => e === ''
      const res = inputArray.some(even)
      console.log("res:" + JSON.stringify(res))
      expect(res).assertTrue()
      Done()
    })
  })
}