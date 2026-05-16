import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'
import fs from '@ohos.file.fs';
import Utils from './Util.test';

let domain: int = 0xA8A8; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'configEventPolicyTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为


interface errobj {
  code: number;
  message: string;
}

export default function configEventPolicyStrongTest() {
  describe('configEventPolicyTestAdapt001', (): void => {
    hilog.info(domain, tag, 'describe start');
    /**
     * @tc.name   testHiAppEventconfigEventPolicy020
     * @tc.number testHiAppEventconfigEventPolicy020
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-MainThreadJank-autoStopSampling为false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventconfigEventPolicy020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy020 start`);
        let policy: hiAppEvent.EventPolicy = {
          "mainThreadJankPolicy": {
            "logType": 1,
            "sampleInterval": 100,
            "ignoreStartupTime": 11,
            "sampleCount": 21,
            "reportTimesPerApp": 3,
            "autoStopSampling": false
          }
        };
        hiAppEvent.configEventPolicy(policy).then(() => {
          hilog.info(domain, tag, `testHiAppEventconfigEventPolicy020 configEventPolicy call successful`);
          done();
        }).catch((err: Error) => {
          hilog.error(domain, tag, 'testHiAppEventconfigEventPolicy020 message :(%{public}s', err.message);
          expect(false).assertTrue();
          done();
        });
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy020 end`);
      })
    /**
     * @tc.name   testHiAppEventconfigEventPolicy021
     * @tc.number testHiAppEventconfigEventPolicy021
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiAppEventconfigEventPolicy021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy021 start`);
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy": undefined
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.error(domain, tag, `Unexpected success for undefined policy`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, 'testHiAppEventconfigEventPolicy001 Code: ${err?.code}, message: ${err?.message}');
        expect(false).assertTrue;
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy021 end`);
    })
  })
}
