import hiTraceChain from '@ohos.hiTraceChain';
import { describe, it, TestType, Size,Level,expect } from "../../../hypium/index";
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为



export default function hiTraceChainStrongTest() {

  describe("hiTraceChainStrongTest", (): void => {
    hiTraceChain.getId();
    /**
        * @tc.name  SUB_HiTraceChain_getId_0100
        * @tc.number  SUB_HiTraceChain_getId_0100
        * @tc.desc  Check start ability by bundl
        * @tc.level LEVEL1
        * @tc.size  MEDIUMTEST
        * @tc.type  FUNCTION
       **/
    it("SUB_HiTraceChain_getId_0100",TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done :() => void): Promise<void> => {
      await Utils.msSleep(1000)
      hiTraceChain.getId();
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hiTraceChain.getId();
    })

    hiTraceChain.createSpan();
    /**
        * @tc.name  SUB_HiTraceChain_createSpan_0200
        * @tc.number SUB_HiTraceChain_createSpan_0200
        * @tc.desc  Check start ability by bundl
        * @tc.level LEVEL1
        * @tc.size MEDIUMTEST
        * @tc.type FUNCTION
       **/
    it("SUB_HiTraceChain_createSpan_0200",TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done :() => void): Promise<void> =>{
      await Utils.msSleep(1000)
      hiTraceChain.createSpan();
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hiTraceChain.createSpan();
    })

  })

}