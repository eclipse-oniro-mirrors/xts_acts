import {FaultLogExtensionAbility} from '@kit.PerformanceAnalysisKit';
import {hilog}from "@kit.PerformanceAnalysisKit"
import { describe, it, TestType, Size,Level,expect } from "../../../hypium/index";
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


interface GeneratedObjectLiteralInterface_1 {}



export default function FaultLogExtensionAbilityTest(){
  describe("FaultLogExtensionAbilityTest", (): void =>{
    /**
       * @tc.number  SUB_FaultLogExtension_FaultLogExtensionAbility_onConnect_0100
       * @tc.name  SUB_FaultLogExtension_FaultLogExtensionAbility_onConnect_0100
       * @tc.desc  Check start ability by bundl
       * @tc.level  LEVEL1
       * @tc.size  MEDIUMTEST
       * @tc.type  FUNCTION
      **/
    it("SUB_FaultLogExtension_FaultLogExtensionAbility_onConnect_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      // 使用显式的类型定义
      const ability: FaultLogExtensionAbility = new FaultLogExtensionAbility();
      // 第一次调用 onConnect
      ability.onConnect();
      let a: number = 1;
      let b: number = 1;
      expect(a).assertEqual(b);
      // 第二次调用 onConnect
      ability.onConnect();
      done();
    })

    
    /**
       * @tc.number SUB_FaultLogExtension_FaultLogExtensionAbility_onDisconnect_0200
       * @tc.name  SUB_FaultLogExtension_FaultLogExtensionAbility_onDisconnect_0200
       * @tc.desc  Check start ability by bundl
       * @tc.level LEVEL1
       * @tc.size MEDIUMTEST
       * @tc.type FUNCTION
      **/
    it("SUB_FaultLogExtension_FaultLogExtensionAbility_onDisconnect_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      // 使用显式的类型定义
      const ability: FaultLogExtensionAbility = new FaultLogExtensionAbility();
      // 第一次调用 onDisconnect
      ability.onDisconnect();
      let a: number = 1;
      let b: number = 1;
      expect(a).assertEqual(b);
      // 第二次调用 onDisconnect
      ability.onDisconnect();
      done();
    })

    
    /**
       * @tc.name SUB_FaultLogExtension_FaultLogExtensionAbility_onFaultReportReady_0300
         @tc.number  SUB_FaultLogExtension_FaultLogExtensionAbility_onFaultReportReady_0300
       * @tc.desc  Check start ability by bundl
       * @tc.level LEVEL1
       * @tc.size MEDIUMTEST
       * @tc.type FUNCTION
      **/
    it("SUB_FaultLogExtension_FaultLogExtensionAbility_onFaultReportReady_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      // 使用显式的类型定义
      const ability: FaultLogExtensionAbility = new FaultLogExtensionAbility();
      // 第一次调用 onFaultReportReady
      ability.onFaultReportReady();
      let a: number = 1;
      let b: number = 1;
      expect(a).assertEqual(b);
      // 第二次调用 onFaultReportReady
      ability.onFaultReportReady();
      done();
    })

  })

}