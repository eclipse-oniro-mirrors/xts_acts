import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number     : SUB_DFX_DFR_Hicollie_Subthread_C_0100
     * @tc.name       : testHiCollieC001
     * @tc.desc       : test OH_HiCollieStuckC
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC001', 0, async (done: Function) => {
      let result:number = testNapi.testHiCollieStuckC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_Subthread_C_0200
     * @tc.name       : testHiCollieC002
     * @tc.desc       : test OH_HiCollieStuckC
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC002', 0, async (done: Function) => {
      let result:number = testNapi.testHiCollieJankC();
      done();
    });

    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_Subthread_C_0300
     * @tc.name       : testHiCollieC003
     * @tc.desc       : test OH_HiCollieStuckC
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC003', 0, async (done: Function) => {
      let result:number = testNapi.testJankCMThread();
      expect(result).assertEqual(29800001);
      done();
    });

    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_Subthread_C_0400
     * @tc.name       : testHiCollieC004
     * @tc.desc       : test OH_HiCollieStuckC
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC004', 0, async (done: Function) => {
      let result:number = testNapi.testStuckCMThread();
      expect(result).assertEqual(29800001);
      done();
    });

    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_Subthread_C_0500
     * @tc.name       : testHiCollieC005
     * @tc.desc       : test OH_HiCollieStuckC
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC005', 0, async (done: Function) => {
      let result:number = testNapi.testReportCMThread();
      expect(result).assertEqual(29800001);
      done();
    });

    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_Subthread_C_0600
     * @tc.name       : testHiCollieC006
     * @tc.desc       : test OH_HiCollieStuckC
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC006', 0, async (done: Function) => {
      let result:number = testNapi.testJankCerr401();
      expect(result).assertEqual(401);
      done();
    });

  })
}