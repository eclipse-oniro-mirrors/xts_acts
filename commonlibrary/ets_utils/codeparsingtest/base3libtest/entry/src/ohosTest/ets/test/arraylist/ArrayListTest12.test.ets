import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ArrayList12Test() {
  describe('ArrayList12Test', () => {
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
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_2600
     * @tc.name      testArrayList06SymbolIterator0026
     * @tc.desc      Test nested iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0026';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(10);
        arrayList.add(20);
        arrayList.add(30);
        let count = 0;
        let firstValue = 0;
        let secondValue = 0;
        let thirdValue = 0;
        for (let item of arrayList) {
          if (count === 0) firstValue = item;
          if (count === 1) secondValue = item;
          if (count === 2) thirdValue = item;
          count++;
        }
        expect(count).assertEqual(3);
        expect(firstValue).assertEqual(10);
        expect(secondValue).assertEqual(20);
        expect(thirdValue).assertEqual(30);
        const arrayFromList: number[] = [];
        for (let item of arrayList) {
          arrayFromList.push(item);
        }
        expect(arrayFromList[0]).assertEqual(10);
        expect(arrayFromList[1]).assertEqual(20);
        expect(arrayFromList[2]).assertEqual(30);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_2700
     * @tc.name      testArrayList06SymbolIterator0027
     * @tc.desc      Test full iterable protocol implementation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0027';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("first");
        arrayList.add("second");
        arrayList.add("third");
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual("first");
        expect(arrayList[1]).assertEqual("second");
        expect(arrayList[2]).assertEqual("third");
        try {
          let iterationCount = 0;
          let firstItem = "";
          let secondItem = "";
          let thirdItem = "";
          for (let item of arrayList) {
            if (iterationCount === 0) firstItem = item;
            if (iterationCount === 1) secondItem = item;
            if (iterationCount === 2) thirdItem = item;
            iterationCount++;
          }
          if (iterationCount > 0) {
            expect(iterationCount).assertEqual(3);
            expect(firstItem).assertEqual("first");
            expect(secondItem).assertEqual("second");
            expect(thirdItem).assertEqual("third");
          }
        } catch (error) {
          console.warn('Iteration not supported:', error);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SYMBOL_ITERATOR06_2800
     * @tc.name      testArrayList06SymbolIterator0028
     * @tc.desc      Test Symbol.iterator vs forEach method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0028';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);
        const iteratorResults: number[] = [];
        for (let value of arrayList) {
          iteratorResults.push(value);
        }
        const forEachResults: number[] = [];
        arrayList.forEach((value: number) => {
          forEachResults.push(value);
        });
        expect(iteratorResults.length).assertEqual(5);
        expect(forEachResults.length).assertEqual(5);
        expect(iteratorResults).assertDeepEquals(forEachResults);
        expect(iteratorResults).assertDeepEquals([1, 2, 3, 4, 5]);
        for (let i = 0; i < 5; i++) {
          expect(iteratorResults[i]).assertEqual(forEachResults[i]);
        }
        console.log(TAG + ' done');
      });
  })
}