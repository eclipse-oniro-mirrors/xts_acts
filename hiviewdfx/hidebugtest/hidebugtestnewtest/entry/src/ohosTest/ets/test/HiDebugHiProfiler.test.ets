import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import hidebug from '@ohos.hidebug';
import testNapi from 'libentry.so';

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
};

export default function ActsHiDebugHiProfilerTest() {
  describe('ActsHiDebugHiProfilerTest', () => {
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
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0100
     * @tc.name testHidebugHiprofilerInterface01
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数传入nullptr，返回值11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0100 start");
      try {
        let res = testNapi.startProfilerNull(0);
        expect(res == 11400410).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0200
     * @tc.name testHidebugHiprofilerInterface02
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数maxDuration传入0，返回值11400411
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0200 start");
      try {
        let res = testNapi.startProfiler(0, 0, 1, 30, 1, 384);
        expect(res == 11400411).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0300
     * @tc.name testHidebugHiprofilerInterface03
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数maxDuration传入3601，返回值11400411
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0300 start");
      try {
        let res = testNapi.startProfiler(0, 3601, 1, 30, 1, 384);
        expect(res == 11400411).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0400
     * @tc.name testHidebugHiprofilerInterface04
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数filterSize传入0，返回值11400412
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0400 start");
      try {
        let res = testNapi.startProfiler(0, 30, 0, 30, 1, 384);
        expect(res == 11400412).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0400 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0500
     * @tc.name testHidebugHiprofilerInterface05
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数filterSize传入4294967296，返回值11400412
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0500 start");
      try {
        let res = testNapi.startProfiler(0, 30, 4294967296, 30, 1, 384);
        expect(res == 11400412).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0500 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0600
     * @tc.name testHidebugHiprofilerInterface06
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数maxStackDepth传入-1，返回值11400413
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0600 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, -1, 1, 384);
        expect(res == 11400413).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0600 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0700
     * @tc.name testHidebugHiprofilerInterface07
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数maxStackDepth传入31，返回值11400413
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0700 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, 31, 1, 384);
        expect(res == 11400413).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0700 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0800
     * @tc.name testHidebugHiprofilerInterface08
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数statisticsInterval传入-1，返回值11400414
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0800 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, 30, -1, 384);
        expect(res == 11400414).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0900
     * @tc.name testHidebugHiprofilerInterface09
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数statisticsInterval传入3601，返回值11400414
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0900 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, 30, 3601, 384);
        expect(res == 11400414).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1000
     * @tc.name testHidebugHiprofilerInterface10
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数sampleInterval传入383，返回值11400415
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1000 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, 30, 1, 383);
        expect(res == 11400415).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1000 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1100
     * @tc.name testHidebugHiprofilerInterface11
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数sampleInterval传入4294967296，返回值11400415
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1100 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, 30, 1, 4294967296);
        expect(res == 11400415).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1200
     * @tc.name testHidebugHiprofilerInterface12
     * @tc.desc 验证OH_HiDebug_StartProfiler接口type参数传入无效参数，返回值11400416
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1200 start");
      try {
        let res = testNapi.startProfiler(5, 30, 1, 30, 1, 384);
        expect(res == 11400416).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1300
     * @tc.name testHidebugHiprofilerInterface13
     * @tc.desc 验证调用OH_HiDebug_StartProfiler接口失败，再调用OH_HiDebug_StopProfiler接口，返回值11400430
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1300 start");
      try {
        let res = testNapi.stopProfiler();
        expect(res == 11400430).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1400
     * @tc.name testHidebugHiprofilerInterface14
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400120
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1400 start");
      try {
        expect(testNapi.checkHidebugTraceStorageLimit() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1400 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1500
     * @tc.name testHidebugHiprofilerInterface15
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1500 start");
      try {
        expect(testNapi.checkHidebugSuccess() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1500 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1600
     * @tc.name testHidebugHiprofilerInterface16
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400420
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1600 start");
      try {
        expect(testNapi.checkHidebugPermissionDenied() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1600 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1700
     * @tc.name testHidebugHiprofilerInterface17
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400421
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1700 start");
      try {
        expect(testNapi.checkHidebugAlreadyStarted() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1700 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1800
     * @tc.name testHidebugHiprofilerInterface18
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400422
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1800 start");
      try {
        expect(testNapi.checkHidebugNotStarted() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1900
     * @tc.name testHidebugHiprofilerInterface19
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400423
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1900 start");
      try {
        expect(testNapi.checkHidebugProcessOverlimit() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2000
     * @tc.name testHidebugHiprofilerInterface20
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400424
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2000 start");
      try {
        expect(testNapi.checkHidebugConflict() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2000 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2100
     * @tc.name testHidebugHiprofilerInterface21
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400425
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2100 start");
      try {
        expect(testNapi.checkHidebugAutoStoppedByDuration() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2200
     * @tc.name testHidebugHiprofilerInterface22
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400426
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2200 start");
      try {
        expect(testNapi.checkHidebugDailyQuotaExceeded() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2300
     * @tc.name testHidebugHiprofilerInterface23
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400427
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2300 start");
      try {
        expect(testNapi.checkHidebugCpuOverloaded() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2400
     * @tc.name testHidebugHiprofilerInterface24
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400428
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2400 start");
      try {
        expect(testNapi.checkHidebugMemPressureCritical() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2400 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2500
     * @tc.name testHidebugHiprofilerInterface25
     * @tc.desc 验证OH_HiDebug_StartProfiler接口错误码覆盖: 11400429
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2500 start");
      try {
        expect(testNapi.checkHidebugStoragePressureCritical() == true).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2500 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2600
     * @tc.name testHidebugHiprofilerInterface26
     * @tc.desc 验证OH_HiDebug_StartProfiler接口type参数传入THREAD，config参数maxDuration传入0，返回值11400411
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2600 start");
      try {
        let res = testNapi.startProfiler(1, 0, 1, 30, 1, 384);
        expect(res == 11400411).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2600 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2700
     * @tc.name testHidebugHiprofilerInterface27
     * @tc.desc 验证OH_HiDebug_StartProfiler接口type参数传入NATIVE，config参数maxDuration传入0，返回值11400411
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2700 start");
      try {
        let res = testNapi.startProfiler(2, 0, 1, 30, 1, 384);
        expect(res == 11400411).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2700 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2800
     * @tc.name testHidebugHiprofilerInterface28
     * @tc.desc 验证OH_HiDebug_StartProfiler接口type参数传入GPU，config参数maxDuration传入0，返回值11400411
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2800 start");
      try {
        let res = testNapi.startProfiler(3, 0, 1, 30, 1, 384);
        expect(res == 11400411).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2900
     * @tc.name testHidebugHiprofilerInterface29
     * @tc.desc 验证OH_HiDebug_StartProfiler接口type参数传入GLOBAL_HANDLE，config参数maxDuration传入0，返回值11400411
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2900 start");
      try {
        let res = testNapi.startProfiler(4, 0, 1, 30, 1, 384);
        expect(res == 11400411).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_2900 end");
    })
  })
}