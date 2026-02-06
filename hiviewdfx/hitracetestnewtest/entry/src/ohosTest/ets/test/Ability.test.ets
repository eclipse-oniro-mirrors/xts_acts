import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import hiTraceMeter from '@ohos.hiTraceMeter';
import testNapi from 'libentry.so';

export default function HiTraceNewTest() {
  describe('HiTraceNewTest', () => {
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
     * @tc.name   testHitraceInterface01
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_0100
     * @tc.desc   验证registerTraceListener和unregisterTraceListener接口正常调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHitraceInterface01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_0100 start");
      try {
        let callback: hiTraceMeter.TraceEventListener = (traceStatus: boolean) => {
          if (traceStatus) {
            console.info("SUB_DFX_DFR_Hitrace_Interface_0100 " + traceStatus);
          } else {
            console.info("SUB_DFX_DFR_Hitrace_Interface_0100 " + traceStatus);
          }
        };
        let regRet = hiTraceMeter.registerTraceListener(callback);
        console.info("SUB_DFX_DFR_Hitrace_Interface_0100 regRet: " + regRet);
        expect(regRet == 0).assertTrue();
        let unregRet = hiTraceMeter.unregisterTraceListener(regRet);
        console.info("SUB_DFX_DFR_Hitrace_Interface_0100 unregRet: " + unregRet);
        expect(unregRet == 0).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_0100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_0100 end");
    })

    /**
     * @tc.name   testHitraceInterface02
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_0200
     * @tc.desc   验证registerTraceListener接口传入null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHitraceInterface02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_0200 start");
      try {
        let regRet = hiTraceMeter.registerTraceListener(null);
        console.info("SUB_DFX_DFR_Hitrace_Interface_0200 regRet: " + regRet);
        expect(regRet == -2).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_0200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_0200 end");
    })

    /**
     * @tc.name   testHitraceInterface03
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_0300
     * @tc.desc   验证registerTraceListener接口传入undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHitraceInterface03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_0300 start");
      try {
        let regRet = hiTraceMeter.registerTraceListener(undefined);
        console.info("SUB_DFX_DFR_Hitrace_Interface_0300 regRet: " + regRet);
        expect(regRet == -2).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_0300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_0300 end");
    })

    /**
     * @tc.name   testHitraceInterface04
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_0400
     * @tc.desc   验证registerTraceListener接口连续调用11次，unregisterTraceListener接口连续调用10次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHitraceInterface04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_0400 start");
      try {
        let callback: hiTraceMeter.TraceEventListener = (traceStatus: boolean) => {
          if (traceStatus) {
            console.info("SUB_DFX_DFR_Hitrace_Interface_0400 " + traceStatus);
          } else {
            console.info("SUB_DFX_DFR_Hitrace_Interface_0400 " + traceStatus);
          }
        };
        for (let i = 0; i < 10; i++) {
          let regRet = hiTraceMeter.registerTraceListener(callback);
          console.info("SUB_DFX_DFR_Hitrace_Interface_0400 regRet: " + regRet);
          expect(regRet == i).assertTrue();
        };
        let regRet = hiTraceMeter.registerTraceListener(callback);
        console.info("SUB_DFX_DFR_Hitrace_Interface_0400 regRet: " + regRet);
        expect(regRet == -1).assertTrue();
        for (let i = 0; i < 10; i++) {
          let unregRet = hiTraceMeter.unregisterTraceListener(i);
          console.info("SUB_DFX_DFR_Hitrace_Interface_0400 unregRet: " + unregRet);
          expect(unregRet == 0).assertTrue();
        };
        console.info("SUB_DFX_DFR_Hitrace_Interface_0400 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_0400 end");
    })

    /**
     * @tc.name   testHitraceInterface05
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_0500
     * @tc.desc   验证unregisterTraceListener接口传入未注册索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHitraceInterface05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_0500 start");
      try {
        let unregRet = hiTraceMeter.unregisterTraceListener(0);
        expect(unregRet == -1).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_0500 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_0500 end");
    })

    /**
     * @tc.name   testHitraceInterface06
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_0600
     * @tc.desc   验证unregisterTraceListener接口传入无效索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHitraceInterface06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_0600 start");
      try {
        let unregRet = hiTraceMeter.unregisterTraceListener(10);
        expect(unregRet == -2).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_0600 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_0600 end");
    })

    /**
     * @tc.name   testHitraceInterface07
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_0700
     * @tc.desc   验证unregisterTraceListener接口传入null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHitraceInterface07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_0700 start");
      try {
        let unregRet = hiTraceMeter.unregisterTraceListener(null);
        expect(unregRet == -2).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_0700 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_0700 end");
    })

    /**
     * @tc.name   testHitraceInterface08
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_0800
     * @tc.desc   验证unregisterTraceListener接口传入undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHitraceInterface08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_0800 start");
      try {
        let unregRet = hiTraceMeter.unregisterTraceListener(undefined);
        expect(unregRet == -2).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_0800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_0800 end");
    })

    /**
     * @tc.name   testHitraceInterface09
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_0900
     * @tc.desc   验证OH_HiTrace_RegisterTraceListener和OH_HiTrace_UnregisterTraceListener接口正常调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHitraceInterface09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_0900 start");
      try {
        let regRet = testNapi.hiTraceCppListener(0, 0);
        console.info("SUB_DFX_DFR_Hitrace_Interface_0900 regRet: " + regRet);
        expect(regRet == 0).assertTrue();
        let unregRet = testNapi.hiTraceCppListener(1, 0);
        console.info("SUB_DFX_DFR_Hitrace_Interface_0900 unregRet: " + unregRet);
        expect(unregRet == 0).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_0900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_0900 end");
    })

    /**
     * @tc.name   testHitraceInterface10
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_1000
     * @tc.desc   验证OH_HiTrace_RegisterTraceListener接口传入null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHitraceInterface10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_1000 start");
      try {
        let unregRet = testNapi.hiTraceCppListener(0, -1);
        console.info("SUB_DFX_DFR_Hitrace_Interface_1000 unregRet: " + unregRet);
        expect(unregRet == -2).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_1000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_1000 end");
    })

    /**
     * @tc.name   testHitraceInterface11
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_1100
     * @tc.desc   验证OH_HiTrace_RegisterTraceListener接口连续调用11次，OH_HiTrace_UnregisterTraceListener接口连续调用10次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHitraceInterface11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_1100 start");
      try {
        for (let i = 0; i < 10; i++) {
          let regRet = testNapi.hiTraceCppListener(0, 0);
          console.info("SUB_DFX_DFR_Hitrace_Interface_1100 regRet: " + regRet);
          expect(regRet == i).assertTrue();
        };
        let regRet = testNapi.hiTraceCppListener(0, 0);
        console.info("SUB_DFX_DFR_Hitrace_Interface_1100 regRet: " + regRet);
        expect(regRet == -1).assertTrue();
        for (let i = 0; i < 10; i++) {
          let unregRet = testNapi.hiTraceCppListener(1, i);
          console.info("SUB_DFX_DFR_Hitrace_Interface_1100 unregRet: " + unregRet);
          expect(unregRet == 0).assertTrue();
        };
        console.info("SUB_DFX_DFR_Hitrace_Interface_1100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_1100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_1100 end");
    })

    /**
     * @tc.name   testHitraceInterface12
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_1200
     * @tc.desc   验证OH_HiTrace_UnregisterTraceListener接口传入未注册索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHitraceInterface12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_1200 start");
      try {
        let unregRet = testNapi.hiTraceCppListener(1, 1);
        console.info("SUB_DFX_DFR_Hitrace_Interface_1200 unregRet: " + unregRet);
        expect(unregRet == -1).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_1200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_1200 end");
    })

    /**
     * @tc.name   testHitraceInterface13
     * @tc.number SUB_DFX_DFR_Hitrace_Interface_1300
     * @tc.desc   验证OH_HiTrace_UnregisterTraceListener接口传入无效索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHitraceInterface13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hitrace_Interface_1300 start");
      try {
        let unregRet = testNapi.hiTraceCppListener(1, 10);
        console.info("SUB_DFX_DFR_Hitrace_Interface_1300 unregRet: " + unregRet);
        expect(unregRet == -2).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_1300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hitrace_Interface_1300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hitrace_Interface_1300 end");
    })
  })
}