import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import testNapi from 'libentry.so';
import { bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { FaultLogger } from '@kit.PerformanceAnalysisKit';

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
}
let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;

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
     * @tc.name   testFaultlogExtension_0100
     * @tc.number SUB_DFX_DFR_FaultlogExtension_C_0100
     * @tc.desc   test testFaultlogExtension_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFaultlogExtension_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testFaultlogExtension_0100  start");
      try {
        let found = false;
        const bundleinfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        const hapModulesInfo = bundleinfo.hapModulesInfo;
        const extensionAbilitiesInfo = hapModulesInfo.flatMap(abilityInfo => abilityInfo.extensionAbilitiesInfo || []);
        console.log('====> testFaultlogExtension_0100 extensionAbilitiesInfo:', extensionAbilitiesInfo);
        const extensionAbilityTypes = extensionAbilitiesInfo.map(extensionAbility => extensionAbility.extensionAbilityType);
        console.log('====> testFaultlogExtension_0100 extensionAbilityTypes:', extensionAbilityTypes);
        extensionAbilitiesInfo.forEach((extensionAbility, index) => {
          console.log(`====> testFaultlogExtension_0100 Extension index ${index + 1}:`);
          console.log(`====> testFaultlogExtension_0100  Extension index type: ${extensionAbility.extensionAbilityType}`);
          if (extensionAbility.extensionAbilityType === bundleManager.ExtensionAbilityType.FAULT_LOG) {
            found = true;
          }
        });
        expect(found).assertTrue();
        console.info("====> testFaultlogExtension_0100 assert end");
        let result = testNapi.add(2, 3)
        console.info("====> testFaultlogExtension_0100 napi result: " + result);
        await asyncSleep(30000);
        console.info("====> testFaultlogExtension_0100  wait end");
        done();
      } catch (err) {
        console.info("====> testFaultlogExtension_0100  catch error: " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testfaultloggerQuery_0100
     * @tc.number testfaultloggerQuery_0100
     * @tc.desc   test testfaultloggerQuery_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testfaultloggerQuery_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('testfaultloggerQuery_0100 start');
      const callback = queryFaultLogCallback;
      try {
        // 使用变量传递回调函数
        await FaultLogger.query(FaultLogger.FaultType.JS_CRASH).then(
          list =>{
            console.info("=====",JSON.stringify(list))
            expect(list.length==0).assertTrue();
          }
        )
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
      }
    })

    /**
     * @tc.name   testfaultloggerQuery_0200
     * @tc.number testfaultloggerQuery_0200
     * @tc.desc   test testfaultloggerQuery_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testfaultloggerQuery_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('testfaultloggerQuery_0200 start');
      testNapi.add(2,3);
      const callback = queryFaultLogCallback;
      try {
        await asyncSleep(2000)
        // 使用变量传递回调函数
        await FaultLogger.query(FaultLogger.FaultType.CPP_CRASH).then(
          list =>{
            console.info("=====",JSON.stringify(list))
            expect(list.length>0).assertTrue();
          }
        )
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
      }
    })

    /**
     * @tc.name   testfaultloggerQuery_0300
     * @tc.number testfaultloggerQuery_0300
     * @tc.desc   test testfaultloggerQuery_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testfaultloggerQuery_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('testfaultloggerQuery_0300 start');
      testNapi.add(2,3);
      const callback = queryFaultLogCallback;
      try {
        await asyncSleep(2000)
        // 使用变量传递回调函数
        FaultLogger.query(FaultLogger.FaultType.CPP_CRASH,(error: BusinessError, list: Array<FaultLogger.FaultLogInfo>) => {
          if (error) {
            console.error(`error code:${error.code}, error msg:${error.message}`);
          } else {
            console.info("value length is ", JSON.stringify(list));
          }
          expect(list.length>0).assertTrue()
        })
        await asyncSleep(2000)
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
      }
    })

    /**
     * @tc.name   testfaultloggerQuery_0400
     * @tc.number testfaultloggerQuery_0400
     * @tc.desc   test testfaultloggerQuery_04300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testfaultloggerQuery_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('testfaultloggerQuery_0400 start');
      testNapi.add(2,3);
      const callback = queryFaultLogCallback;
      try {
        await asyncSleep(2000)
        // 使用变量传递回调函数
        FaultLogger.query(FaultLogger.FaultType.JS_CRASH,(error: BusinessError, list: Array<FaultLogger.FaultLogInfo>) => {
          if (error) {
            console.error(`error code:${error.code}, error msg:${error.message}`);
          } else {
            console.info("value length is ", JSON.stringify(list));
          }
          expect(list.length==0).assertTrue()
        })
        await asyncSleep(2000)
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
      }
    })

    /**
     * @tc.name   testquerySelfFaultLog_0100
     * @tc.number testquerySelfFaultLog_0100
     * @tc.desc   test testquerySelfFaultLog_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testquerySelfFaultLog_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('testquerySelfFaultLog_0100 start');
      const callback = queryFaultLogCallback;
      try {
        // 使用变量传递回调函数
        await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.JS_CRASH).then(
          list =>{
            console.info("=====",JSON.stringify(list))
            expect(list.length==0).assertTrue();
          }
        )
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
      }
    })

    /**
     * @tc.name   testquerySelfFaultLog_0200
     * @tc.number testquerySelfFaultLog_0200
     * @tc.desc   test testquerySelfFaultLog_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testquerySelfFaultLog_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('testquerySelfFaultLog_0200 start');
      testNapi.add(2,3);
      const callback = queryFaultLogCallback;
      try {
        await asyncSleep(2000)
        // 使用变量传递回调函数
        await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.CPP_CRASH).then(
          list =>{
            console.info("=====",JSON.stringify(list))
            expect(list.length>0).assertTrue();
          }
        )
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
      }
    })

    /**
     * @tc.name   testquerySelfFaultLog_0300
     * @tc.number testquerySelfFaultLog_0300
     * @tc.desc   test testquerySelfFaultLog_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testquerySelfFaultLog_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('testquerySelfFaultLog_0300 start');
      testNapi.add(2,3);
      const callback = queryFaultLogCallback;
      try {
        await asyncSleep(2000)
        // 使用变量传递回调函数
        FaultLogger.querySelfFaultLog(FaultLogger.FaultType.CPP_CRASH,(error: BusinessError, list: Array<FaultLogger.FaultLogInfo>) => {
          if (error) {
            console.error(`error code:${error.code}, error msg:${error.message}`);
          } else {
            console.info("value length is ", JSON.stringify(list));
          }
          expect(list.length>0).assertTrue()
        })
        await asyncSleep(2000)
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
      }
    })

    /**
     * @tc.name   testquerySelfFaultLog_0400
     * @tc.number testquerySelfFaultLog_0400
     * @tc.desc   test testquerySelfFaultLog_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testquerySelfFaultLog_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('testquerySelfFaultLog_0400 start');
      testNapi.add(2,3);
      const callback = queryFaultLogCallback;
      try {
        await asyncSleep(2000)
        // 使用变量传递回调函数
        FaultLogger.querySelfFaultLog(FaultLogger.FaultType.JS_CRASH,(error: BusinessError, list: Array<FaultLogger.FaultLogInfo>) => {
          if (error) {
            console.error(`error code:${error.code}, error msg:${error.message}`);
          } else {
            console.info("value length is ", JSON.stringify(list));
          }
          expect(list.length==0).assertTrue()
        })
        await asyncSleep(2000)
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
      }
    })
  })
}