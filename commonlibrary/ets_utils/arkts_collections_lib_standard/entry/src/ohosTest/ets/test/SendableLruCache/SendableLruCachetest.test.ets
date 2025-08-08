import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { ArkTSUtils } from '@kit.ArkTS'

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function sendableLruCachetest() {
  describe('sendableLruCachetest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(200);
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
     * @tc.number    : SUB_SENDABLELRUCACHE_CONCAtARRRY_0100
     * @tc.name      : SendableLruCachetestConcatArray0100
     * @tc.desc      : constructor 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SendableLruCachetestConcatArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'SendableLruCachetestConcatArray0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let cache = new ArkTSUtils.SendableLruCache<number, number>(0);
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(401);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })


    /**
     * @tc.number    : SUB_SENDABLELRUCACHE_CONCAtARRRY_0200
     * @tc.name      : SendableLruCachetestConcatArray0200
     * @tc.desc      : updateCapacity 401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SendableLruCachetestConcatArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'SendableLruCachetestConcatArray0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let cache = new ArkTSUtils.SendableLruCache<number, number>(10);
        const unboundUpdate = cache.updateCapacity;
        const boundUpdate: () => void = unboundUpdate.bind(cache, -5);
        try {
          boundUpdate();
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(401);
          flag = true;
        }
        expect(flag).assertTrue();
        console.info(`${caseName} test end`);
        done();
      })
  })
}