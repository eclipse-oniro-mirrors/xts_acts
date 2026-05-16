import { BusinessError } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit';
import hiAppEvent from '@ohos.hiAppEvent';
import { describe, it, expect, Level } from '@ohos/hypium'
import PerformanceAnalysisKitNdk from 'libentry.so'
import hiAppEventdfx from '@ohos.hiviewdfx.hiAppEvent'
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'hiAppEvent'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function HiAppEvent() {
  describe('HiAppEvent', () => {
    /**
     * @tc.name   hiAppEvent_null_STATISTIC
     * @tc.number SUB_hiAppEvent_null_STATISTIC
     * @tc.desc   write函数异常值覆盖，null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_null_STATISTIC', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.write(null, hiAppEvent.EventType.STATISTIC,null);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });
    })

    /**
     * @tc.name   hiAppEvent_null_SECURITY
     * @tc.number SUB_hiAppEvent_null_SECURITY
     * @tc.desc   write函数异常值覆盖，null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_null_SECURITY', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.write(null, hiAppEvent.EventType.SECURITY,null);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });
    })

    /**
     * @tc.name   hiAppEvent__BEHAVIOR
     * @tc.number SUB_hiAppEvent__BEHAVIOR
     * @tc.desc   write函数异常值覆盖，‘ ’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent__BEHAVIOR', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.write(' ', hiAppEvent.EventType.BEHAVIOR,undefined);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });

    })

    /**
     * @tc.name   hiAppEvent_undefined_BEHAVIOR
     * @tc.number SUB_hiAppEvent_undefined_BEHAVIOR
     * @tc.desc   write函数异常值覆盖，undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_undefined_BEHAVIOR', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.write(undefined, hiAppEvent.EventType.BEHAVIOR,undefined);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });

    })

    /**
     * @tc.name   hiAppEvent_configure_null
     * @tc.number SUB_hiAppEvent_configure_null
     * @tc.desc   configure函数异常值覆盖,null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_configure_null', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.configure(null);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });

    })

    /**
     * @tc.name   hiAppEvent_configure_undefined
     * @tc.number SUB_hiAppEvent_configure_undefined
     * @tc.desc   configure函数异常值覆盖,undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_configure_undefined', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.configure(undefined);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });

    })

    /**
     * @tc.name   hiAppEvent_undefined_STATISTIC
     * @tc.number hiAppEvent_undefined_STATISTIC
     * @tc.desc   write函数异常值覆盖，undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_undefined_STATISTIC', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(undefined, hiAppEvent.EventType.FAULT, undefined, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.write(undefined, hiAppEvent.EventType.STATISTIC, undefined);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(domain, tag, `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(undefined, 'hiAppEvent', undefined);
        done();
      });
    })

    /**
     * @tc.name   hiAppEvent_nullvalue_STATISTIC
     * @tc.number hiAppEvent_nullvalue_STATISTIC
     * @tc.desc   write函数异常值覆盖，第一个参数空值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_nullvalue_STATISTIC', Level.LEVEL1, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write("", hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.write("", hiAppEvent.EventType.STATISTIC, null);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          console.error(`failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info("", 'hiAppEvent', null);
        done();
      });
    })

    /**
     * @tc.name   hiAppEvent_promise_undefined_STATISTIC
     * @tc.number hiAppEvent_promise_undefined_STATISTIC
     * @tc.desc   write函数promise异步调用，异常值覆盖，undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_promise_undefined_STATISTIC', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };

      // 应用事件打点，使用Promise方式作为异步回调
      hiAppEvent.write(undefined, hiAppEvent.EventType.STATISTIC, undefined).then(() => {
        console.info(`success to write event`);
      }).catch((err: BusinessError) => {
        console.error(`code: ${err.code}, message: ${err.message}`);
        expect(err.code === 401 || err.code === -2).assertTrue()
      });
        console.info(undefined, 'hiAppEvent', undefined);
        done();
      });

    /**
     * @tc.name   hiAppEvent_promise_null_STATISTIC
     * @tc.number hiAppEvent_promise_null_STATISTIC
     * @tc.desc   write函数promise异步调用，异常值覆盖，null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_promise_null_STATISTIC', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };

      // 应用事件打点，使用Promise方式作为异步回调
      hiAppEvent.write(null, hiAppEvent.EventType.STATISTIC, null).then(() => {
        console.info(`success to write event`);
      }).catch((err: BusinessError) => {
        console.error(`code: ${err.code}, message: ${err.message}`);
        expect(err.code === 401 || err.code === -2).assertTrue()
      });
      console.info(null, 'hiAppEvent', null);
      done();
    });
  })
}