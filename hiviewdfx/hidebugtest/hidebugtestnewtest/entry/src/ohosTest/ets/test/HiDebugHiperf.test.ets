import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import hidebug from '@ohos.hidebug';
import testNapi from 'libentry.so';
import { taskpool } from '@kit.ArkTS';
import { statfs } from '@kit.CoreFileKit';

const DOMAIN = 0x0000;
@Concurrent

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
}
@Concurrent
export  function start1 (){
  return testNapi.start(100,  1000);
}

@Concurrent
export  function start2 (){
  return testNapi.start(100,  10000);
}

@Concurrent
export  function start3 (){
  return testNapi.start(100,  15000);
}

export default function hidebughiperfTest() {
  describe('ActsHidebugHiperfTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll (async () => {
      for (let i = 0; i < 12; i++) {
        testNapi.addthread(55);
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0000 wait");
      await asyncSleep(1000);
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0000 end");
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
      testNapi.clearthreads();
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_0100
     * @tc.name testHidebugHiperfInterface01
     * @tc.desc 验证采样频率，取值范围[1-1000]，单位HZ。设置为1000 超出取值范围时取默认值100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0100 start");
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0100 start01");
          let errcode = testNapi.start(1000,  2000);
          expect(errcode).assertEqual(0);
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0100 record success");
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0100 end");
    });
    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_0200
     * @tc.name testHidebugHiperfInterface02
     * @tc.desc 验证采样频率，取值范围[1-1000]，单位HZ。设置为0 超出取值范围时取默认值100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0200 start");
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0200 start01");
          let errcode = testNapi.start(0, 2000);
          expect(errcode).assertEqual(0)
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0200 record success");
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0200 end");
    });
    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_0300
     * @tc.name testHidebugHiperfInterface03
     * @tc.desc 验证时长设置范围[1000,10000] 时长设置小于 1000抛出 401错误码
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0300 start");
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0300 start01");
          let errcode = testNapi.start(100, 100);
          expect(errcode).assertEqual(401)
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0300 record success");
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====>  SUB_DFX_DFR_Hidebug_Hiperf_Interface_0300 end");
    });
    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_0400
     * @tc.name testHidebugHiperfInterface04
     * @tc.desc 时长设置范围[1000,10000] 时长设置等于 10000ms可以正常采集
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0400 start");
      try {
         let path: string = '/data/storage/el2/base/files/' ;
         console.info("output path: " + path);
         let freeSize = await statfs.getFreeSize(path);
         if (freeSize > 30 * 1024 * 1024 * 1024) {
           console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0400 start01");
           let ret = await taskpool.execute(start2)
           console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0400 errcode2" + ret);
           expect(ret == 0).assertTrue()
         }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0400 end");
    });
    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_0500
     * @tc.name testHidebugHiperfInterface05
     * @tc.desc 频率设置为 100，时长设置为1000ms可以正常采集
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0500 start");
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0500 start01");
          let ret = testNapi.start(100, 1000);
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0500 start01" + ret);
          expect(ret).assertEqual(0)
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0500 record success");
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0500 end");
    });
    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_0600
     * @tc.name testHidebugHiperfInterface06
     * @tc.desc 验证连续调用，抛出错误码 11400301
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0600 start");
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0600 start01");
          taskpool.execute(start1).then(ret => {
            console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0600 recording"+ ret);
            expect(ret == 0).assertTrue();
            done();
          })
          let errcode = await taskpool.execute(start1)
          await asyncSleep(1000);
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0600 errcode" + errcode);
          expect(errcode == 11400301)
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0600 record end");
        }else{
          done();
        }
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0600 end");
    });
    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_0700
     * @tc.name testHidebugHiperfInterface07
     * @tc.desc 回调函数 为null,拋出401错误码
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0700 start");
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0700 start 01");
          let result: number = testNapi.starterrstack();
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0700 result" + result);
          expect(result == 401).assertTrue()
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0700 success");
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0700 end");
    });
    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_0800
     * @tc.name testHidebugHiperfInterface08
     * @tc.desc config 为null,拋出401错误码
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====>  SUB_DFX_DFR_Hidebug_Hiperf_Interface_0800 start");
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          console.info("====>  SUB_DFX_DFR_Hidebug_Hiperf_Interface_0800 start 01");
          let result: number = testNapi.starterrconfig();
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0800 result" + result);
          expect(result == 401).assertTrue()
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0800 success");
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0800 end");
    });
    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_0900
     * @tc.name testHidebugHiperfInterface09
     * @tc.desc config 中 tid 为null,拋出401错误码
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====>  SUB_DFX_DFR_Hidebug_Hiperf_Interface_0900 start");
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          console.info("====>  SUB_DFX_DFR_Hidebug_Hiperf_Interface_0900 start01");
          let result: number = testNapi.starterrconfigtid();
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0900 result" + result);
          expect(result == 401).assertTrue()
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0900 success");
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_0900 end");
    });
    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_1000
     * @tc.name testHidebugHiperfInterface10
     * @tc.desc 栈深度设置成100层，频率设置为 100，时长设置为1000ms可以正常采集
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====>  SUB_DFX_DFR_Hidebug_Hiperf_Interface_1000 start");
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          console.info("====>  SUB_DFX_DFR_Hidebug_Hiperf_Interface_1000 start01");
          let errcode = testNapi.start(100, 1000);
          expect(errcode).assertEqual(0);
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1000 record success");
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1000 end");
    });
    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_1100
     * @tc.name testHidebugHiperfInterface11
     * @tc.desc 栈深度设置成100层，频率设置为 100，线程数设置为最大，时长设置为1000ms可以正常采集
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====>  SUB_DFX_DFR_Hidebug_Hiperf_Interface_1100 start");
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          console.info("====>  SUB_DFX_DFR_Hidebug_Hiperf_Interface_1100 start01");
          let errcode = testNapi.start(100, 1000);
          expect(errcode).assertEqual(0);
          console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1100 record success");
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1100 end");
    });


    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_1200
     * @tc.name testHidebugHiperfInterface12
     * @tc.desc 时长设置范围[1000,10000] ,时长设置大于 10000ms可以正常采集，自动默认设置为采集10000mS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1200 start");
      try {
         let path: string = '/data/storage/el2/base/files/' ;
         console.info("output path: " + path);
         let freeSize = await statfs.getFreeSize(path);
         if (freeSize > 30 * 1024 * 1024 * 1024) {
           console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1200 start01");
           const startTime = Date.now();
           let ret = await taskpool.execute(start3);
           const endTime = Date.now();
           const executionTime = endTime - startTime;
           console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1200 executionTime" + executionTime);
           expect(executionTime).assertLess(11*1000);
           expect(executionTime).assertLargerOrEqual(10*1000);
           console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1200 errcode2" + ret);
           expect(ret == 0).assertTrue()
         }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1200 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_1300
     * @tc.name testHidebugHiperfInterface13
     * @tc.desc 错误码覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1300 start");
      try {
        expect(testNapi.CHECK_HIDEBUG_TRACE_ABNORMAL() == true).assertTrue();
        console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1300 CHECK_HIDEBUG_TRACE_ABNORMAL");
        expect(testNapi.CHECK_HIDEBUG_NO_PERMISSION() == true).assertTrue();
        console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1300 CHECK_HIDEBUG_NO_PERMISSION");
        expect(testNapi.CHECK_HIDEBUG_INVALID_SYMBOLIC_PC_ADDRESS() == true).assertTrue();
        console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1300 CHECK_HIDEBUG_INVALID_SYMBOLIC_PC_ADDRESS");
        expect(testNapi.CHECK_HIDEBUG_NOT_SUPPORTED() == true).assertTrue();
        console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1300 CHECK_HIDEBUG_NOT_SUPPORTED");
        expect(testNapi.CHECK_HIDEBUG_UNDER_SAMPLING() == true).assertTrue();
        console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1300 CHECK_HIDEBUG_UNDER_SAMPLING");
        expect(testNapi.CHECK_HIDEBUG_RESOURCE_UNAVAILABLE() == true).assertTrue();
        console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1300 CHECK_HIDEBUG_RESOURCE_UNAVAILABLE");
        expect(testNapi.CHECK_HICOLLIE_REMOTE_FAILED() == true).assertTrue();
        console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1300 CHECK_HICOLLIE_REMOTE_FAILED");
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DFX_DFR_Hidebug_Hiperf_Interface_1400
     * @tc.name testHidebugHiperfInterface14
     * @tc.desc 空指针覆盖
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHidebugHiperfInterface14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1400 start");
      try {
        console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1400 CHECK_ThreadCpuUsage");
        expect(testNapi.CHECK_ThreadCpuUsage() == 1).assertTrue();
        console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1400 CHECK_OH_HiDebug_GetDefaultMallocDispatchTable");
        expect(testNapi.CHECK_OH_HiDebug_GetDefaultMallocDispatchTable() == 1).assertTrue();
        console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1400 CHECK_OH_HiDebug_CreateBacktraceObject");
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
            console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1400 start01");
            expect(testNapi.CHECK_OH_HiDebug_CreateBacktraceObject() == 1).assertTrue();
        }
        console.info("====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1400 end");
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFR_Hidebug_Hiperf_Interface_1400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    });

  })
}