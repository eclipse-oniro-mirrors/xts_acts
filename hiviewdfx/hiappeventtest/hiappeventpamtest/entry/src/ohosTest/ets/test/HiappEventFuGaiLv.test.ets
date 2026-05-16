import { hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';


export default function HiappEventFuGaiLv() {
  describe('HiappEventFuGaiLv', () => {
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
     * @tc.number SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_001
     * @tc.name SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_001
     * @tc.desc SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_001 start");
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      // 应用事件打点，使用Promise方式作为异步回调
      hiAppEvent.write({
        domain: "test_domain",
        name: "test_event",
        eventType: hiAppEvent.EventType.BEHAVIOR,
        params: eventParams,
      }).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `success to write event`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `code: ${err.code}, message: ${err.message}`);
        expect(false).assertEqual(true);
        done();
      });
      console.info("====> SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_001 end");
    });

    /**
     * @tc.number SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_002
     * @tc.name SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_002
     * @tc.desc SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      console.info("====> SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_002 start");
      try {
        hiAppEvent.addWatcher({
          name: "watcherchinanum1",
          // 订阅过滤条件，这里是订阅了系统事件领域的应用崩溃事件
          appEventFilters: [
            {
              domain: hiAppEvent.domain.OS,
              names: [hiAppEvent.event.APP_CRASH],
              eventTypes: [hiAppEvent.EventType.FAULT, hiAppEvent.EventType.BEHAVIOR, hiAppEvent.EventType.STATISTIC, hiAppEvent.EventType.SECURITY]
            }
          ],
          // 设置触发onTrigger回调的条件，这里是当满足事件总数量达到10个或事件总大小达到1000byte或事件发生超过30s时会触发回调
          triggerCondition: {
            row: 10,
            size: 1000,
            timeOut: 1
          },
          // 实现onTrigger回调，结合triggerCondition使用，满足回调条件触发回调，接收到回调通知后，使用takeNext()查询订阅的事件
          onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
            if (holder == null) {
              hilog.error(0x0000, 'hiAppEvent', "holder is null");
              return;
            }
            hilog.info(0x0000, 'hiAppEvent', `curRow=${curRow}, curSize=${curSize}`);
            let eventPkg: hiAppEvent.AppEventPackage | null = null;
            while ((eventPkg = holder.takeNext()) != null) {
              hilog.info(0x0000, 'hiAppEvent', `eventPkg.packageId=${eventPkg.packageId}`);
              hilog.info(0x0000, 'hiAppEvent', `eventPkg.row=${eventPkg.row}`);
              hilog.info(0x0000, 'hiAppEvent', `eventPkg.size=${eventPkg.size}`);
              for (const eventInfo of eventPkg.data) {
                hilog.info(0x0000, 'hiAppEvent', `eventPkg.data=${eventInfo}`);
              }
            }
          }
        });
        hiAppEvent.removeWatcher({
          "name": "watcherchinanum1"
        })
        done();
      } catch (err) {
        console.error(`testHiAppEventSetPam03 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
      console.info("====> SUB_DFX_DFT_HIPPEVENT_HiappEventFuGaiLv_002 end");
    });

  })
}