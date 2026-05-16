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
     * @tc.name   testHiCollieC001
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_C_0100
     * @tc.desc   test OH_HiCollieStuckC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = testNapi.testHiCollieStuckC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testHiCollieC002
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_C_0200
     * @tc.desc   test OH_HiCollieStuckC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = testNapi.testHiCollieJankC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testHiCollieC003
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_C_0300
     * @tc.desc   test OH_HiCollieStuckC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = testNapi.testJankCMThread();
      expect(result).assertEqual(29800001);
      done();
    });

    /**
     * @tc.name   testHiCollieC004
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_C_0400
     * @tc.desc   test OH_HiCollieStuckC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = testNapi.testStuckCMThread();
      expect(result).assertEqual(29800001);
      done();
    });

    /**
     * @tc.name   testHiCollieC005
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_C_0500
     * @tc.desc   test OH_HiCollieStuckC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = testNapi.testReportCMThread();
      expect(result).assertEqual(29800001);
      done();
    });

    /**
     * @tc.name   testHiCollieC006
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_C_0600
     * @tc.desc   test OH_HiCollieStuckC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieC006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = testNapi.testJankCerr401();
      expect(result).assertEqual(401);
      done();
    });
   
    /**
     * @tc.name   testHiCollieC007
     * @tc.number SUB_DFX_DFR_Hicollie_SDK_0140
     * @tc.desc   test OH_HiCollie_SetTimer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testHiCollieC008
     * @tc.number SUB_DFX_DFR_Hicollie_SDK_0130
     * @tc.desc   test OH_HiCollie_SetTimer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testHiCollieC009
     * @tc.number SUB_DFX_DFR_Hicollie_SDK_0160
     * @tc.desc   test OH_HiCollie_SetTimer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testHiCollieC010
     * @tc.number SUB_DFX_DFR_Hicollie_SDK_0150
     * @tc.desc   test OH_HiCollie_SetTimer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testHiCollieC011
     * @tc.number SUB_DFX_DFR_Hicollie_SDK_0120
     * @tc.desc   test OH_HiCollie_SetTimer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testHiCollieC012
     * @tc.number SUB_DFX_DFR_Hicollie_SDK_0170
     * @tc.desc   test OH_HiCollie_SetTimer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testHiCollieC013
     * @tc.number SUB_DFX_DFR_Hicollie_StuckDetectionWithTimeout_0220
     * @tc.desc   test OH_HiCollie_Init_StuckDetectionWithTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieC013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let result:number = testNapi.testHiCollieStuckWithTimeoutNdk();
        expect(result).assertEqual(29800001);
        done();
    });
	
    /**
     * @tc.name   testHiCollieC014
     * @tc.number SUB_DFX_DFR_Hicollie_StuckDetectionWithTimeout_0210
     * @tc.desc   test OH_HiCollie_Init_StuckDetectionWithTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieC014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let result:number = testNapi.testHiCollieStuckWithTimeoutNdk2();
        expect(result).assertEqual(401);
        done();
    });
	
    /**
     * @tc.name   testHiCollieC015
     * @tc.number SUB_DFX_DFR_Hicollie_StuckDetectionWithTimeout_0200
     * @tc.desc   test OH_HiCollie_Init_StuckDetectionWithTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieC015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let result:number = testNapi.testHiCollieStuckWithTimeoutNdk1();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testHicollieSubthreadCode0100
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_Code_0100
     * @tc.desc   testHicollieSubthreadCode0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHicollieSubthreadCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = testNapi.OH_HiCollie_Report_sucess();
        expect(code).assertEqual(0);
        done();
      } catch (err) {
        console.error(`====> testHicollieSubthreadCode0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(true).assertEqual(false);
        done();
      }
    })

    /**
     * @tc.name   testHicollieSubthreadCode0200
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_Code_0200
     * @tc.desc   testHicollieSubthreadCode0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHicollieSubthreadCode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = testNapi.OH_HiCollie_Report_Main();
        console.error(`====> testHicollieSubthreadCode0200 > code: ${code}`)
        expect(code).assertEqual(29800001);
        done();
      } catch (err) {
        console.error(`====> testHicollieSubthreadCode0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(true).assertEqual(false);
        done();
      }
    })

    /**
     * @tc.name   testHicollieSubthreadCode0300
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_Code_0300
     * @tc.desc   testHicollieSubthreadCode0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHicollieSubthreadCode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = testNapi.OH_HiCollie_Report_Remote();
        console.error(`====> testHicollieSubthreadCode0300 > code: ${code}`)
        expect(code).assertEqual(true);
        done();
      } catch (err) {
        console.error(`====> testHicollieSubthreadCode0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(true).assertEqual(false);
        done();
      }
    })

    /**
     * @tc.name   testHicollieSubthreadCode0400
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_Code_0400
     * @tc.desc   testHicollieSubthreadCode0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHicollieSubthreadCode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = testNapi.OH_HiCollie_ReportInputBlock_Main();
        console.error(`====> testHicollieSubthreadCode0400 > code: ${code}`)
        expect(code).assertEqual(0);
        done();
      } catch (err) {
        console.error(`====> testHicollieSubthreadCode0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(true).assertEqual(false);
        done();
      }
    })
 
    /**
     * @tc.name   testHicollieSubthreadCode0500
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_Code_0500
     * @tc.desc   testHicollieSubthreadCode0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHicollieSubthreadCode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = testNapi.OH_HiCollie_ReportInputBlock_Remote();
        console.error(`====> testHicollieSubthreadCode0500 > code: ${code}`)
        expect(code).assertEqual(true);
        done();
      } catch (err) {
        console.error(`====> testHicollieSubthreadCode0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(true).assertEqual(false);
        done();
      }
    })

    /**
     * @tc.name   testHicollieSubthreadCode0600
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_Code_0600
     * @tc.desc   testHicollieSubthreadCode0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHicollieSubthreadCode0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = testNapi.TestHiCollieSetFreezeCallback();
        expect(code == 0).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHicollieSubthreadCode0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHicollieSubthreadCode0700
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_Code_0700
     * @tc.desc   testHicollieSubthreadCode0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHicollieSubthreadCode0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = testNapi.TestHiCollieAssociateProcessReport();
        expect(code == 0).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHicollieSubthreadCode0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })
    
  })
}