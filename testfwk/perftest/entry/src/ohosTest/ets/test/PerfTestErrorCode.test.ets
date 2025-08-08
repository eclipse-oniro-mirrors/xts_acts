import { describe, it, expect, TestType, Level, Size, beforeAll } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { PerfMetric, PerfTestStrategy, PerfMeasureResult, PerfTest} from '@ohos.test.PerfTest';
import { Driver, ON } from '@kit.TestKit';
import { BusinessError, Callback } from '@kit.BasicServicesKit';

const TestTag = 'perfTestErrorTest';
const AsyncErrorCode = 32400002;
const ParameterErrorCode = 32400003;
const TimeoutErrorCode = 32400004;
const CollectErrorCode = 32400005;
const ObtainErrorCode = 32400006;
const NotSupportErrorCode = 32400007;

function sleep(nm: number) {
  return new Promise<void>((resolve: Function, reject: Function) => {
    setTimeout(resolve, nm);
  })
}


export default function perfTestErrorTest() {
  describe('perfTestErrorTest', () => {
    beforeAll(async () => {
    //  await sleep(200);
    })

    /*
     * @tc.number: perfTestErrorTest_001
     * @tc.name: test_PerfTest_create_32400003
     * @tc.desc: create 32400003 test.
     */
    it('test_PerfTest_create_32400003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_PerfTest_create_32400003 start`);
      console.info(`test_PerfTest_create_32400003 caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        PerfTest.create(null);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_create_32400003 strategy =null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        PerfTest.create(undefined);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_create_32400003 strategy =undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: (finish: Callback<boolean>) => {
            finish(true)
          },
          iterations: -1,
          resetCode: (finish: Callback<boolean>) => {
            finish(true)
          },
          timeout: 30000,
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_create_32400003 strategy.iterations = -1 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: (finish: Callback<boolean>) => {
            finish(true)
          },
          iterations: 5,
          resetCode: (finish: Callback<boolean>) => {
            finish(true)
          },
          timeout: -10,
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_create_32400003 strategy.timeout = -10 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_create_32400003 end`);
    })

    /*
     * @tc.number: perfTestErrorTest_002
     * @tc.name: test_PerfTest_create_32400007
     * @tc.desc: create 32400007 test.
     */
    it('test_PerfTest_create_32400007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_PerfTest_create_32400007 start`);
      console.info(`test_PerfTest_create_32400007 caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: (finish: Callback<boolean>) => {
            finish(true)
          },
          resetCode: (finish: Callback<boolean>) => {
            finish(true)
          },
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
        perfTest.run();
        await sleep(300);
        perfTest = PerfTest.create(perfTestStrategy);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_create_32400007 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(NotSupportErrorCode);
      }
      await sleep(3000);
      console.log(`${TestTag}, test_PerfTest_create_32400007 end`);
    })

    /*
     * @tc.number: perfTestErrorTest_003
     * @tc.name: test_PerfTest_run_32400007
     * @tc.desc: create 32400007 test.
     */
    it('test_PerfTest_run_32400007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_PerfTest_run_32400007 start`);
      console.info(`test_PerfTest_run_32400007 caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: (finish: Callback<boolean>) => {
            finish(true)
          },
          resetCode: (finish: Callback<boolean>) => {
            finish(true)
          },
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
        perfTest.run();
        await sleep(300);
        await perfTest.run();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_run_32400007 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(NotSupportErrorCode);
      }
      await sleep(3000);
      console.log(`${TestTag}, test_PerfTest_run_32400007 end`);
    })

    /*
     * @tc.number: perfTestErrorTest_004
     * @tc.name: test_PerfTest_run_32400005_bundleName
     * @tc.desc: run 32400005 test.
     */
    it('test_PerfTest_run_32400005_bundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`test_PerfTest_run_32400005_bundleName start`);
      console.info(`test_PerfTest_run_32400005_bundleName caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400005_bundleName actionCode called`);
            finish(true)
          },
          iterations: 1,
          resetCode: (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400005_bundleName resetCode called`);
            finish(true)
          },
          timeout: 30000,
          bundleName: "com.example.test0011"
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
        await perfTest.run();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_run_32400005_bundleName bundleName error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(CollectErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_run_32400005_bundleName end`);
    })

    /*
     * @tc.number: perfTestErrorTest_005
     * @tc.name: test_PerfTest_run_32400004_actionCode
     * @tc.desc: run 32400004 test.
     */
    it('test_PerfTest_run_32400004_actionCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`test_PerfTest_run_32400004_actionCode start`);
      console.info(`test_PerfTest_run_32400004_actionCode caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_actionCode actionCode called not finish`);
            //  finish(true)
          },
          iterations: 1,
          resetCode: (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_actionCode resetCode called 1`);
            finish(true)
          },
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
        await perfTest.run();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_run_32400004_actionCode actionCode not finish error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(TimeoutErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_run_32400004_actionCode end`);
    })

    /*
     * @tc.number: perfTestErrorTest_006
     * @tc.name: test_PerfTest_run_32400004_resetCode
     * @tc.desc: run 32400004 test.
     */
    it('test_PerfTest_run_32400004_resetCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`test_PerfTest_run_32400004_resetCode start`);
      console.info(`test_PerfTest_run_32400004_resetCode caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_resetCode actionCode called not finish`);
            finish(true)
          },
          iterations: 1,
          resetCode: (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_resetCode resetCode called 1`);
          //  finish(true)
          },
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
        await perfTest.run();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_run_32400004_resetCode actionCode not finish error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(TimeoutErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_run_32400004_resetCode end`);
    })

    /*
     * @tc.number: perfTestErrorTest_007
     * @tc.name: test_PerfTest_run_32400004_actionCodeError
     * @tc.desc: run 32400004 test.
     */
    it('test_PerfTest_run_32400004_actionCodeError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`test_PerfTest_run_32400004_actionCodeError start`);
      console.info(`test_PerfTest_run_32400004_actionCodeError caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeError actionCode called throw error`);
            throw new Error('throw error test');
            finish(true)
          },
          iterations: 1,
          resetCode: (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeError resetCode called 2`);
            finish(true)
          },
          timeout: 30000,
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
        await perfTest.run();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeError error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(TimeoutErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeError end`);
    })

    /*
     * @tc.number: perfTestErrorTest_008
     * @tc.name: test_PerfTest_run_32400004_resetCodeError
     * @tc.desc: run 32400004 test.
     */
    it('test_PerfTest_run_32400004_resetCodeError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`test_PerfTest_run_32400004_resetCodeError start`);
      console.info(`test_PerfTest_run_32400004_resetCodeError caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)

      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeError actionCode called 1`);
            finish(true)
          },
          iterations: 1,
          resetCode: (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeError resetCode called thorw error`);
            throw new Error('resetCode throw error test');
            finish(true)
          },
          timeout: 30000,
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
        await perfTest.run();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeError resetCode throw error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(TimeoutErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_run_32400002_resetCodeError end`);
    })

    /*
     * @tc.number: perfTestErrorTest_009
     * @tc.name: test_PerfTest_run_32400004_actionCodeTimeOut
     * @tc.desc: run 32400004 test.
     */
    it('test_PerfTest_run_32400004_actionCodeTimeOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`test_PerfTest_run_32400004_actionCodeTimeOut start`);
      console.info(`test_PerfTest_run_32400004_actionCodeTimeOut caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeTimeOut actionCode start`);
            await sleep(8000);
            console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeTimeOut actionCode end`);
            finish(true)
          },
          iterations: 1,
          resetCode: (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeTimeOut resetCode called 2`);
            finish(true)
          },
          timeout: 5000,
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
        await perfTest.run();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeTimeOut actionCode timeOut is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(TimeoutErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_run_32400004_actionCodeTimeOut end`);
    })

    /*
     * @tc.number: perfTestErrorTest_010
     * @tc.name: test_PerfTest_run_32400004_resetCodeTimeOut
     * @tc.desc: run 32400004 test.
     */
    it('test_PerfTest_run_32400004_resetCodeTimeOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`test_PerfTest_run_32400004_resetCodeTimeOut start`);
      console.info(`test_PerfTest_run_32400004_resetCodeTimeOut caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeTimeOut actionCode called 3`);
            finish(true)
          },
          iterations: 1,
          resetCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeTimeOut resetCode start `);
            await sleep(8000);
            console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeTimeOut resetCode end`);
            finish(true)
          },
          timeout: 5000,
        }
        let perfTest: PerfTest= PerfTest.create(perfTestStrategy)
        await perfTest.run();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeTimeOut resetCode timeOut is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(TimeoutErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_run_32400004_resetCodeTimeOut end`);
    })

    /*
     * @tc.number: perfTestErrorTest_011
     * @tc.name: test_PerfTest_run_32400002_afterDestroy
     * @tc.desc: run 32400002 test.
     */
    it('test_PerfTest_run_32400002_afterDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`test_PerfTest_run_32400002_afterDestroy start`);
      console.info(`test_PerfTest_run_32400002_afterDestroy caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400002_afterDestroy actionCode called 3`);
            finish(true)
          },
          iterations: 1,
          resetCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_run_32400002_afterDestroy resetCode called 3`);
            finish(true)
          },
          timeout: 5000,
        }
        let perfTest: PerfTest= PerfTest.create(perfTestStrategy);
        perfTest.destroy();
        await sleep(2000);
        await perfTest.run();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_run_32400002_afterDestroy after destroy error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_run_32400002_afterDestroy end`);
    })

    /*
     * @tc.number: perfTestErrorTest_012
     * @tc.name: test_PerfTest_getMeasureResult_32400007
     * @tc.desc: getMeasureResult 32400007 test.
     */
    it('test_PerfTest_getMeasureResult_32400007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400007 start`);
      console.info(`test_PerfTest_getMeasureResult_32400007 caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: (finish: Callback<boolean>) => {
            finish(true)
          },
          resetCode: (finish: Callback<boolean>) => {
            finish(true)
          },
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
        perfTest.run();
        await sleep(300);
        perfTest.getMeasureResult(PerfMetric.DURATION);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400007 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(NotSupportErrorCode);
      }
      await sleep(3000);
      console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400007 end`);
    })

    /*
     * @tc.number: perfTestErrorTest_013
     * @tc.name: test_PerfTest_getMeasureResult_32400006_noRun
     * @tc.desc: getMeasureResult 32400006 test.
     */
    it('test_PerfTest_getMeasureResult_32400006_noRun', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {0
      console.log(`test_PerfTest_getMeasureResult_32400006_noRun start`);
      console.info(`test_PerfTest_getMeasureResult_32400006_noRun caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400006_noRun actionCode called 3`);
            finish(true)
          },
          iterations: 1,
          resetCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400006_noRun resetCode called 3`);
            finish(true)
          },
          timeout: 5000,
        }
        let perfTest: PerfTest= PerfTest.create(perfTestStrategy);
        await sleep(2000);
        perfTest.getMeasureResult(PerfMetric.DURATION);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400006_noRun error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ObtainErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400006_noRun end`);
    })

    /*
     * @tc.number: perfTestErrorTest_014
     * @tc.name: test_PerfTest_getMeasureResult_32400003
     * @tc.desc: getMeasureResult 32400003 test.
     */
    it('test_PerfTest_getMeasureResult_32400003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400003 start`);
      console.info(`test_PerfTest_getMeasureResult_32400003 caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400003 actionCode called 3`);
            finish(true)
          },
          iterations: 1,
          resetCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400003 resetCode called 3`);
            finish(true)
          },
          timeout: 5000,
        }
        let perfTest: PerfTest= PerfTest.create(perfTestStrategy);
        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400003 0000`);
        await perfTest.run();
        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400003 1111`);
        await sleep(1000);
        perfTest.getMeasureResult(null);
        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400003 2222`);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400003 metric=null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400003 actionCode called 3`);
            finish(true)
          },
          iterations: 1,
          resetCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400003 resetCode called 3`);
            finish(true)
          },
          timeout: 5000,
        }
        let perfTest: PerfTest= PerfTest.create(perfTestStrategy);
        await perfTest.run();
        await sleep(1000);
        perfTest.getMeasureResult(undefined);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400003 metric=undefined error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400003 end`);
    })

    /*
     * @tc.number: perfTestErrorTest_015
     * @tc.name: test_PerfTest_getMeasureResult_32400002
     * @tc.desc: getMeasureResult 32400002 test.
     */
    it('test_PerfTest_getMeasureResult_32400002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400002 start`);
      console.info(`test_PerfTest_getMeasureResult_32400002 caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400002 actionCode called 3`);
            finish(true)
          },
          iterations: 1,
          resetCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400002 resetCode called 3`);
            finish(true)
          },
          timeout: 5000,
        }
        let perfTest: PerfTest= PerfTest.create(perfTestStrategy);
        await perfTest.run();
        await sleep(1000);
        perfTest.destroy();
        await sleep(1000);
        perfTest.getMeasureResult(PerfMetric.DURATION);
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400002 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_getMeasureResult_32400002 end`);
    })

    /*
     * @tc.number: perfTestErrorTest_016
     * @tc.name: test_PerfTest_destroy_32400007
     * @tc.desc: destroy 32400007 test.
     */
    it('test_PerfTest_destroy_32400007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_PerfTest_destroy_32400007 start`);
      console.info(`test_PerfTest_destroy_32400007 caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: (finish: Callback<boolean>) => {
            finish(true)
          },
          resetCode: (finish: Callback<boolean>) => {
            finish(true)
          },
        }
        let perfTest: PerfTest = PerfTest.create(perfTestStrategy);
        perfTest.run();
        await sleep(300);
        perfTest.destroy();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_destroy_32400007 error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(NotSupportErrorCode);
      }
      await sleep(3000);
      console.log(`${TestTag}, test_PerfTest_destroy_32400007 end`);
    })

    /*
     * @tc.number: perfTestErrorTest_017
     * @tc.name: test_PerfTest_destroy_32400002
     * @tc.desc: destroy 32400002 test.
     */
    it('test_PerfTest_destroy_32400002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_PerfTest_destroy_32400002 start`);
      console.info(`test_PerfTest_destroy_32400002 caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      try {
        let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
        let perfTestStrategy: PerfTestStrategy = {
          metrics: metrics,
          actionCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_destroy_32400002 actionCode called 3`);
            finish(true)
          },
          iterations: 1,
          resetCode: async (finish: Callback<boolean>) => {
            console.log(`${TestTag}, test_PerfTest_destroy_32400002 resetCode called 3`);
            finish(true)
          },
          timeout: 5000,
        }
        let perfTest: PerfTest= PerfTest.create(perfTestStrategy);
        await perfTest.run();
        await sleep(1000);
        perfTest.destroy();
        await sleep(1000);
        perfTest.destroy();
        expect().assertFail();
      }catch (e) {
        console.log(`${TestTag}, test_PerfTest_destroy_32400002 metric=null error is: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(AsyncErrorCode);
      }
      console.log(`${TestTag}, test_PerfTest_destroy_32400002 end`);
    })
  })
}