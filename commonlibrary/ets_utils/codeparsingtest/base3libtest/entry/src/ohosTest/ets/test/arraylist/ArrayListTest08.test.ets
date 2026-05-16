import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ArrayList08Test() {
  describe('ArrayList08Test', () => {
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
     * @tc.number    SUB_ARRAYLIST_REMOVEBYRANGE03_2600
     * @tc.name      testArraylist03RemoveSingleElement0026
     * @tc.desc      removeByRange with toIndex = fromIndex + 1 should remove exactly one element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03RemoveSingleElement0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03RemoveSingleElement0026';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(9);
        list.add(8);
        list.add(7);

        list.removeByRange(1, 2);
        expect(list.length).assertEqual(2);
        expect(list[0]).assertEqual(9);
        expect(list[1]).assertEqual(7);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REMOVEBYRANGE03_2700
     * @tc.name      testArraylist03LargeListRemoval0027
     * @tc.desc      removeByRange should correctly handle large list range removal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03LargeListRemoval0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03LargeListRemoval0027';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        for (let i = 0; i < 100; i++) {
          list.add(i);
        }

        list.removeByRange(10, 90);
        expect(list.length).assertEqual(20);
        expect(list[0]).assertEqual(0);
        expect(list[9]).assertEqual(9);
        expect(list[10]).assertEqual(90);
        expect(list[19]).assertEqual(99);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REMOVEBYRANGE03_2800
     * @tc.name      testArraylist03RemoveThenInvalidCall0028
     * @tc.desc      After valid removal, invalid range should still trigger correct error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist03RemoveThenInvalidCall0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist03RemoveThenInvalidCall0028';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);

        list.removeByRange(0, 1);
        expect(list.length).assertEqual(2);

        let hasError = false;
        try {
          list.removeByRange(2, 3);
        } catch (e) {
          hasError = true;
          expect(e.code).assertEqual(10200001);
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_0100
     * @tc.name      testArraylist01NumberNormal0001
     * @tc.desc      Verify replaceAllElements works correctly with number elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01NumberNormal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01NumberNormal0001';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.replaceAllElements((value: number, index?: number): number => {
          return value + (index ?? 0);
        });
        expect(list.length).assertEqual(3);
        expect(list[0]).assertEqual(1);
        expect(list[1]).assertEqual(3);
        expect(list[2]).assertEqual(5);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_0200
     * @tc.name      testArraylist01CallbackUndefined0002
     * @tc.desc      Verify BusinessError 401 when callbackFn is undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01CallbackUndefined0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01CallbackUndefined0002';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        try {
          list.replaceAllElements(undefined);
          expect(false).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          expect(err.code).assertEqual(401);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_0300
     * @tc.name      testArraylist01CallbackNotFunction0003
     * @tc.desc      Verify BusinessError 401 when callbackFn is not a function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01CallbackNotFunction0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {

        const TAG = 'testArraylist01CallbackNotFunction0003';
        console.log(TAG + ' start');

        const list = new ArrayList<number>();
        list.add(1);

        const invalidCallback: (value: number) => number =
          (new Object()) as (value: number) => number;

        try {
          list.replaceAllElements(invalidCallback);
          expect(false).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          expect(err.code).assertEqual(401);
        }

        console.log(TAG + ' done');

      }
    );

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_0400
     * @tc.name      testArraylist01ThisBindingLost0004
     * @tc.desc      Verify BusinessError 10200011 when replaceAllElements is illegally bound
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01ThisBindingLost0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01ThisBindingLost0004';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        const fn = list.replaceAllElements;
        try {
          fn((v: number): number => v);
          expect(false).assertTrue();
        } catch (e) {
          const err = e as BusinessError;
          expect(err.code).assertEqual(10200011);
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_0500
     * @tc.name      testArraylist01StringElements0005
     * @tc.desc      Verify replaceAllElements works with string elements including special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01StringElements0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01StringElements0005';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        list.add('Hello');
        list.add('👆');
        list.add('\n');
        list.replaceAllElements((value: string): string => {
          return value + '_ok';
        });
        expect(list[0]).assertEqual('Hello_ok');
        expect(list[1]).assertEqual('👆_ok');
        expect(list[2]).assertEqual('\n_ok');
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_0600
     * @tc.name      testArraylist01BooleanReturn0006
     * @tc.desc      Verify replaceAllElements supports boolean element replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01BooleanReturn0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01BooleanReturn0006';
        console.log(TAG + ' start');
        const list = new ArrayList<boolean>();
        list.add(true);
        list.add(false);
        list.replaceAllElements((value: boolean): boolean => {
          return !value;
        });
        expect(list[0]).assertFalse();
        expect(list[1]).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_0700
     * @tc.name      testArraylist01ObjectReplace0007
     * @tc.desc      Verify replaceAllElements supports object element replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01ObjectReplace0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01ObjectReplace0007';
        console.log(TAG + ' start');

        interface T {
          a: number
        }

        const list = new ArrayList<T>();
        list.add({ a: 1 });
        list.replaceAllElements((value: T): T => {
          return { a: value.a + 1 };
        });
        expect(list[0].a).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_0800
     * @tc.name      testArraylist01TypedArrayValue0008
     * @tc.desc      Verify replaceAllElements works when elements are TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01TypedArrayValue0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01TypedArrayValue0008';
        console.log(TAG + ' start');
        const list = new ArrayList<Uint8Array>();
        list.add(new Uint8Array([72, 101]));
        list.replaceAllElements((value: Uint8Array): Uint8Array => {
          return new Uint8Array([value[0] + 1]);
        });
        expect(list[0][0]).assertEqual(73);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_0900
     * @tc.name      testArraylist01IndexParam0009
     * @tc.desc      Verify index parameter is correctly passed to callbackFn
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01IndexParam0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01IndexParam0009';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(10);
        list.add(10);
        list.replaceAllElements((value: number, index?: number): number => {
          return value + (index ?? 0);
        });
        expect(list[0]).assertEqual(10);
        expect(list[1]).assertEqual(11);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_1000
     * @tc.name      testArraylist01ArrlistParam0010
     * @tc.desc      Verify arrlist parameter refers to the current ArrayList instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01ArrlistParam0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01ArrlistParam0010';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.replaceAllElements(
          (value: number, index?: number, arrlist?: ArrayList<number>): number => {
            expect(arrlist === list).assertTrue();
            return value;
          }
        );
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');
      });


    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_1100
     * @tc.name      testArraylist01EmptyList0011
     * @tc.desc      Verify replaceAllElements works on empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01EmptyList0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01EmptyList0011';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.replaceAllElements((value: number): number => {
          return value + 1;
        });
        expect(list.length).assertEqual(0);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_1200
     * @tc.name      testArraylist01CallbackReturnsSameValue0012
     * @tc.desc      Verify replaceAllElements allows callbackFn to return the same element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01CallbackReturnsSameValue0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01CallbackReturnsSameValue0012';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(7);
        list.replaceAllElements((value: number): number => {
          return value;
        });
        expect(list[0]).assertEqual(7);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_1300
     * @tc.name      testArraylist01CallbackThrowsError0013
     * @tc.desc      Verify error thrown inside callbackFn is propagated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01CallbackThrowsError0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01CallbackThrowsError0013';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        let hasError = false;
        try {
          list.replaceAllElements((value: number): number => {
            throw new Error('callback error');
          });
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
        console.log(TAG + ' done');
      });


    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_1400
     * @tc.name      testArraylist01CallbackIndexParam0014
     * @tc.desc      Verify callback receives correct index parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01CallbackIndexParam0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01CallbackIndexParam0014';
        console.log(TAG + ' start');

        const list = new ArrayList<number>();
        list.add(10);
        list.add(20);
        list.add(30);

        list.replaceAllElements((value: number, index?: number): number => {
          return value + (index ?? 0);
        });

        expect(list[0]).assertEqual(10);
        expect(list[1]).assertEqual(21);
        expect(list[2]).assertEqual(32);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_1500
     * @tc.name      testArraylist01CallbackArrListParam0015
     * @tc.desc      Verify callback receives current ArrayList instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01CallbackArrListParam0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01CallbackArrListParam0015';
        console.log(TAG + ' start');

        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);

        list.replaceAllElements(
          (value: number, index?: number, arr?: ArrayList<number>): number => {
            expect(arr === list).assertTrue();
            expect(index !== undefined).assertTrue();
            return value;
          }
        );

        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_1600
     * @tc.name      testArraylist01EmptyList0016
     * @tc.desc      Verify replaceAllElements on empty list does not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01EmptyList0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01EmptyList0016';
        console.log(TAG + ' start');

        const list = new ArrayList<number>();
        list.replaceAllElements((v: number): number => v + 1);

        expect(list.length).assertEqual(0);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_1700
     * @tc.name      testArraylist01ReturnSameReference0017
     * @tc.desc      Verify callback returning same object reference works correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01ReturnSameReference0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01ReturnSameReference0017';
        console.log(TAG + ' start');

        interface Obj { x: number }

        const obj: Obj = { x: 1 };

        const list = new ArrayList<Obj>();
        list.add(obj);

        list.replaceAllElements((value: Obj): Obj => value);

        expect(list[0] === obj).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_1800
     * @tc.name      testArraylist01ReturnNewReference0018
     * @tc.desc      Verify callback returning new object replaces original reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01ReturnNewReference0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01ReturnNewReference0018';
        console.log(TAG + ' start');

        interface Obj { x: number }

        const list = new ArrayList<Obj>();
        list.add({ x: 1 });

        const original = list[0];

        list.replaceAllElements((value: Obj): Obj => {
          return { x: value.x + 1 };
        });

        expect(list[0].x).assertEqual(2);
        expect(list[0] === original).assertFalse();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_1900
     * @tc.name      testArraylist01CallbackThrows0019
     * @tc.desc      Verify exception thrown inside callback is propagated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01CallbackThrows0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01CallbackThrows0019';
        console.log(TAG + ' start');

        const list = new ArrayList<number>();
        list.add(1);

        let hasError = false;
        try {
          list.replaceAllElements((): number => {
            throw new Error('callback error');
          });
        } catch (e) {
          hasError = true;
        }

        expect(hasError).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_REPLACEALLELEMENTS01_2000
     * @tc.name      testArraylist01ModifyListInsideCallback0020
     * @tc.desc      Verify modifying ArrayList inside callback does not crash
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArraylist01ModifyListInsideCallback0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArraylist01ModifyListInsideCallback0020';
        console.log(TAG + ' start');

        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);

        list.replaceAllElements((value: number, index?: number): number => {
          if (index === 0) {
            list.add(99);
          }
          return value;
        });

        expect(list.length >= 2).assertTrue();
        console.log(TAG + ' done');
      });


  })
}