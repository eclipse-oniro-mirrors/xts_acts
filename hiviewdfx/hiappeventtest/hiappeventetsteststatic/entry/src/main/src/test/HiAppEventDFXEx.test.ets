import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import { hilog, hiAppEvent } from '@kit.PerformanceAnalysisKit';

let domain: int = 0x2020; //日志标识,0x2828作为测试框架的业务标识
let tag: string = 'hiAppEventStrongTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

interface errobj {
  code: int;
  message: string;
}

export default function hiAppEventStrongTest() {
  describe('hiAppEventStrongTest', (): void => {
    hilog.info(domain, tag, 'describe start');
    /**
     * @tc.name   hiAppEventStrongTest_0001
     * @tc.number hiAppEventStrongTest_0001
     * @tc.desc   验证startJsCpuProfiling接口测试-覆盖第一个参数为空字符串值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventStrongTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "hiAppEventStrongTest_0001 start");
      try {
        let holder = hiAppEvent.addWatcher({
          name: "hiAppEventStrongTest_0001",
          appEventFilters: [{
            domain: hiAppEvent.domain.OS,
            names: ["test_name"]
          }],
        });
        holder.setRow(2);
        hiAppEvent.write({
          domain: hiAppEvent.domain.OS,
          name: "test_name",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "key_int": 71
          }
        }, (err, value) => {
          if (err) {
            console.error(`hiAppEventStrongTest_0001 failed to write event because ${err.code}`);
            expect(err.code === 401).assertFalse();
            done();
          }
          console.log(`hiAppEventStrongTest_0001 success to write event: ${value}`)
        });
        if (holder != null) {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            hilog.info(domain, tag, "hiAppEventStrongTest_0001 eventPkg is null");
            return;
          }
          expect(eventPkg.row === 1).assertTrue();
          expect(eventPkg.packageId >= 0).assertTrue();
          expect(eventPkg.size >= 0).assertTrue();
          expect(eventPkg.data !== "").assertTrue();
          expect(eventPkg.appEventInfos.length >= 0).assertTrue();
        }
        done();
      } catch (error) {
        hilog.error(domain, tag, `hiAppEventStrongTest_0001 > error code: ${error.code}, error msg: ${error.message}`);
        expect(error.code === 401).assertFalse();
        done();
      }
      hilog.info(domain, tag, "hiAppEventStrongTest_0001 end");
    });
    hilog.info(domain, tag, 'describe end');
  })
}