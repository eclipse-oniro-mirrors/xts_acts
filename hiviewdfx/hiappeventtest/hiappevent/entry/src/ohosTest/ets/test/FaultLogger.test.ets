import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { FaultLogger } from '@kit.PerformanceAnalysisKit';


function queryFaultLogCallback(error: BusinessError, value: Array<FaultLogger.FaultLogInfo>) {
  if (error) {
    console.error(`error code:${error.code}, error msg:${error.message}`);
  } else {
    console.info("value length is " + value.length);
    let len: number = value.length;
    for (let i = 0; i < len; i++) {
      console.info(`log: ${i}`);
      console.info(`Log pid: ${value[i].pid}`);
      console.info(`Log uid: ${value[i].uid}`);
      console.info(`Log type: ${value[i].type}`);
      console.info(`Log timestamp: ${value[i].timestamp}`);
      console.info(`Log reason: ${value[i].reason}`);
      console.info(`Log module: ${value[i].module}`);
      console.info(`Log summary: ${value[i].summary}`);
      console.info(`Log text: ${value[i].fullLog}`);
    }
  }
}

export default function FaultLoggerTest() {
  describe('FaultLoggerTest', () => {
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
     * @tc.name   testFaultLogger_0001
     * @tc.number SUB_DFX_DFR_FaultLogger_Ets_0001
     * @tc.desc   验证abytrace.querySelfFaultLog(),第1个参数输入枚举值:['NO_SPECIFIC', 'APP_FREEZE'];
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testFaultLogger_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testFaultLogger_0001 start");
      try{
        FaultLogger.querySelfFaultLog(FaultLogger.FaultType.NO_SPECIFIC, queryFaultLogCallback);
        console.info("====> testFaultLogger_0001 querySelfFaultLog NO_SPECIFIC end 01");
        FaultLogger.querySelfFaultLog(FaultLogger.FaultType.APP_FREEZE, queryFaultLogCallback);
        console.info("====> testFaultLogger_0001 querySelfFaultLog NO_SPECIFIC end 02");
        done();
      }catch(err){
        console.error(`====>testFaultLogger_0001 querySelfFaultLog NO_SPECIFIC catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("testFaultLogger_0001 end");
    })
    /**
     * @tc.name   testFaultLogger_0002
     * @tc.number SUB_DFX_DFR_FaultLogger_Ets_0002
     * @tc.desc   验证abytrace.querySelfFaultLog(FaultLogger.FaultType.NO_SPECIFIC, queryFaultLogCallback),第1个参数分别输入枚举值:['NO_SPECIFIC', 'APP_FREEZE'];
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testFaultLogger_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testFaultLogger_0002 start");
      try{
        FaultLogger.query(FaultLogger.FaultType.NO_SPECIFIC, queryFaultLogCallback);
        console.info("====> testFaultLogger_0002 querySelfFaultLog NO_SPECIFIC end 01");
        FaultLogger.query(FaultLogger.FaultType.APP_FREEZE, queryFaultLogCallback);
        console.info("====> testFaultLogger_0002 querySelfFaultLog NO_SPECIFIC end 02");
        done();
      }catch(err){
        console.error(`====>testFaultLogger_0002 querySelfFaultLog NO_SPECIFIC catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("testFaultLogger_0002 end");
    })
    /**
     * @tc.name   testFaultLogger_0003
     * @tc.number SUB_DFX_DFR_FaultLogger_Ets_0003
     * @tc.desc   验证abytrace.querySelfFaultLog(FaultLogger.FaultType.NO_SPECIFIC),第1个参数输入枚举值:['NO_SPECIFIC', 'APP_FREEZE'];
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testFaultLogger_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testFaultLogger_0003 start");
      try{
        FaultLogger.query(FaultLogger.FaultType.NO_SPECIFIC);
        console.info("====> testFaultLogger_0003 querySelfFaultLog NO_SPECIFIC end 01");
        FaultLogger.query(FaultLogger.FaultType.APP_FREEZE);
        console.info("====> testFaultLogger_0003 querySelfFaultLog NO_SPECIFIC end 02");
        done();
      }catch(err){
        console.error(`====>testFaultLogger_0003 querySelfFaultLog NO_SPECIFIC catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("testFaultLogger_0003 end");
    })

  })
}