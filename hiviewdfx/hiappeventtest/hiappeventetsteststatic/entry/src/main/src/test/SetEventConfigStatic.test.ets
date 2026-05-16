import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'hiappeventsetEventConfigTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function setEventConfigStrongTest() {
  describe('setEventConfigStrongTest', (): void => {
    hilog.info(domain, tag, 'describe start');
    /**
     * @tc.name   testsetEventConfig001
     * @tc.number testsetEventConfig001
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters-names数组为空数组,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testsetEventConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testsetEventConfig001 start')
      let params: Record<string, hiAppEvent.ParamType> = {
        "log_type": "1",
        "sample_interval": "100",
        "ignore_startup_time": "11",
        "sample_count": "21",
        "report_times_per_app": "3"
      };
      hiAppEvent.setEventConfig(hiAppEvent.event.MAIN_THREAD_JANK, params).then(() => {
        hilog.info(domain, tag, `Successfully set sampling stack parameters.`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `testHiAppEventconfigEventPolicy002 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(domain, tag, 'testsetEventConfig001 end')
    })

  })
}