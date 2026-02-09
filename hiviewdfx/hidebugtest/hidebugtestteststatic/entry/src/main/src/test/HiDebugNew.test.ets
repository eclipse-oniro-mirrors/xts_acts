import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hidebug from '@ohos.hidebug'
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为



function asyncSleep(time:int) {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => resolve(0), time)
  });
}

export function assertNativeMemInfoEqual(nativeMemInfoA: hidebug.NativeMemInfo, nativeMemInfoB: hidebug.NativeMemInfo) {
  expect(nativeMemInfoA.pss == nativeMemInfoB.pss).assertTrue();
  expect(nativeMemInfoA.vss == nativeMemInfoB.vss).assertTrue();
  expect(nativeMemInfoA.rss == nativeMemInfoB.rss).assertTrue();
  expect(nativeMemInfoA.sharedDirty == nativeMemInfoB.sharedDirty).assertTrue();
  expect(nativeMemInfoA.privateDirty == nativeMemInfoB.privateDirty).assertTrue();
  expect(nativeMemInfoA.sharedClean == nativeMemInfoB.sharedClean).assertTrue();
  expect(nativeMemInfoA.privateClean == nativeMemInfoB.privateClean).assertTrue();
};

export function assertNativeMemInfoNotEqual(nativeMemInfoA: hidebug.NativeMemInfo, nativeMemInfoB: hidebug.NativeMemInfo) {
  let result = nativeMemInfoA.pss == nativeMemInfoB.pss &&
    nativeMemInfoA.vss == nativeMemInfoB.vss &&
    nativeMemInfoA.rss == nativeMemInfoB.rss &&
    nativeMemInfoA.sharedDirty == nativeMemInfoB.sharedDirty &&
    nativeMemInfoA.privateDirty == nativeMemInfoB.privateDirty &&
    nativeMemInfoA.sharedClean == nativeMemInfoB.sharedClean &&
    nativeMemInfoA.privateClean == nativeMemInfoB.privateClean
  expect(result).assertFalse();
};


