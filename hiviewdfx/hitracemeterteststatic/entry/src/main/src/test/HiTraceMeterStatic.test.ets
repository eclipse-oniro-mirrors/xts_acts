import {hiTraceMeter} from '@kit.PerformanceAnalysisKit';

import { describe, it, TestType, Size,Level,expect } from "../../../hypium/index";
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function hiTraceMeterStrongTest() {
  describe("hiTraceMeterStrongTest", (): void => {
    hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO);
    /**
        * @tc.number SUB_HiTracMeter_finishSyncTrace_0100
        * @tc.name   SUB_HiTracMeter_finishSyncTrace_0100
        * @tc.desc   Check start ability by bundl
        * @tc.level  LEVEL1
        * @tc.size   MEDIUMTEST
        * @tc.type   FUNCTION
       **/
    it("SUB_HiTracMeter_finishSyncTrace_0100",TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done :() => void): Promise<void> => {
      await Utils.msSleep(1000)
      hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO);
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO);
    })
    hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.CRITICAL);
    /**
        * @tc.number SUB_HiTracMeter_finishSyncTrace_0110
        * @tc.name SUB_HiTracMeter_finishSyncTrace_0110
        * @tc.desc  Check start ability by bundl
        * @tc.level LEVEL0
        * @tc.size MEDIUMTEST
        * @tc.type FUNCTION
       **/
    it("SUB_HiTracMeter_finishSyncTrace_0110",TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done :() => void): Promise<void> => {
      await Utils.msSleep(1000)
      hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.CRITICAL);
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.CRITICAL);
    });

  })

}