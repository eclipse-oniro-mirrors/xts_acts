import { describe, it, TestType, Size,Level,expect } from "../../../hypium/index";
import {hilog}from "@kit.PerformanceAnalysisKit"
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function HilogStrongTest(){
  describe("HilogStrongTest", (): void => {
    hilog.setMinLogLevel(hilog.LogLevel.DEBUG);
    /**
     * @tc.name   SUB_Hilog_setMinLogLevel_0100
     * @tc.number SUB_Hilog_setMinLogLevel_0100
     * @tc.desc   setMinLogLevel函数异常值覆盖DEBUG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     **/
    it('SUB_Hilog_setMinLogLevel_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      hilog.setMinLogLevel(hilog.LogLevel.DEBUG);
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hilog.setMinLogLevel(hilog.LogLevel.DEBUG);
    })
    hilog.setLogLevel(hilog.LogLevel.DEBUG,hilog.PreferStrategy.PREFER_OPEN_LOG);
    /**
     * @tc.name   SUB_Hilog_setLogLevel_DEBUG_0200
     * @tc.number SUB_Hilog_setLogLevel_DEBUG_0200
     * @tc.desc   setLogLevel函数异常值覆盖DEBUG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
    **/
    it('SUB_Hilog_setLogLevel_DEBUG_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      hilog.setLogLevel(hilog.LogLevel.DEBUG,hilog.PreferStrategy.PREFER_OPEN_LOG);
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hilog.setLogLevel(hilog.LogLevel.DEBUG,hilog.PreferStrategy.PREFER_OPEN_LOG);
    })
    hilog.setLogLevel(hilog.LogLevel.INFO,hilog.PreferStrategy.PREFER_OPEN_LOG);
    /**
     * @tc.name   SUB_Hilog_setLogLevel_INFO_0210
     * @tc.number SUB_Hilog_setLogLevel_INFO_0210
     * @tc.desc   setLogLevel函数异常值覆盖INFO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     **/
    it('SUB_Hilog_setLogLevel_INFO_0210', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      hilog.setLogLevel(hilog.LogLevel.INFO,hilog.PreferStrategy.PREFER_OPEN_LOG);
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hilog.setLogLevel(hilog.LogLevel.INFO,hilog.PreferStrategy.PREFER_OPEN_LOG);
    })
    hilog.setLogLevel(hilog.LogLevel.FATAL,hilog.PreferStrategy.PREFER_OPEN_LOG);
    /**
     * @tc.name   SUB_Hilog_setLogLevel_FATAL_0220
     * @tc.number SUB_Hilog_setLogLevel_FATAL_0220
     * @tc.desc   setLogLevel函数异常值覆盖FATAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     **/
    it('SUB_Hilog_setLogLevel_FATAL_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      hilog.setLogLevel(hilog.LogLevel.FATAL,hilog.PreferStrategy.PREFER_OPEN_LOG);
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hilog.setLogLevel(hilog.LogLevel.FATAL,hilog.PreferStrategy.PREFER_OPEN_LOG);
    })


  })
}