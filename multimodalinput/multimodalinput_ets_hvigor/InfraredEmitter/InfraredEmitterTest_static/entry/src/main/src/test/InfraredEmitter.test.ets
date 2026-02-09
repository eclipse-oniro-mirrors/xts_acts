import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import infraredEmitter from '@ohos.multimodalInput.infraredEmitter';
import { BusinessError } from "@ohos.base";
import hilog from '@ohos.hilog';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function InfraredEmitterTest() {

  describe("InfraredEmitterTest", (): void => {
    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.name   SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100
     * @tc.number SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100
     * @tc.desc   Test getInfraredFrequencies interface to query the frequency range of infrared signals supported by the phone.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100";
        try {
          let frequencies: infraredEmitter.InfraredFrequency[] = [{
            max: 0,
            min: 0
          }];
          frequencies = infraredEmitter.getInfraredFrequencies();
          console.info(`${caseName} getInfraredFrequencies success, frequencies: ${JSON.stringify(frequencies)}`);
          ExpectTrue(Array.isArray(frequencies));
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} get infrared frequencies failed, error: ${JSON.stringify(error,
            [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

  })
}