export default function HidebugnewTest() {

  describe("HidebugnewTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.name   testHiprofilerInterface25
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_2500
     * @tc.desc   验证getAppNativeMemInfoAsync接口调用返回内存值正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiprofilerInterface25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2500 start");
      try {
        let nativeMemInfo = await hidebug.getAppNativeMemInfoAsync();
        expect(nativeMemInfo.pss >= 0).assertTrue();
        expect(nativeMemInfo.vss >= 0).assertTrue();
        expect(nativeMemInfo.rss >= 0).assertTrue();
        expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
        expect(nativeMemInfo.privateDirty >= 0).assertTrue();
        expect(nativeMemInfo.sharedClean >= 0).assertTrue();
        expect(nativeMemInfo.privateClean >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_2500 nativeMemInfo:" + "\n"
          + "pss: " + nativeMemInfo.pss + "\n"
          + "vss: " + nativeMemInfo.vss + "\n"
          + "rss: " + nativeMemInfo.rss + "\n"
          + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo.privateClean);
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_2500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2500 end");
    })



    /**
     * @tc.name   testHiprofilerInterface26
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_2600
     * @tc.desc   验证getAppNativeMemInfoWithCache接口传入true返回内存值正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiprofilerInterface26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2600 start");
      try {
        let nativeMemInfo = hidebug.getAppNativeMemInfoWithCache(true);
        expect(nativeMemInfo.pss >= 0).assertTrue();
        expect(nativeMemInfo.vss >= 0).assertTrue();
        expect(nativeMemInfo.rss >= 0).assertTrue();
        expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
        expect(nativeMemInfo.privateDirty >= 0).assertTrue();
        expect(nativeMemInfo.sharedClean >= 0).assertTrue();
        expect(nativeMemInfo.privateClean >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_2600 nativeMemInfo:" + "\n"
          + "pss: " + nativeMemInfo.pss + "\n"
          + "vss: " + nativeMemInfo.vss + "\n"
          + "rss: " + nativeMemInfo.rss + "\n"
          + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo.privateClean);
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_2600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2600 end");
    })


    /**
     * @tc.name   testHiprofilerInterface27
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_2700
     * @tc.desc   验证getAppNativeMemInfoWithCache接口传入false返回内存值正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiprofilerInterface27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2700 start");
      try {
        let nativeMemInfo = hidebug.getAppNativeMemInfoWithCache(false);
        expect(nativeMemInfo.pss >= 0).assertTrue();
        expect(nativeMemInfo.vss >= 0).assertTrue();
        expect(nativeMemInfo.rss >= 0).assertTrue();
        expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
        expect(nativeMemInfo.privateDirty >= 0).assertTrue();
        expect(nativeMemInfo.sharedClean >= 0).assertTrue();
        expect(nativeMemInfo.privateClean >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_2700 nativeMemInfo:" + "\n"
          + "pss: " + nativeMemInfo.pss + "\n"
          + "vss: " + nativeMemInfo.vss + "\n"
          + "rss: " + nativeMemInfo.rss + "\n"
          + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo.privateClean);
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_2700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2700 end");
    })


    /**
     * @tc.name   testHiprofilerInterface29
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_2900
     * @tc.desc   验证getAppNativeMemInfoWithCache接口不传参返回内存值正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2900 start");
      try {
        let nativeMemInfo = hidebug.getAppNativeMemInfoWithCache();
        expect(nativeMemInfo.pss >= 0).assertTrue();
        expect(nativeMemInfo.vss >= 0).assertTrue();
        expect(nativeMemInfo.rss >= 0).assertTrue();
        expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
        expect(nativeMemInfo.privateDirty >= 0).assertTrue();
        expect(nativeMemInfo.sharedClean >= 0).assertTrue();
        expect(nativeMemInfo.privateClean >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_2900 nativeMemInfo:" + "\n"
          + "pss: " + nativeMemInfo.pss + "\n"
          + "vss: " + nativeMemInfo.vss + "\n"
          + "rss: " + nativeMemInfo.rss + "\n"
          + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo.privateClean);
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_2900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2900 end");
    });



    /**
     * @tc.name   testHiprofilerInterface30
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3000
     * @tc.desc   验证getAppNativeMemInfoWithCache接口连续传入true返回内存值不一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3000 start");
      try {
        let nativeMemInfo1 = hidebug.getAppNativeMemInfoWithCache(true);
        await asyncSleep(50);
        let nativeMemInfo2 = hidebug.getAppNativeMemInfoWithCache(true);
        await asyncSleep(50);
        let nativeMemInfo3 = hidebug.getAppNativeMemInfoWithCache(true);
        assertNativeMemInfoNotEqual(nativeMemInfo1, nativeMemInfo2);
        assertNativeMemInfoNotEqual(nativeMemInfo1, nativeMemInfo3);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3000 nativeMemInfo1:" + "\n"
          + "pss: " + nativeMemInfo1.pss + "\n"
          + "vss: " + nativeMemInfo1.vss + "\n"
          + "rss: " + nativeMemInfo1.rss + "\n"
          + "sharedDirty: " + nativeMemInfo1.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo1.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo1.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo1.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3000 nativeMemInfo2:" + "\n"
          + "pss: " + nativeMemInfo2.pss + "\n"
          + "vss: " + nativeMemInfo2.vss + "\n"
          + "rss: " + nativeMemInfo2.rss + "\n"
          + "sharedDirty: " + nativeMemInfo2.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo2.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo2.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo2.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3000 nativeMemInfo3:" + "\n"
          + "pss: " + nativeMemInfo3.pss + "\n"
          + "vss: " + nativeMemInfo3.vss + "\n"
          + "rss: " + nativeMemInfo3.rss + "\n"
          + "sharedDirty: " + nativeMemInfo3.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo3.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo3.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo3.privateClean);
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3000 end");
    })

    /**
     * @tc.name   testHiprofilerInterface31
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3100
     * @tc.desc   验证getAppNativeMemInfoWithCache接口连续传入false返回内存值一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3100 start");
      try {
        let nativeMemInfo1 = hidebug.getAppNativeMemInfoWithCache(false);
        let nativeMemInfo2 = hidebug.getAppNativeMemInfoWithCache(false);
        let nativeMemInfo3 = hidebug.getAppNativeMemInfoWithCache(false);
        assertNativeMemInfoEqual(nativeMemInfo1, nativeMemInfo2);
        assertNativeMemInfoEqual(nativeMemInfo1, nativeMemInfo3);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3100 nativeMemInfo1:" + "\n"
          + "pss: " + nativeMemInfo1.pss + "\n"
          + "vss: " + nativeMemInfo1.vss + "\n"
          + "rss: " + nativeMemInfo1.rss + "\n"
          + "sharedDirty: " + nativeMemInfo1.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo1.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo1.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo1.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3100 nativeMemInfo2:" + "\n"
          + "pss: " + nativeMemInfo2.pss + "\n"
          + "vss: " + nativeMemInfo2.vss + "\n"
          + "rss: " + nativeMemInfo2.rss + "\n"
          + "sharedDirty: " + nativeMemInfo2.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo2.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo2.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo2.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3100 nativeMemInfo3:" + "\n"
          + "pss: " + nativeMemInfo3.pss + "\n"
          + "vss: " + nativeMemInfo3.vss + "\n"
          + "rss: " + nativeMemInfo3.rss + "\n"
          + "sharedDirty: " + nativeMemInfo3.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo3.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo3.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo3.privateClean);
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3100 end");
    })

    /**
     * @tc.name   testHiprofilerInterface33
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3300
     * @tc.desc   验证getAppNativeMemInfoWithCache接口连续传入true稳定性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiprofilerInterface33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3300 start");
      try {
        for (let i = 0; i < 100; i++) {
          let nativeMemInfo = hidebug.getAppNativeMemInfoWithCache(true);
          expect(nativeMemInfo.pss >= 0).assertTrue();
          expect(nativeMemInfo.vss >= 0).assertTrue();
          expect(nativeMemInfo.rss >= 0).assertTrue();
          expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
          expect(nativeMemInfo.privateDirty >= 0).assertTrue();
          expect(nativeMemInfo.sharedClean >= 0).assertTrue();
          expect(nativeMemInfo.privateClean >= 0).assertTrue();
          console.info("SUB_DFX_DFR_Hiprofiler_Interface_3300 nativeMemInfo:" + i + "\n"
            + "pss: " + nativeMemInfo.pss + "\n"
            + "vss: " + nativeMemInfo.vss + "\n"
            + "rss: " + nativeMemInfo.rss + "\n"
            + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
            + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
            + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
            + "privateClean: " + nativeMemInfo.privateClean);
        }
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3300 true 100 times success")
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3300 end");
    })

    /**
     * @tc.name   testHiprofilerInterface34
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3400
     * @tc.desc   验证getAppNativeMemInfoWithCache接口连续传入false稳定性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiprofilerInterface34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3400 start");
      try {
        for (let i = 0; i < 100; i++) {
          let nativeMemInfo = hidebug.getAppNativeMemInfoWithCache(false);
          expect(nativeMemInfo.pss >= 0).assertTrue();
          expect(nativeMemInfo.vss >= 0).assertTrue();
          expect(nativeMemInfo.rss >= 0).assertTrue();
          expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
          expect(nativeMemInfo.privateDirty >= 0).assertTrue();
          expect(nativeMemInfo.sharedClean >= 0).assertTrue();
          expect(nativeMemInfo.privateClean >= 0).assertTrue();
          console.info("SUB_DFX_DFR_Hiprofiler_Interface_3400 nativeMemInfo:" + i + "\n"
            + "pss: " + nativeMemInfo.pss + "\n"
            + "vss: " + nativeMemInfo.vss + "\n"
            + "rss: " + nativeMemInfo.rss + "\n"
            + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
            + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
            + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
            + "privateClean: " + nativeMemInfo.privateClean);
        }
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3400 false 100 times success")
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3400 end");
    })

    /**
     * @tc.name   testHiprofilerInterface41
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4100
     * @tc.desc   验证getAppVMObjectUsedSize接口调用返回内存值正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4100 start");
      try {
        let appVMObjectUsed = hidebug.getAppVMObjectUsedSize();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4100 appVMObjectUsed: " + appVMObjectUsed);
        expect(appVMObjectUsed >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4100 success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4100 end");
    });

    /**
     * @tc.name   testHiprofilerInterface42
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4200
     * @tc.desc   验证getAppVMObjectUsedSize接口不连续调用测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4200 start");
      try {
        let appVMObjectUsed1 = hidebug.getAppVMObjectUsedSize();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4200 appVMObjectUsed1: " + appVMObjectUsed1);
        await asyncSleep(5);
        let appVMObjectUsed2 = hidebug.getAppVMObjectUsedSize();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4200 appVMObjectUsed2: " + appVMObjectUsed2);
        expect(appVMObjectUsed1 >= 0).assertTrue();
        expect(appVMObjectUsed2 >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4200 success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4200 end");
    });

    /**
     * @tc.name   testHiprofilerInterface43
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4300
     * @tc.desc   验证getAppVMObjectUsedSize接口连续调用测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4300 start");
      try {
        let appVMObjectUsed1 = hidebug.getAppVMObjectUsedSize();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4300 appVMObjectUsed1: " + appVMObjectUsed1);
        let appVMObjectUsed2 = hidebug.getAppVMObjectUsedSize();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4300 appVMObjectUsed2: " + appVMObjectUsed2);
        expect(appVMObjectUsed1 >= 0).assertTrue();
        expect(appVMObjectUsed2 >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4300 success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4300 end");
    });

    /**
     * @tc.name   testHiprofilerInterface44
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4400
     * @tc.desc   验证getAppVMObjectUsedSize接口调用稳定性测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiprofilerInterface44', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4400 start");
      try {
        for (let i = 0; i < 100; i++) {
          let appVMObjectUsed = hidebug.getAppVMObjectUsedSize();
          expect(appVMObjectUsed >= 0).assertTrue();
          console.info("SUB_DFX_DFR_Hiprofiler_Interface_4400 appVMObjectUsed: " + appVMObjectUsed);
        }
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4400 100 times success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4400 end");
    });



    /**
     * @tc.name   testHiprofilerInterface45
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4500
     * @tc.desc   验证getGraphicsMemorySummary接口正常入参测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4500 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(5);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4500 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4500 success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4500 end");
    });

    /**
     * @tc.name   testHiprofilerInterface46
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4600
     * @tc.desc   验证getGraphicsMemorySummary接口入参下边界值测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface46', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4600 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(2);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4600 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4600 success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4600 end");
    });

    /**
     * @tc.name   testHiprofilerInterface47
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4700
     * @tc.desc   验证getGraphicsMemorySummary接口入参上边界值测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface47', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4700 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(3600);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4700 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4700 success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4700 end");
    });

    /**
     * @tc.name   testHiprofilerInterface48
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4800
     * @tc.desc   验证getGraphicsMemorySummary接口入参为空测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface48', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4800 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary();
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4800 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4800 success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4800 end");
    });

    /**
     * @tc.name   testHiprofilerInterface49
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4900
     * @tc.desc   验证getGraphicsMemorySummary接口入参下边界以下值测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface49', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4900 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(0);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4900 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4900 success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4900 end");
    });

    /**
     * @tc.name   testHiprofilerInterface50
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5000
     * @tc.desc   验证getGraphicsMemorySummary接口入参上边界以上值测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5000 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(4000);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5000 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5000 success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5000 end");
    });

    /**
     * @tc.name   testHiprofilerInterface53
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5300
     * @tc.desc   验证getGraphicsMemorySummary接口入参为负数测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiprofilerInterface53', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5300 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(-5);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5300 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5300 success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5300 end");
    });

    /**
     * @tc.name   testHiprofilerInterface54
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5400
     * @tc.desc   验证getGraphicsMemorySummary接口调用稳定性测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiprofilerInterface54', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5400 start");
      try {
        for (let i = 0; i < 100; i++) {
          let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(5);
          let gl = graphicsMemorySummary.gl
          let graph = graphicsMemorySummary.graph
          console.info("SUB_DFX_DFR_Hiprofiler_Interface_5400 graphicsMemorySummary gl: " + gl + " graph: " + graph);
          expect(gl >= 0).assertTrue();
          expect(graph >= 0).assertTrue();
        }
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5400 100 times success");
        done();
      } catch (err: BusinessError) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5400 end");
    });














  })

}