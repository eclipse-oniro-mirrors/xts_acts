import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
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
    it('testHiCollieC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testHiCollieC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testHiCollieC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testHiCollieC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testHiCollieC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testHiCollieC006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = testNapi.testJankCerr401();
      expect(result).assertEqual(401);
      done();
    });
   
    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_SDK_0140
     * @tc.name       : testHiCollieC007
     * @tc.desc       : test OH_HiCollie_SetTimer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        testNapi.TestHiCollieTimerNdkErr03();
        done();
      } catch (err) {
        console.info("====> TestHiCollieTimerNdkErr03: " + JSON.stringify(err));
        expect(err).assertEqual(29800003);
        done();
      }
    });

    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_SDK_0130
     * @tc.name       : testHiCollieC008
     * @tc.desc       : test OH_HiCollie_SetTimer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        testNapi.TestHiCollieTimerNdkErr04();
        done();
      } catch (err) {
        console.info("====> TestHiCollieTimerNdkErr04: " + JSON.stringify(err));
        expect(err).assertEqual(29800004);
        done();
      }
    });

    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_SDK_0160
     * @tc.name       : testHiCollieC009
     * @tc.desc       : test OH_HiCollie_SetTimer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        testNapi.TestHiCollieTimerNdkErr05();
        done();
      } catch (err) {
        console.info("====> TestHiCollieTimerNdkErr05: " + JSON.stringify(err));
        expect(err).assertEqual(29800005);
        done();
      }
    });

    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_SDK_0150
     * @tc.name       : testHiCollieC010
     * @tc.desc       : test OH_HiCollie_SetTimer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        testNapi.TestHiCollieTimerNdkErr06();
        done();
      } catch (err) {
        console.info("====> TestHiCollieTimerNdkErr06: " + JSON.stringify(err));
        expect(err).assertEqual(29800006);
        done();
      }
    });

    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_SDK_0120
     * @tc.name       : testHiCollieC011
     * @tc.desc       : test OH_HiCollie_SetTimer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const sum = testNapi.TestHiCollieTimerNdkSetSuc()
        console.info("====> TestHiCollieTimerNdkSetSuc:" + JSON.stringify(sum));
        expect(sum == 0).assertEqual(true)
        done();
      } catch (err) {
        console.info("====> TestHiCollieTimerNdkSetSuc: " + JSON.stringify(err));
        expect(true).assertEqual(false)
        done();
      }
    });

    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_SDK_0170
     * @tc.name       : testHiCollieC012
     * @tc.desc       : test OH_HiCollie_SetTimer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const sum = testNapi.TestHiCollieTimerNdkCanSuc()
        console.info("====> TestHiCollieTimerNdkCanSuc:" + JSON.stringify(sum));
        expect(sum == 0).assertEqual(true)
        done();
      } catch (err) {
        console.info("====> TestHiCollieTimerNdkCanSuc: " + JSON.stringify(err));
        expect(true).assertEqual(false)
        done();
      }
    });

    /**
     * @tc.number     : SUB_DFX_DFR_Hicollie_StuckDetectionWithTimeout_0220
     * @tc.name       : testHiCollieC013
     * @tc.desc       : test OH_HiCollie_Init_StuckDetectionWithTimeout
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHiCollieC013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let result:number = testNapi.testHiCollieStuckWithTimeoutNdk();
        expect(result).assertEqual(29800001);
        done();
    });
	
    /**
      * @tc.number     : SUB_DFX_DFR_Hicollie_StuckDetectionWithTimeout_0210
      * @tc.name       : testHiCollieC014
      * @tc.desc       : test OH_HiCollie_Init_StuckDetectionWithTimeout
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
    */
    it('testHiCollieC014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let result:number = testNapi.testHiCollieStuckWithTimeoutNdk2();
        expect(result).assertEqual(401);
        done();
    });
	
    /**
      * @tc.number     : SUB_DFX_DFR_Hicollie_StuckDetectionWithTimeout_0200
      * @tc.name       : testHiCollieC015
      * @tc.desc       : test OH_HiCollie_Init_StuckDetectionWithTimeout
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
    */
    it('testHiCollieC015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let result:number = testNapi.testHiCollieStuckWithTimeoutNdk1();
        expect(result).assertEqual(0);
        done();
      });
  })
}